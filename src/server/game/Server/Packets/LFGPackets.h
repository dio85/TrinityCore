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

#ifndef LFGPackets_h__
#define LFGPackets_h__

#include "Packet.h"
#include "PacketUtilities.h"
#include "ItemPacketsCommon.h"
#include "LFGPacketsCommon.h"
#include "Optional.h"

namespace lfg
{
    enum LfgTeleportResult : uint8;
}

namespace WorldPackets
{
    namespace LFG
    {
        class DFJoin final : public ClientPacket
        {
        public:
            DFJoin(WorldPacket&& packet) : ClientPacket(CMSG_DF_JOIN, std::move(packet)) { }

            void Read() override;

            bool QueueAsGroup = false;
            bool Unknown = false;       // Always false in 7.2.5
            Optional<uint8> PartyIndex;
            uint8 Roles = 0;
            Array<uint32, 50> Slots;
        };

        class DFLeave final : public ClientPacket
        {
        public:
            DFLeave(WorldPacket&& packet) : ClientPacket(CMSG_DF_LEAVE, std::move(packet)) { }

            void Read() override;

            RideTicket Ticket;
        };

        class DFProposalResponse final : public ClientPacket
        {
        public:
            DFProposalResponse(WorldPacket&& packet) : ClientPacket(CMSG_DF_PROPOSAL_RESPONSE, std::move(packet)) { }

            void Read() override;

            RideTicket Ticket;
            uint64 InstanceID = 0;
            uint32 ProposalID = 0;
            bool Accepted = false;
        };

        class DFSetRoles final : public ClientPacket
        {
        public:
            DFSetRoles(WorldPacket&& packet) : ClientPacket(CMSG_DF_SET_ROLES, std::move(packet)) { }

            void Read() override;

            uint8 RolesDesired = 0;
            Optional<uint8> PartyIndex;
        };

        class DFBootPlayerVote final : public ClientPacket
        {
        public:
            DFBootPlayerVote(WorldPacket&& packet) : ClientPacket(CMSG_DF_BOOT_PLAYER_VOTE, std::move(packet)) { }

            void Read() override;

            bool Vote = false;
        };

        class DFTeleport final : public ClientPacket
        {
        public:
            DFTeleport(WorldPacket&& packet) : ClientPacket(CMSG_DF_TELEPORT, std::move(packet)) { }

            void Read() override;

            bool TeleportOut = false;
        };

        class DFGetSystemInfo final : public ClientPacket
        {
        public:
            DFGetSystemInfo(WorldPacket&& packet) : ClientPacket(CMSG_DF_GET_SYSTEM_INFO, std::move(packet)) { }

            void Read() override;

            Optional<uint8> PartyIndex;
            bool Player = false;
        };

        class DFGetJoinStatus final : public ClientPacket
        {
        public:
            DFGetJoinStatus(WorldPacket&& packet) : ClientPacket(CMSG_DF_GET_JOIN_STATUS, std::move(packet)) { }

            void Read() override { }
        };

        class LFGListGetStatus final : public ClientPacket
        {
        public:
            LFGListGetStatus(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_GET_STATUS, std::move(packet)) { }

            void Read() override { }
        };

        struct LFGListBlacklist
        {
            uint32 ActivityID = 0;
            uint32 Reason = 0;
        };

        class LFGRequestLFGListBlacklist final : public ClientPacket
        {
        public:
            LFGRequestLFGListBlacklist(WorldPacket&& packet) : ClientPacket(CMSG_REQUEST_LFG_LIST_BLACKLIST, std::move(packet)) { }

            void Read() override { }
        };

        class LFGListUpdateBlacklist final : public ServerPacket
        {
        public:
            LFGListUpdateBlacklist() : ServerPacket(SMSG_LFG_LIST_UPDATE_BLACKLIST) { }

            WorldPacket const* Write() override;

            std::vector<LFGListBlacklist> Blacklists;
        };

        struct ApplicationToGroup
        {
            LFG::RideTicket ApplicationTicket;
            uint32 ActivityID = 0;
            std::string Comment;
            uint8 Role = 0;
        };

        struct MemberInfo
        {
            MemberInfo() {}
            MemberInfo(uint8 classID, uint8 role) : ClassID(classID), Role(role) {}
            uint8 ClassID = CLASS_NONE;
            uint8 Role = 0;
        };

        struct ListRequest
        {
            ListRequest() {}
            Optional<uint32> QuestID;
            uint32 ActivityID = 0;
            uint32 HonorLevel = 0;
            float ItemLevel = 0.0f;
            std::string GroupName;
            std::string Comment;
            std::string VoiceChat;
            bool AutoAccept = false;
            bool PrivateGroup = false;
        };

        struct ListSearchResult
        {
            LFG::RideTicket ApplicationTicket;
            ListRequest JoinRequest;
            std::vector<MemberInfo> Members;
            GuidList BNetFriendsGuids;
            GuidList NumCharFriendsGuids;
            GuidList NumGuildMateGuids;
            ObjectGuid UnkGuid1;
            ObjectGuid UnkGuid2;
            ObjectGuid UnkGuid3;
            ObjectGuid UnkGuid4;
            ObjectGuid UnkGuid5;
            uint32 VirtualRealmAddress = 0;
            uint32 CompletedEncounters = 0;
            uint32 Age = 0;
            uint32 ResultID = 0;
            uint8 ApplicationStatus = 0;
        };

        struct ApplicantStruct
        {
            ApplicantStruct() {}
            ApplicantStruct(ObjectGuid playerGUID, uint8 role) : PlayerGUID(playerGUID), Role(role) {}
            ObjectGuid PlayerGUID;
            uint8 Role = 0;
        };

        struct ApplicantMember
        {
            ApplicantMember() {}
            struct ACStatInfo
            {
                uint32 UnkInt4 = 0;
                uint32 UnkInt5 = 0;
            };
            std::list<ACStatInfo> AcStat;
            ObjectGuid PlayerGUID;
            uint32 VirtualRealmAddress = 0;
            uint32 Level = 0;
            uint32 HonorLevel = 0;
            float ItemLevel = 0.0f;
            uint8 PossibleRoleMask = 0;
            uint8 SelectedRoleMask = 0;
        };
        struct ApplicantInfo
        {
            std::vector<ApplicantMember> Member;
            LFG::RideTicket ApplicantTicket;
            ObjectGuid ApplicantPartyLeader;
            std::string Comment;
            uint8 ApplicationStatus = 0;
            bool Listed = false;
        };

        struct LfgListSearchResult
        {
            std::vector<MemberInfo> Members;
            LFG::RideTicket ApplicationTicket;
            ListRequest JoinRequest;
            Optional<ObjectGuid> LeaderGuid;
            Optional<ObjectGuid> UnkGuid;
            Optional<ObjectGuid> UnkGuid2;
            Optional<ObjectGuid> UnkGuid3;
            Optional<uint32> VirtualRealmAddress;
            Optional<uint32> UnkInt2;
            uint32 UnkInt = 0;
            bool UnkBIt = false;
            bool UnkBIt2 = false;
            bool UnkBIt3 = false;
            bool UnkBIt4 = false;
            bool UnkBit96 = false;
        };

        class LfgListJoin final : public ClientPacket
        {
        public:
            LfgListJoin(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_JOIN, std::move(packet)) { }

            void Read() override;

            ListRequest Request;
        };

        class LfgListJoinResult final : public ServerPacket
        {
        public:
            LfgListJoinResult() : ServerPacket(SMSG_LFG_LIST_JOIN_RESULT, 28 + 1 + 1) { }

            WorldPacket const* Write() override;

            LFG::RideTicket ApplicationTicket;
            uint8 Status = 0;
            uint8 Result = 0;
        };

        class LfgListApplyToGroup final : public ClientPacket
        {
        public:
            LfgListApplyToGroup(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_APPLY_TO_GROUP, std::move(packet)) { }

            void Read() override;

            ApplicationToGroup application;
        };

        class LfgListCancelApplication final : public ClientPacket
        {
        public:
            LfgListCancelApplication(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_CANCEL_APPLICATION, std::move(packet)) { }

            void Read() override;

            LFG::RideTicket ApplicantTicket;
        };
        class LfgListDeclineApplicant final : public ClientPacket
        {
        public:
            LfgListDeclineApplicant(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_DECLINE_APPLICANT, std::move(packet)) { }

            void Read() override;

            LFG::RideTicket ApplicantTicket;
            LFG::RideTicket ApplicationTicket;
        };
        class LfgListInviteApplicant final : public ClientPacket
        {
        public:
            LfgListInviteApplicant(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_INVITE_APPLICANT, std::move(packet)) { }

            void Read() override;

            std::list<ApplicantStruct> Applicant;
            LFG::RideTicket ApplicantTicket;
            LFG::RideTicket ApplicationTicket;
        };
        class LfgListUpdateRequest final : public ClientPacket
        {
        public:
            LfgListUpdateRequest(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_UPDATE_REQUEST, std::move(packet)) { }

            void Read() override;

            LFG::RideTicket Ticket;
            ListRequest UpdateRequest;
        };

        class LfgListInviteResponse final : public ClientPacket
        {
        public:
            LfgListInviteResponse(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_INVITE_RESPONSE, std::move(packet)) { }

            void Read() override;

            LFG::RideTicket ApplicantTicket;
            bool Accept = false;
        };

        class LfgListSearch final : public ClientPacket
        {
        public:
            LfgListSearch(WorldPacket&& packet) : ClientPacket(CMSG_LFG_LIST_SEARCH, std::move(packet)) { }

            void Read() override;

            std::vector<LFGListBlacklist> Blacklist;
            GuidVector Guids;
            int32 CategoryID = 0;
            int32 SearchTerms = 0;
            int32 Filter = 0;
            int32 PreferredFilters = 0;
            std::string LanguageSearchFilter;
        };

        class LfgListUpdateStatus final : public ServerPacket
        {
        public:
            LfgListUpdateStatus() : ServerPacket(SMSG_LFG_LIST_UPDATE_STATUS, 28 + 1 + 1 + 4 + 4 + 2 + 2 + 2) { }

            WorldPacket const* Write() override;

            LFG::RideTicket ApplicationTicket;
            ListRequest Request;
            uint32 ExpirationTime = 0;
            uint8 Status = 0;
            bool Listed = false;
        };

        class LfgListApplyToGroupResponce final : public ServerPacket
        {
        public:
            LfgListApplyToGroupResponce() : ServerPacket(SMSG_LFG_LIST_APPLY_TO_GROUP_RESULT, 28 + 28 + 4 + 4 + 1 + 1 + 150) { }

            WorldPacket const* Write() override;

            ListSearchResult SearchResult;
            LFG::RideTicket ApplicantTicket;
            LFG::RideTicket ApplicationTicket;
            uint32 InviteExpireTimer = 0;
            uint8 Status = 0;
            uint8 Role = 0;
            uint8 ApplicationStatus = 0;
        };

        class LfgListSearchStatus final : public ServerPacket
        {
        public:
            LfgListSearchStatus() : ServerPacket(SMSG_LFG_LIST_SEARCH_STATUS, 30) { }

            WorldPacket const* Write() override;

            LFG::RideTicket Ticket;
            uint8 Status = 0;
            bool UnkBit = false;
        };

        class LfgListSearchResultUpdate final : public ServerPacket
        {
        public:
            LfgListSearchResultUpdate() : ServerPacket(SMSG_LFG_LIST_SEARCH_RESULTS_UPDATE, 4) { }

            WorldPacket const* Write() override;

            Array<LfgListSearchResult, 50> ResultUpdate;
        };

        class LfgListSearchResults final : public ServerPacket
        {
        public:
            LfgListSearchResults() : ServerPacket(SMSG_LFG_LIST_SEARCH_RESULTS, 6) { }

            WorldPacket const* Write() override;

            std::vector<ListSearchResult> SearchResults;
            uint16 AppicationsCount = 0;
        };

        class LfgListApplicationUpdate final : public ServerPacket
        {
        public:
            LfgListApplicationUpdate() : ServerPacket(SMSG_LFG_LIST_APPLICATION_STATUS_UPDATE, 4 + 4 + 4) { }

            WorldPacket const* Write() override;

            std::vector<ApplicantInfo> Applicants;
            LFG::RideTicket ApplicationTicket;
            uint32 UnkInt = 0;
        };


        struct LFGBlackListSlot
        {
            LFGBlackListSlot() = default;
            LFGBlackListSlot(uint32 slot, uint32 reason, int32 subReason1, int32 subReason2, uint32 softLock)
                : Slot(slot), Reason(reason), SubReason1(subReason1), SubReason2(subReason2), SoftLock(softLock) { }

            uint32 Slot = 0;
            uint32 Reason = 0;
            int32 SubReason1 = 0;
            int32 SubReason2 = 0;
            uint32 SoftLock = 0;
        };

        struct LFGBlackList
        {
            Optional<ObjectGuid> PlayerGuid;
            std::vector<LFGBlackListSlot> Slot;
        };

        struct LfgPlayerDungeonInfo
        {
            uint32 Slot = 0;
            int32 CompletionQuantity = 0;
            int32 CompletionLimit = 0;
            int32 CompletionCurrencyID = 0;
            int32 SpecificQuantity = 0;
            int32 SpecificLimit = 0;
            int32 OverallQuantity = 0;
            int32 OverallLimit = 0;
            int32 PurseWeeklyQuantity = 0;
            int32 PurseWeeklyLimit = 0;
            int32 PurseQuantity = 0;
            int32 PurseLimit = 0;
            int32 Quantity = 0;
            uint32 CompletedMask = 0;
            uint32 EncounterMask = 0;
            bool FirstReward = false;
            bool ShortageEligible = false;
            LfgPlayerQuestReward Rewards;
            std::vector<LfgPlayerQuestReward> ShortageReward;
        };

        class LfgPlayerInfo final : public ServerPacket
        {
        public:
            LfgPlayerInfo() : ServerPacket(SMSG_LFG_PLAYER_INFO) { }

            WorldPacket const* Write() override;

            LFGBlackList BlackList;
            std::vector<LfgPlayerDungeonInfo> Dungeon;
        };

        class LfgPartyInfo final : public ServerPacket
        {
        public:
            LfgPartyInfo() : ServerPacket(SMSG_LFG_PARTY_INFO) { }

            WorldPacket const* Write() override;

            std::vector<LFGBlackList> Player;
        };

        class LFGUpdateStatus final : public ServerPacket
        {
        public:
            LFGUpdateStatus() : ServerPacket(SMSG_LFG_UPDATE_STATUS) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint8 SubType = 0;
            uint8 Reason = 0;
            std::vector<uint32> Slots;
            uint8 RequestedRoles = 0;
            std::vector<ObjectGuid> SuspendedPlayers;
            uint32 QueueMapID = 0;
            bool NotifyUI = false;
            bool IsParty = false;
            bool Joined = false;
            bool LfgJoined = false;
            bool Queued = false;
            bool Unused = false;
        };

        class RoleChosen final : public ServerPacket
        {
        public:
            RoleChosen() : ServerPacket(SMSG_ROLE_CHOSEN, 16 + 4 + 1) { }

            WorldPacket const* Write() override;

            ObjectGuid Player;
            uint8 RoleMask = 0;
            bool Accepted = false;
        };

        struct LFGRoleCheckUpdateMember
        {
            LFGRoleCheckUpdateMember() = default;
            LFGRoleCheckUpdateMember(ObjectGuid guid, uint8 rolesDesired, uint8 level, bool roleCheckComplete)
                : Guid(guid), RolesDesired(rolesDesired), Level(level), RoleCheckComplete(roleCheckComplete) { }

            ObjectGuid Guid;
            uint8 RolesDesired = 0;
            uint8 Level = 0;
            bool RoleCheckComplete = false;
        };

        class LFGRoleCheckUpdate final : public ServerPacket
        {
        public:
            LFGRoleCheckUpdate() : ServerPacket(SMSG_LFG_ROLE_CHECK_UPDATE) { }

            WorldPacket const* Write() override;

            uint8 PartyIndex = 0;
            uint8 RoleCheckStatus = 0;
            std::vector<uint32> JoinSlots;
            std::vector<uint64> BgQueueIDs;
            int32 GroupFinderActivityID = 0;
            std::vector<LFGRoleCheckUpdateMember> Members;
            bool IsBeginning = false;
            bool IsRequeue = false;
        };

        class LFGJoinResult final : public ServerPacket
        {
        public:
            LFGJoinResult() : ServerPacket(SMSG_LFG_JOIN_RESULT) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint8 Result = 0;
            uint8 ResultDetail = 0;
            std::vector<LFGBlackList> BlackList;
            std::vector<std::string const*> BlackListNames;
        };

        class LFGQueueStatus final : public ServerPacket
        {
        public:
            LFGQueueStatus() : ServerPacket(SMSG_LFG_QUEUE_STATUS, 16 + 4 + 4 + 4 + 4 + 4 + 4 + 4 * 3 + 3 + 4) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint32 Slot = 0;
            uint32 AvgWaitTimeMe = 0;
            uint32 AvgWaitTime = 0;
            uint32 AvgWaitTimeByRole[3] = { };
            uint8 LastNeeded[3] = { };
            uint32 QueuedTime = 0;
        };

        struct LFGPlayerRewards
        {
            LFGPlayerRewards() = default;
            LFGPlayerRewards(int32 id, uint32 quantity, int32 bonusQuantity, bool isCurrency)
                : Quantity(quantity), BonusQuantity(bonusQuantity)
            {
                if (!isCurrency)
                {
                    RewardItem.emplace();
                    RewardItem->ItemID = id;
                }
                else
                {
                    RewardCurrency = id;
                }
            }

            Optional<Item::ItemInstance> RewardItem;
            Optional<int32> RewardCurrency;
            uint32 Quantity = 0;
            int32 BonusQuantity = 0;
        };

        class LFGPlayerReward final : public ServerPacket
        {
        public:
            LFGPlayerReward() : ServerPacket(SMSG_LFG_PLAYER_REWARD) { }

            WorldPacket const* Write() override;

            uint32 QueuedSlot = 0;
            uint32 ActualSlot = 0;
            int32 RewardMoney = 0;
            int32 AddedXP = 0;
            std::vector<LFGPlayerRewards> Rewards;
        };

        struct LfgBootInfo
        {
            bool VoteInProgress = false;
            bool VotePassed = false;
            bool MyVoteCompleted = false;
            bool MyVote = false;
            ObjectGuid Target;
            uint32 TotalVotes = 0;
            uint32 BootVotes = 0;
            int32 TimeLeft = 0;
            uint32 VotesNeeded = 0;
            std::string Reason;
        };

        class LfgBootPlayer final : public ServerPacket
        {
        public:
            LfgBootPlayer() : ServerPacket(SMSG_LFG_BOOT_PLAYER) { }

            WorldPacket const* Write() override;

            LfgBootInfo Info;
        };

        struct LFGProposalUpdatePlayer
        {
            uint8 Roles = 0;
            bool Me = false;
            bool SameParty = false;
            bool MyParty = false;
            bool Responded = false;
            bool Accepted = false;
        };

        class LFGProposalUpdate final : public ServerPacket
        {
        public:
            LFGProposalUpdate() : ServerPacket(SMSG_LFG_PROPOSAL_UPDATE) { }

            WorldPacket const* Write() override;

            RideTicket Ticket;
            uint64 InstanceID = 0;
            uint32 ProposalID = 0;
            uint32 Slot = 0;
            int8 State = 0;
            uint32 CompletedMask = 0;
            uint32 EncounterMask = 0;
            uint8 Unused = 0;
            bool ValidCompletedMask = false;
            bool ProposalSilent = false;
            bool IsRequeue = false;
            std::vector<LFGProposalUpdatePlayer> Players;
        };

        class LFGDisabled final : public ServerPacket
        {
        public:
            LFGDisabled() : ServerPacket(SMSG_LFG_DISABLED, 0) { }

            WorldPacket const* Write() override { return &_worldPacket; }
        };

        class LFGOfferContinue final : public ServerPacket
        {
        public:
            LFGOfferContinue(uint32 slot) : ServerPacket(SMSG_LFG_OFFER_CONTINUE, 4), Slot(slot) { }

            WorldPacket const* Write() override;

            uint32 Slot = 0;
        };

        class LFGTeleportDenied final : public ServerPacket
        {
        public:
            LFGTeleportDenied(lfg::LfgTeleportResult reason) : ServerPacket(SMSG_LFG_TELEPORT_DENIED, 1), Reason(reason) { }

            WorldPacket const* Write() override;

            lfg::LfgTeleportResult Reason;
        };

        class CompleteReadyCheck final : public ClientPacket
        {
        public:
            CompleteReadyCheck(WorldPacket&& packet) : ClientPacket(CMSG_DF_READY_CHECK_RESPONSE, std::move(packet)) { }

            void Read() override;

            uint8 PartyIndex = 0;
            bool IsReady = false;
        };

        ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LFGListBlacklist const& blackList);
        ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::LFG::LFGListBlacklist& blackList);
        ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::ListSearchResult const& listSearch);
        ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::MemberInfo const& memberInfo);
        ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::ListRequest const& join);
        ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::LFG::ListRequest& join);

    }
}

#endif // LFGPackets_h__
