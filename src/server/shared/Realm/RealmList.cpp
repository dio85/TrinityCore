/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "RealmList.h"
#include "BattlenetRpcErrorCodes.h"
#include "Config.h"
#include "CryptoRandom.h"
#include "DatabaseEnv.h"
#include "DeadlineTimer.h"
#include "Log.h"
#include "MapUtils.h"
#include "ProtobufJSON.h"
#include "Resolver.h"
#include "Util.h"
#include "RealmList.pb.h"
#include "StringConvert.h"
#include "advstd.h"
#include <boost/asio/ip/tcp.hpp>
#include <charconv>
#include <utility>
#include <zlib.h>

namespace
{
    bool CompressJson(std::string const& json, std::vector<uint8>* compressed)
    {
        uLong uncompressedLength = uLong(json.length() + 1);
        uLong compressedLength = compressBound(uLong(json.length()));
        compressed->resize(compressedLength + 4);
        memcpy(compressed->data(), &uncompressedLength, sizeof(uncompressedLength));

        if (compress(compressed->data() + 4, &compressedLength, reinterpret_cast<uint8 const*>(json.data()), uncompressedLength) != Z_OK)
        {
            compressed->clear();
            return false;
        }

        compressed->resize(compressedLength + 4);   // trim excess bytes
        return true;
    }
}

RealmList::RealmList() : _updateInterval(0)
{}

RealmList::~RealmList() = default;

RealmList* RealmList::Instance()
{
    static RealmList instance;
    return &instance;
}

// Load the realm list from the database
void RealmList::Initialize(Trinity::Asio::IoContext& ioContext, uint32 updateInterval)
{
    _updateInterval = updateInterval;
    _updateTimer = std::make_unique<Trinity::Asio::DeadlineTimer>(ioContext);
    _resolver = std::make_unique<Trinity::Net::Resolver>(ioContext);

    ClientBuild::LoadBuildInfo();
    // Get the content of the realmlist table in the database
    UpdateRealms();
}

void RealmList::Close()
{
    _updateTimer->cancel();
}

void RealmList::UpdateRealm(Realm& realm, Battlenet::RealmHandle const& id, uint32 build, std::string const& name,
    std::vector<boost::asio::ip::address>&& addresses,
    uint16 port, uint8 icon, RealmFlags flag, uint8 timezone, AccountTypes allowedSecurityLevel,
    RealmPopulationState population)
{
    realm.Id = id;
    realm.Build = build;
    if (realm.Name != name)
        realm.SetName(name);
    realm.Type = icon;
    realm.Flags = flag;
    realm.Timezone = timezone;
    realm.AllowedSecurityLevel = allowedSecurityLevel;
    realm.PopulationLevel = population;
    realm.Addresses = std::move(addresses);
    realm.Port = port;
}

void RealmList::UpdateRealms()
{
    TC_LOG_DEBUG("realmlist", "Updating Realm List...");

    LoginDatabasePreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_REALMLIST);
    PreparedQueryResult result = LoginDatabase.Query(stmt);

    std::map<Battlenet::RealmHandle, std::string> existingRealms;
    for (auto const& p : _realms)
        existingRealms[p.first] = p.second->Name;

    std::unordered_set<std::string> newSubRegions;
    RealmMap newRealms;

    // Circle through results and add them to the realm map
    if (result)
    {
        do
        {
            Field* fields = result->Fetch();
            uint32 realmId = fields[0].GetUInt32();
            std::string name = fields[1].GetString();
            std::vector<boost::asio::ip::address> addresses;

            for (std::size_t i = 0; i < 4; ++i)
            {
                if (Optional<std::string_view> addressStr = fields[2 + i].GetStringViewOrNull())
                {
                    for (boost::asio::ip::tcp::endpoint const& endpoint : _resolver->ResolveAll(*addressStr, ""))
                    {
                        boost::asio::ip::address address = endpoint.address();
                        if (advstd::ranges::contains(addresses, address))
                            continue;

                        addresses.push_back(std::move(address));
                    }
                }
            }

            if (addresses.empty())
            {
                TC_LOG_ERROR("realmlist", "Could not resolve any address for realm \"{}\" id {}", name, realmId);
                continue;
            }

            uint16 port = fields[6].GetUInt16();
            uint8 icon = fields[7].GetUInt8();
            if (icon == REALM_TYPE_FFA_PVP)
                icon = REALM_TYPE_PVP;
            if (icon >= MAX_CLIENT_REALM_TYPE)
                icon = REALM_TYPE_NORMAL;
            RealmFlags flag = ConvertLegacyRealmFlags(Trinity::Legacy::RealmFlags(fields[8].GetUInt8()));
            uint8 timezone = fields[9].GetUInt8();
            uint8 allowedSecurityLevel = fields[10].GetUInt8();
            RealmPopulationState pop = ConvertLegacyPopulationState(Trinity::Legacy::RealmFlags(fields[8].GetUInt8()), fields[11].GetFloat());
            uint32 build = fields[12].GetUInt32();
            uint8 region = fields[13].GetUInt8();
            uint8 battlegroup = fields[14].GetUInt8();

            Battlenet::RealmHandle id{ region, battlegroup, realmId };

            UpdateRealm(*newRealms.try_emplace(id, std::make_shared<Realm>()).first->second, id, build, name, std::move(addresses), port, icon,
                flag, timezone, (allowedSecurityLevel <= SEC_ADMINISTRATOR ? AccountTypes(allowedSecurityLevel) : SEC_ADMINISTRATOR), pop);
            newRealms[id]->ContentSetId = fields[15].GetUInt32();

            newSubRegions.insert(Battlenet::RealmHandle{ region, battlegroup, 0 }.GetAddressString());

            auto buildAddressesLogText = [&]
                {
                    std::string text;
                    for (boost::asio::ip::address const& address : newRealms[id]->Addresses)
                    {
                        text += address.to_string();
                        text += ' ';
                    }
                    return text;
                };

            if (!existingRealms.erase(id))
                TC_LOG_INFO("realmlist", "Added realm \"{}\" at {}(port {}).", name, buildAddressesLogText(), port);
            else
                TC_LOG_DEBUG("realmlist", "Updating realm \"{}\" at {}(port {}).", name, buildAddressesLogText(), port);
        } while (result->NextRow());
    }

    for (auto itr = existingRealms.begin(); itr != existingRealms.end(); ++itr)
        TC_LOG_INFO("realmlist", "Removed realm \"{}\".", itr->second);

    {
        std::scoped_lock lock(_realmsMutex);

        _subRegions.swap(newSubRegions);
        _realms.swap(newRealms);
        _removedRealms.swap(existingRealms);

        if (_currentRealmId)
            if (std::shared_ptr<Realm> realm = Trinity::Containers::MapGetValuePtr(_realms, *_currentRealmId))
                _currentRealmId = realm->Id;    // fill other fields of realm id
    }

    if (_updateInterval)
    {
        _updateTimer->expires_after(std::chrono::seconds(_updateInterval));
        _updateTimer->async_wait([this](boost::system::error_code const& error)
            {
                if (error)
                    return;

                UpdateRealms();
            });
    }
}

std::shared_ptr<Realm const> RealmList::GetRealm(Battlenet::RealmHandle const& id) const
{
    std::shared_lock lock(_realmsMutex);
    return Trinity::Containers::MapGetValuePtr(_realms, id);
}

Battlenet::RealmHandle RealmList::GetCurrentRealmId() const
{
    return _currentRealmId ? *_currentRealmId : Battlenet::RealmHandle();
}

void RealmList::SetCurrentRealmId(Battlenet::RealmHandle const& id)
{
    _currentRealmId = id;
}

std::shared_ptr<Realm const> RealmList::GetCurrentRealm() const
{
    if (_currentRealmId)
        return GetRealm(*_currentRealmId);
    return nullptr;
}

std::vector<std::string> RealmList::GetSubRegions() const
{
    std::shared_lock lock(_realmsMutex);
    return { _subRegions.begin(), _subRegions.end() };
}

Optional<Battlenet::RealmHandle> RealmList::GetFirstRealmId() const
{
    std::shared_lock lock(_realmsMutex);
    if (_realms.empty())
        return {};

    return _realms.begin()->first;
}

// Classic (1.60+) JamJSONRealmEntry has a superDistrictID (Cfg_SuperDistrict, the realm's ruleset) after cfgContentSetID, which
// TrinityCore's RealmList.proto does not have. The client uses it as the player's super district, e.g. Legacy Points
// (TraitCurrencySource.SuperDistrictSetID) only count on PvP/Normal/Roleplay; with no value every source gives 0.
static std::string AddClassicRealmEntryFields(std::string json)
{
    constexpr std::string_view key = R"("cfgContentSetID":)";
    for (std::size_t pos = json.find(key); pos != std::string::npos; pos = json.find(key, pos))
    {
        std::size_t start = pos + key.size();
        std::size_t end = json.find_first_not_of("0123456789", start);
        if (end == std::string::npos)
            break;

        // the ruleset follows from the realm's season (realmlist.contentSetId)
        uint32 superDistrictId = GetClassicSuperDistrictForContentSet(Trinity::StringTo<uint32>(std::string_view(json).substr(start, end - start)).value_or(0));
        if (!superDistrictId)
            superDistrictId = sConfigMgr->GetIntDefault("Realm.SuperDistrictID", 2);

        std::string const superDistrict = Trinity::StringFormat(R"(,"superDistrictID":{})", superDistrictId);
        json.insert(end, superDistrict);
        pos = end + superDistrict.size();
    }
    return json;
}

Optional<Battlenet::RealmHandle> RealmList::GetRealmIdForContentSet(uint32 contentSetId) const
{
    std::shared_lock lock(_realmsMutex);
    for (auto const& [id, realm] : _realms)
        if (realm->ContentSetId == contentSetId && realm->PopulationLevel != RealmPopulationState::Offline)
            return id;

    return {};
}

uint32 RealmList::GetCurrentRealmSuperDistrict() const
{
    uint32 contentSetId = 0;
    if (std::shared_ptr<Realm const> realm = GetCurrentRealm())
        contentSetId = realm->ContentSetId;
    if (!contentSetId)
        contentSetId = sConfigMgr->GetIntDefault("Realm.CfgContentSetID", 137);

    if (uint32 superDistrictId = GetClassicSuperDistrictForContentSet(contentSetId))
        return superDistrictId;

    return sConfigMgr->GetIntDefault("Realm.SuperDistrictID", 2);
}

std::string RealmList::GetClassicSuperDistrictListEntries() const
{
    std::string entries, allEntries;
    for (uint32 superDistrictId = 1; superDistrictId <= 5; ++superDistrictId)
    {
        std::string entry = Trinity::StringFormat(R"({{"superDistrictID":{},"disallowLogin":false,"holdDownUntilTime":0}})", superDistrictId);
        allEntries += (allEntries.empty() ? "" : ",") + entry;

        // only offer rulesets with a realm, like the real Classic realm list
        if (uint32 contentSetId = GetClassicContentSetForSuperDistrict(superDistrictId))
            if (GetRealmIdForContentSet(contentSetId))
                entries += (entries.empty() ? "" : ",") + entry;
    }
    return entries.empty() ? allEntries : entries;
}

uint32 RealmList::GetCurrentRealmContentSet() const
{
    if (std::shared_ptr<Realm const> realm = GetCurrentRealm())
        if (realm->ContentSetId)
            return realm->ContentSetId;

    return sConfigMgr->GetIntDefault("Realm.CfgContentSetID", 137);
}

void RealmList::FillRealmEntry(Realm const& realm, uint32 clientBuild, AccountTypes accountSecurityLevel, JSON::RealmList::RealmEntry* realmEntry) const
{
    realmEntry->set_wowrealmaddress(realm.Id.GetAddress());
    realmEntry->set_cfgtimezonesid(1);
    if (accountSecurityLevel >= realm.AllowedSecurityLevel || realm.PopulationLevel == RealmPopulationState::Offline)
        realmEntry->set_populationstate(AsUnderlyingType(realm.PopulationLevel));
    else
        realmEntry->set_populationstate(AsUnderlyingType(RealmPopulationState::Locked));

    realmEntry->set_cfgcategoriesid(realm.Timezone);

    JSON::RealmList::ClientVersion* version = realmEntry->mutable_version();
    if (ClientBuild::Info const* buildInfo = ClientBuild::GetBuildInfo(realm.Build))
    {
        version->set_versionmajor(buildInfo->MajorVersion);
        version->set_versionminor(buildInfo->MinorVersion);
        version->set_versionrevision(buildInfo->BugfixVersion);
        version->set_versionbuild(buildInfo->Build);
    }
    else
    {
        version->set_versionmajor(6);
        version->set_versionminor(2);
        version->set_versionrevision(4);
        version->set_versionbuild(realm.Build);
    }

    RealmFlags flag = realm.Flags;
    if (realm.Build != clientBuild)
        flag |= RealmFlags::VersionMismatch;


    realmEntry->set_cfgrealmsid(realm.Id.Realm);
    realmEntry->set_flags(AsUnderlyingType(flag));
    realmEntry->set_name(realm.Name);
    realmEntry->set_cfgconfigsid(realm.GetConfigId());
    realmEntry->set_cfglanguagesid(1);
    realmEntry->set_cfgcontentsetid(realm.ContentSetId ? realm.ContentSetId : sConfigMgr->GetIntDefault("Realm.CfgContentSetID", 0));
    realmEntry->set_usebleepchance(0.0f);
}

// LuaSol: newer clients key their realm cache by virtualRealmAddress and match
// super districts by cfgContentSetID/superDistrictID ? fields our RealmEntry
// proto predates ? so inject them into serialized realm list JSON. The district
// identity follows the realm's own type (GameType), not the request filter.
namespace
{
    // (cfgContentSetID, superDistrictID) per realm type ? client Cfg_SuperDistrict.db2, build 1.60.1.70009
    std::pair<uint32, uint32> DistrictIdsForRealmType(uint8 type)
    {
        switch (type)
        {
        case REALM_TYPE_PVP:                    return { 136, 1 };
        case REALM_TYPE_RP:
        case REALM_TYPE_RPPVP:                  return { 138, 3 };
        case REALM_TYPE_FFA_PVP:                return { 140, 4 };   // hardcore
        default:                                return { 137, 2 };
        }
    }

    void InjectRealmEntryExtensions(std::string& json, uint32 realmAddress, uint8 realmType)
    {
        if (json.empty() || json.back() != '}')
            return;

        auto [contentSetId, superDistrictId] = DistrictIdsForRealmType(realmType);
        json.insert(json.size() - 1, ",\"virtualRealmAddress\":" + std::to_string(realmAddress)
            + ",\"cfgContentSetID\":" + std::to_string(contentSetId)
            + ",\"superDistrictID\":" + std::to_string(superDistrictId));
    }

    void InjectExtensionsIntoUpdates(std::string& json, std::vector<Realm const*> const& realms)
    {
        constexpr std::string_view UpdatePrefix = "\"update\":{";
        constexpr std::string_view AddrKey = "\"wowRealmAddress\":";

        std::size_t realmIndex = 0;
        for (std::string::size_type pos = 0; (pos = json.find(UpdatePrefix, pos)) != std::string::npos && realmIndex < realms.size(); pos += UpdatePrefix.size(), ++realmIndex)
        {
            std::string::size_type addrPos = json.rfind(AddrKey, pos);
            if (addrPos == std::string::npos)
                break;

            uint64 addr = 0;
            std::from_chars(json.data() + addrPos + AddrKey.size(), json.data() + pos, addr);

            auto [contentSetId, superDistrictId] = DistrictIdsForRealmType(realms[realmIndex]->Type);
            json.insert(pos + UpdatePrefix.size(), "\"virtualRealmAddress\":" + std::to_string(addr)
                + ",\"cfgContentSetID\":" + std::to_string(contentSetId)
                + ",\"superDistrictID\":" + std::to_string(superDistrictId) + ",");
        }
    }
}
// LuaSol: end

std::string RealmList::GetRealmEntryJSON(Battlenet::RealmHandle const& id, uint32 build, AccountTypes accountSecurityLevel) const
{
    if (std::shared_ptr<Realm const> realm = GetRealm(id))
    {
        if (realm->PopulationLevel != RealmPopulationState::Offline && realm->Build == build && accountSecurityLevel >= realm->AllowedSecurityLevel)
        {
            JSON::RealmList::RealmEntry realmEntry;
            FillRealmEntry(*realm, build, accountSecurityLevel, &realmEntry);
            std::string json = JSON::Serialize(realmEntry);
            InjectRealmEntryExtensions(json, realm->Id.GetAddress(), realm->Type);   // LuaSol
            return json;
        }
    }

    return { };
}

// LuaSol: realm entry JSON for the first usable realm matching subRegion
// (exact "region-site-realm" address, then "region-site-0" subregion, then any
// usable realm as fallback). Newer realmless clients take their join target
// from this entry in the LastCharPlayed response instead of the realm list.
std::string RealmList::GetRealmEntryForSubRegionJSON(std::string_view subRegion, uint32 build, AccountTypes accountSecurityLevel) const
{
    std::shared_ptr<Realm const> fallback;
    std::shared_ptr<Realm const> offlineFallback;
    {
        std::shared_lock lock(_realmsMutex);
        for (auto const& [_, realm] : _realms)
        {
            if (realm->Build != build || accountSecurityLevel < realm->AllowedSecurityLevel)
                continue;

            bool matches = realm->Id.GetSubRegionAddress() == subRegion || realm->Id.GetAddressString() == subRegion;

            // LuaSol: keep an offline realm as last resort ? omitting
            // Param_RealmEntry entirely makes the client fail the whole
            // LastCharPlayed response with NO_AVAILABLE_REALMS (309), while a
            // populated entry still reports populationState=Offline
            if (realm->PopulationLevel == RealmPopulationState::Offline)
            {
                if (!offlineFallback || matches)
                    offlineFallback = realm;
                continue;
            }

            if (!fallback)
                fallback = realm;

            if (matches)
            {
                fallback = realm;
                break;
            }
        }
    }

    if (!fallback)
        fallback = offlineFallback;

    if (!fallback)
        return { };

    JSON::RealmList::RealmEntry realmEntry;
    FillRealmEntry(*fallback, build, accountSecurityLevel, &realmEntry);
    std::string json = JSON::Serialize(realmEntry);
    InjectRealmEntryExtensions(json, fallback->Id.GetAddress(), fallback->Type);
    return json;
}
// LuaSol: end

// LuaSol: serialized RealmListUpdates (uncompressed JSON body) for every realm
// matching subRegion ? falls back to listing all realms when the requested
// subregion matches nothing (realmless clients send subregion ids that do not
// map back to realm handles). Like GetRealmList, does not filter by
// build/security ? the client decides visibility.
std::string RealmList::GetRealmListUpdatesForSubRegionJSON(std::string_view subRegion, uint32 build, AccountTypes accountSecurityLevel) const
{
    JSON::RealmList::RealmListUpdates realmList;
    std::vector<Realm const*> listedRealms;
    {
        std::shared_lock lock(_realmsMutex);
        bool hasMatch = false;
        for (auto const& [_, realm] : _realms)
        {
            if (realm->Id.GetSubRegionAddress() == subRegion || realm->Id.GetAddressString() == subRegion)
            {
                hasMatch = true;
                break;
            }
        }

        for (auto const& [_, realm] : _realms)
        {
            if (hasMatch && realm->Id.GetSubRegionAddress() != subRegion && realm->Id.GetAddressString() != subRegion)
                continue;

            JSON::RealmList::RealmListUpdatePart* state = realmList.add_updates();
            state->set_wowrealmaddress(realm->Id.GetAddress());
            FillRealmEntry(*realm, build, accountSecurityLevel, state->mutable_update());
            state->set_deleting(false);
            listedRealms.push_back(realm.get());
        }
    }

    std::string json = JSON::Serialize(realmList);
    InjectExtensionsIntoUpdates(json, listedRealms);
    return json;
}

// LuaSol: gameplay-mode districts this server offers, derived from realm types
std::unordered_set<uint32> RealmList::GetSuperDistrictIds() const
{
    std::unordered_set<uint32> ids;
    std::shared_lock lock(_realmsMutex);
    for (auto const& [_, realm] : _realms)
        ids.insert(DistrictIdsForRealmType(realm->Type).second);
    return ids;
}
// LuaSol: end

std::vector<uint8> RealmList::GetRealmList(uint32 build, AccountTypes accountSecurityLevel, std::string const& subRegion) const
{
    JSON::RealmList::RealmListUpdates realmList;
    std::vector<Realm const*> listedRealms;   // LuaSol
    {
        std::shared_lock lock(_realmsMutex);
        for (auto const& [_, realm] : _realms)
        {
            if (realm->Id.GetSubRegionAddress() != subRegion)
                continue;

            JSON::RealmList::RealmListUpdatePart* state = realmList.add_updates();
            state->set_wowrealmaddress(realm->Id.GetAddress());   // LuaSol: required part-level address
            FillRealmEntry(*realm, build, accountSecurityLevel, state->mutable_update());
            state->set_deleting(false);
            listedRealms.push_back(realm.get());   // LuaSol
        }

        for (auto const& [id, _] : _removedRealms)
        {
            if (id.GetSubRegionAddress() != subRegion)
                continue;

            JSON::RealmList::RealmListUpdatePart* state = realmList.add_updates();
            state->set_wowrealmaddress(id.GetAddress());
            state->set_deleting(true);
        }
    }

    std::string updatesJson = JSON::Serialize(realmList);
    InjectExtensionsIntoUpdates(updatesJson, listedRealms);   // LuaSol
    std::string json = "JSONRealmListUpdates:" + updatesJson;
    std::vector<uint8> compressed;
    CompressJson(json, &compressed);
    return compressed;
}

RealmJoinResult RealmList::JoinRealm(uint32 realmAddress, uint32 build, ClientBuild::VariantId const& buildVariant, boost::asio::ip::address const& clientAddress,
    std::array<uint8, 32> const& clientSecret, LocaleConstant locale, std::string const& os, Minutes timezoneOffset, std::string const& accountName,
    AccountTypes accountSecurityLevel) const
{
    if (std::shared_ptr<Realm const> realm = GetRealm(realmAddress))
    {
        if (realm->PopulationLevel == RealmPopulationState::Offline || realm->Build != build || accountSecurityLevel < realm->AllowedSecurityLevel)
            return { .Result = ERROR_USER_SERVER_NOT_PERMITTED_ON_REALM };

        boost::asio::ip::address addressForClient = realm->GetAddressForClient(clientAddress);

        JSON::RealmList::RealmListServerIPAddresses serverAddresses;
        JSON::RealmList::RealmIPAddressFamily* addressFamily = serverAddresses.add_families();
        addressFamily->set_family(addressForClient.is_v6() ? 2 : 1);

        JSON::RealmList::IPAddress* address = addressFamily->add_addresses();
        address->set_ip(addressForClient.to_string());
        address->set_port(realm->Port);

        std::string json = "JSONRealmListServerIPAddresses:" + JSON::Serialize(serverAddresses);
        std::vector<uint8> serverAddressesCompressed;

        if (!CompressJson(json, &serverAddressesCompressed))
            return { .Result = ERROR_UTIL_SERVER_FAILED_TO_SERIALIZE_RESPONSE };

        std::vector<uint8> serverSecret(32);
        Trinity::Crypto::GetRandomBytes(serverSecret);

        std::array<uint8, 64> keyData;
        auto keyDestItr = keyData.begin();
        keyDestItr = std::ranges::copy(clientSecret, keyDestItr).out;
        keyDestItr = std::ranges::copy(serverSecret, keyDestItr).out;

        LoginDatabasePreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_BNET_GAME_ACCOUNT_LOGIN_INFO);
        stmt->setBinary(0, keyData);
        stmt->setString(1, clientAddress.to_string());
        stmt->setUInt32(2, build);
        stmt->setUInt8(3, locale);
        stmt->setString(4, os);
        stmt->setInt16(5, timezoneOffset.count());
        stmt->setString(6, accountName);
        LoginDatabase.DirectExecute(stmt);

        JSON::RealmList::RealmJoinTicket joinTicket;
        joinTicket.set_gameaccount(accountName);
        joinTicket.set_platform(buildVariant.Platform);
        joinTicket.set_clientarch(buildVariant.Arch);
        joinTicket.set_type(buildVariant.Type);

        std::string joinTicketJson = JSON::Serialize(joinTicket);

        return {
            .Result = ERROR_OK,
            .JoinTicket = { joinTicketJson.begin(), joinTicketJson.end() },
            .ServerAddresses = std::move(serverAddressesCompressed),
            .JoinSecret = std::move(serverSecret)
        };
    }

    return { .Result = ERROR_UTIL_SERVER_UNKNOWN_REALM };
}
