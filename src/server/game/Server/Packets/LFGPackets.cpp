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

#include "LFGPackets.h"

namespace WorldPackets::LFG
{
    ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::LFGListBlacklist const& blackList)
    {
        data << blackList.ActivityID;
        data << blackList.Reason;
        return data;
    }

    ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::LFG::LFGListBlacklist& blackList)
    {
        data >> blackList.ActivityID;
        data >> blackList.Reason;
        return data;
    }

    ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::MemberInfo const& memberInfo)
    {
        data << memberInfo.ClassID;
        data << memberInfo.Role;
        return data;
    }

    ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::ListSearchResult const& listSearch)
    {
        data << listSearch.ApplicationTicket;
        data << listSearch.ResultID;
        data << listSearch.UnkGuid1;
        data << listSearch.UnkGuid2;
        data << listSearch.UnkGuid3;
        data << listSearch.UnkGuid4;
        data << listSearch.UnkGuid5;
        data << listSearch.VirtualRealmAddress;
        data << static_cast<uint32>(listSearch.BNetFriendsGuids.size());
        data << static_cast<uint32>(listSearch.NumCharFriendsGuids.size());
        data << static_cast<uint32>(listSearch.NumGuildMateGuids.size());
        data << static_cast<uint32>(listSearch.Members.size());
        data << listSearch.CompletedEncounters;
        data << listSearch.Age;
        data << listSearch.ApplicationStatus;
        data << listSearch.UnkGuid5;
        for (ObjectGuid const& v : listSearch.BNetFriendsGuids)
            data << v;
        for (ObjectGuid const& v : listSearch.NumCharFriendsGuids)
            data << v;
        for (ObjectGuid const& v : listSearch.NumGuildMateGuids)
            data << v;
        for (auto const& v : listSearch.Members)
            data << v;
        data << listSearch.JoinRequest;
        return data;
    }

    ByteBuffer& operator<<(ByteBuffer& data, WorldPackets::LFG::ListRequest const& join)
    {
        data << join.ActivityID;
        data << join.ItemLevel;
        data << join.HonorLevel;
        data.WriteBits(join.GroupName.length(), 8);
        data.WriteBits(join.Comment.length(), 11);
        data.WriteBits(join.VoiceChat.length(), 8);
        data.WriteBit(join.AutoAccept);
        data.WriteBit(join.PrivateGroup);
        data.WriteBit(join.QuestID && *join.QuestID != 0);
        data.FlushBits();
        data.WriteString(join.GroupName);
        data.WriteString(join.Comment);
        data.WriteString(join.VoiceChat);
        if (join.QuestID && *join.QuestID != 0)
            data << *join.QuestID;
        return data;
    }
    ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::LFG::ListRequest& join)
    {
        data >> join.ActivityID;
        data >> join.ItemLevel;
        data >> join.HonorLevel;
        //data.ResetBitReader();
        uint32 NameLen = data.ReadBits(8);
        uint32 CommenteLen = data.ReadBits(11);
        uint32 VoiceChateLen = data.ReadBits(8);
        join.AutoAccept = data.ReadBit();
        join.PrivateGroup = data.ReadBit();
        bool isForQuest = data.ReadBit();
        join.GroupName = data.ReadString(NameLen);
        join.Comment = data.ReadString(CommenteLen);
        join.VoiceChat = data.ReadString(VoiceChateLen);
        if (isForQuest)
            join.QuestID = data.read<uint32>();
        return data;
    }

    void DFJoin::Read()
    {
        QueueAsGroup = _worldPacket.ReadBit();
        bool hasPartyIndex = _worldPacket.ReadBit();
        Unknown = _worldPacket.ReadBit();
        _worldPacket >> Roles;
        Slots.resize(_worldPacket.read<uint32>());
        if (hasPartyIndex)
            _worldPacket >> PartyIndex.emplace();
        for (uint32& slot : Slots)
            _worldPacket >> slot;
    }

    void DFLeave::Read()
    {
        _worldPacket >> Ticket;
    }

    void DFProposalResponse::Read()
    {
        _worldPacket >> Ticket;
        _worldPacket >> InstanceID;
        _worldPacket >> ProposalID;
        Accepted = _worldPacket.ReadBit();
    }

    void DFSetRoles::Read()
    {
        bool hasPartyIndex = _worldPacket.ReadBit();
        _worldPacket >> RolesDesired;
        if (hasPartyIndex)
            _worldPacket >> PartyIndex.emplace();
    }

    void DFBootPlayerVote::Read()
    {
        Vote = _worldPacket.ReadBit();
    }

    void DFTeleport::Read()
    {
        TeleportOut = _worldPacket.ReadBit();
    }

    void DFGetSystemInfo::Read()
    {
        Player = _worldPacket.ReadBit();
        if (_worldPacket.ReadBit())
            _worldPacket >> PartyIndex.emplace();
    }

    ByteBuffer& operator<<(ByteBuffer& data, LFGBlackListSlot const& lfgBlackListSlot)
    {
        data << uint32(lfgBlackListSlot.Slot);
        data << uint32(lfgBlackListSlot.Reason);
        data << int32(lfgBlackListSlot.SubReason1);
        data << int32(lfgBlackListSlot.SubReason2);
        data << uint32(lfgBlackListSlot.SoftLock);

        return data;
    }

    ByteBuffer& operator<<(ByteBuffer& data, LFGBlackList const& blackList)
    {
        data.WriteBit(blackList.PlayerGuid.has_value());
        data << uint32(blackList.Slot.size());
        if (blackList.PlayerGuid)
            data << *blackList.PlayerGuid;

        for (LFGBlackListSlot const& slot : blackList.Slot)
            data << slot;

        return data;
    }

    ByteBuffer& operator<<(ByteBuffer& data, LfgPlayerDungeonInfo const& playerDungeonInfo)
    {
        data << uint32(playerDungeonInfo.Slot);
        data << int32(playerDungeonInfo.CompletionQuantity);
        data << int32(playerDungeonInfo.CompletionLimit);
        data << int32(playerDungeonInfo.CompletionCurrencyID);
        data << int32(playerDungeonInfo.SpecificQuantity);
        data << int32(playerDungeonInfo.SpecificLimit);
        data << int32(playerDungeonInfo.OverallQuantity);
        data << int32(playerDungeonInfo.OverallLimit);
        data << int32(playerDungeonInfo.PurseWeeklyQuantity);
        data << int32(playerDungeonInfo.PurseWeeklyLimit);
        data << int32(playerDungeonInfo.PurseQuantity);
        data << int32(playerDungeonInfo.PurseLimit);
        data << int32(playerDungeonInfo.Quantity);
        data << uint32(playerDungeonInfo.CompletedMask);
        data << uint32(playerDungeonInfo.EncounterMask);
        data << uint32(playerDungeonInfo.ShortageReward.size());
        data.WriteBit(playerDungeonInfo.FirstReward);
        data.WriteBit(playerDungeonInfo.ShortageEligible);
        data.FlushBits();

        data << playerDungeonInfo.Rewards;
        for (LfgPlayerQuestReward const& shortageReward : playerDungeonInfo.ShortageReward)
            data << shortageReward;

        return data;
    }

    WorldPacket const* LfgPlayerInfo::Write()
    {
        _worldPacket << uint32(Dungeon.size());
        _worldPacket << BlackList;
        for (LfgPlayerDungeonInfo const& playerDungeonInfo : Dungeon)
            _worldPacket << playerDungeonInfo;

        return &_worldPacket;
    }

    WorldPacket const* LfgPartyInfo::Write()
    {
        _worldPacket << uint32(Player.size());
        for (LFGBlackList const& player : Player)
            _worldPacket << player;

        return &_worldPacket;
    }

    WorldPacket const* LFGUpdateStatus::Write()
    {
        _worldPacket << Ticket;
        _worldPacket << uint8(SubType);
        _worldPacket << uint8(Reason);
        _worldPacket << uint32(Slots.size());
        _worldPacket << uint8(RequestedRoles);
        _worldPacket << uint32(SuspendedPlayers.size());
        _worldPacket << uint32(QueueMapID);

        for (uint32 slot : Slots)
            _worldPacket << uint32(slot);

        for (ObjectGuid const& suspendedPlayer : SuspendedPlayers)
            _worldPacket << suspendedPlayer;

        _worldPacket.WriteBit(IsParty);
        _worldPacket.WriteBit(NotifyUI);
        _worldPacket.WriteBit(Joined);
        _worldPacket.WriteBit(LfgJoined);
        _worldPacket.WriteBit(Queued);
        _worldPacket.WriteBit(Unused);
        _worldPacket.FlushBits();

        return &_worldPacket;
    }

    WorldPacket const* RoleChosen::Write()
    {
        _worldPacket << Player;
        _worldPacket << uint8(RoleMask);
        _worldPacket.WriteBit(Accepted);
        _worldPacket.FlushBits();

        return &_worldPacket;
    }

    ByteBuffer& operator<<(ByteBuffer& data, LFGRoleCheckUpdateMember const& lfgRoleCheckUpdateMember)
    {
        data << lfgRoleCheckUpdateMember.Guid;
        data << uint8(lfgRoleCheckUpdateMember.RolesDesired);
        data << uint8(lfgRoleCheckUpdateMember.Level);
        data.WriteBit(lfgRoleCheckUpdateMember.RoleCheckComplete);
        data.FlushBits();

        return data;
    }

    WorldPacket const* LFGRoleCheckUpdate::Write()
    {
        _worldPacket << uint8(PartyIndex);
        _worldPacket << uint8(RoleCheckStatus);
        _worldPacket << uint32(JoinSlots.size());
        _worldPacket << uint32(BgQueueIDs.size());
        _worldPacket << int32(GroupFinderActivityID);
        _worldPacket << uint32(Members.size());

        for (uint32 slot : JoinSlots)
            _worldPacket << uint32(slot);

        for (uint64 bgQueueID : BgQueueIDs)
            _worldPacket << uint64(bgQueueID);

        _worldPacket.WriteBit(IsBeginning);
        _worldPacket.WriteBit(IsRequeue);
        _worldPacket.FlushBits();

        for (LFGRoleCheckUpdateMember const& member : Members)
            _worldPacket << member;

        return &_worldPacket;
    }

    WorldPacket const* LFGJoinResult::Write()
    {
        _worldPacket << Ticket;
        _worldPacket << uint8(Result);
        _worldPacket << uint8(ResultDetail);
        _worldPacket << uint32(BlackList.size());
        _worldPacket << uint32(BlackListNames.size());

        for (LFGBlackList const& blackList : BlackList)
            _worldPacket << blackList;

        for (std::string const* str : BlackListNames)
            _worldPacket.WriteBits(str->length() + 1, 24);

        for (std::string const* str : BlackListNames)
            if (!str->empty())
                _worldPacket << *str;

        return &_worldPacket;
    }

    WorldPacket const* LFGQueueStatus::Write()
    {
        _worldPacket << Ticket;
        _worldPacket << uint32(Slot);
        _worldPacket << uint32(AvgWaitTimeMe);
        _worldPacket << uint32(AvgWaitTime);

        for (uint32 i = 0; i < 3; ++i)
        {
            _worldPacket << uint32(AvgWaitTimeByRole[i]);
            _worldPacket << uint8(LastNeeded[i]);
        }
        _worldPacket << uint32(QueuedTime);

        return &_worldPacket;
    }

    ByteBuffer& operator<<(ByteBuffer& data, LFGPlayerRewards const& lfgPlayerRewards)
    {
        data.WriteBit(lfgPlayerRewards.RewardItem.has_value());
        data.WriteBit(lfgPlayerRewards.RewardCurrency.has_value());
        if (lfgPlayerRewards.RewardItem)
            data << *lfgPlayerRewards.RewardItem;

        data << uint32(lfgPlayerRewards.Quantity);
        data << int32(lfgPlayerRewards.BonusQuantity);
        if (lfgPlayerRewards.RewardCurrency)
            data << int32(*lfgPlayerRewards.RewardCurrency);

        return data;
    }

    WorldPacket const* LFGPlayerReward::Write()
    {
        _worldPacket << uint32(QueuedSlot);
        _worldPacket << uint32(ActualSlot);
        _worldPacket << int32(RewardMoney);
        _worldPacket << int32(AddedXP);
        _worldPacket << uint32(Rewards.size());

        for (LFGPlayerRewards const& reward : Rewards)
            _worldPacket << reward;

        return &_worldPacket;
    }

    ByteBuffer& operator<<(ByteBuffer& data, LfgBootInfo const& lfgBootInfo)
    {
        data << Bits<1>(lfgBootInfo.VoteInProgress);
        data << Bits<1>(lfgBootInfo.VotePassed);
        data << Bits<1>(lfgBootInfo.MyVoteCompleted);
        data << Bits<1>(lfgBootInfo.MyVote);
        data << SizedString::BitsSize<8>(lfgBootInfo.Reason);
        data << lfgBootInfo.Target;
        data << uint32(lfgBootInfo.TotalVotes);
        data << uint32(lfgBootInfo.BootVotes);
        data << int32(lfgBootInfo.TimeLeft);
        data << uint32(lfgBootInfo.VotesNeeded);
        data << SizedString::Data(lfgBootInfo.Reason);

        return data;
    }

    WorldPacket const* LfgBootPlayer::Write()
    {
        _worldPacket << Info;

        return &_worldPacket;
    }

    ByteBuffer& operator<<(ByteBuffer& data, LFGProposalUpdatePlayer const& lfgProposalUpdatePlayer)
    {
        data << uint8(lfgProposalUpdatePlayer.Roles);
        data.WriteBit(lfgProposalUpdatePlayer.Me);
        data.WriteBit(lfgProposalUpdatePlayer.SameParty);
        data.WriteBit(lfgProposalUpdatePlayer.MyParty);
        data.WriteBit(lfgProposalUpdatePlayer.Responded);
        data.WriteBit(lfgProposalUpdatePlayer.Accepted);
        data.FlushBits();

        return data;
    }

    WorldPacket const* LFGProposalUpdate::Write()
    {
        _worldPacket << Ticket;
        _worldPacket << uint64(InstanceID);
        _worldPacket << uint32(ProposalID);
        _worldPacket << uint32(Slot);
        _worldPacket << int8(State);
        _worldPacket << uint32(CompletedMask);
        _worldPacket << uint32(EncounterMask);
        _worldPacket << uint32(Players.size());
        _worldPacket << uint8(Unused);
        _worldPacket.WriteBit(ValidCompletedMask);
        _worldPacket.WriteBit(ProposalSilent);
        _worldPacket.WriteBit(IsRequeue);
        _worldPacket.FlushBits();

        for (LFGProposalUpdatePlayer const& player : Players)
            _worldPacket << player;

        return &_worldPacket;
    }

    WorldPacket const* LFGOfferContinue::Write()
    {
        _worldPacket << uint32(Slot);

        return &_worldPacket;
    }

    WorldPacket const* LFGTeleportDenied::Write()
    {
        _worldPacket.WriteBits(Reason, 4);
        _worldPacket.FlushBits();

        return &_worldPacket;
    }

    void WorldPackets::LFG::CompleteReadyCheck::Read()
    {
        _worldPacket >> PartyIndex;
        IsReady = _worldPacket.ReadBit();

    }
    WorldPacket const* LFGListUpdateBlacklist::Write()
    {
        std::sort(Blacklists.begin(), Blacklists.end(), [](LFGListBlacklist const& a, LFGListBlacklist const& b) -> bool
            {
                return a.ActivityID < b.ActivityID;
            });
        _worldPacket << uint32(Blacklists.size());
        for (LFGListBlacklist blacklist : Blacklists)
        {
            _worldPacket << blacklist.ActivityID;
            _worldPacket << blacklist.Reason;
        }
        return &_worldPacket;
    }
    void LfgListJoin::Read()
    {
        _worldPacket >> Request;
    }

    WorldPacket const* WorldPackets::LFG::LfgListJoinResult::Write()
    {
        _worldPacket << ApplicationTicket;
        _worldPacket << Result;
        _worldPacket << Status;
        return &_worldPacket;
    }

    void WorldPackets::LFG::LfgListInviteResponse::Read()
    {
        _worldPacket >> ApplicantTicket;
        //_worldPacket.ResetBitReader();
        Accept = _worldPacket.ReadBit();
    }

    void WorldPackets::LFG::LfgListCancelApplication::Read()
    {
        _worldPacket >> ApplicantTicket;
    }

    void WorldPackets::LFG::LfgListDeclineApplicant::Read()
    {
        _worldPacket >> ApplicantTicket;
        _worldPacket >> ApplicationTicket;
    }

    void WorldPackets::LFG::LfgListInviteApplicant::Read()
    {
        _worldPacket >> ApplicantTicket;
        _worldPacket >> ApplicationTicket;
        Applicant.resize(_worldPacket.read<uint32>());
        for (auto& v : Applicant)
        {
            _worldPacket >> v.PlayerGUID;
            _worldPacket >> v.Role;
        }
    }

    void WorldPackets::LFG::LfgListSearch::Read()
    {
        auto count = _worldPacket.ReadBits(5);
        _worldPacket.FlushBits();
        if (count)
        {
            for (int i = 0; i < int(count); i++)
            {
                auto len = new uint32[3];
                for (int i = 0; i < 3; i++)
                    len[i] = _worldPacket.ReadBits(5);
                _worldPacket.FlushBits();
                for (int i = 0; i < 3; i++)
                    LanguageSearchFilter += " " + std::string(_worldPacket.ReadString(len[i]));
            }
        }
        _worldPacket >> CategoryID;
        _worldPacket >> SearchTerms;
        _worldPacket >> Filter;
        _worldPacket >> PreferredFilters;
        Blacklist.resize(_worldPacket.read<uint32>());
        Guids.resize(_worldPacket.read<uint32>());
        for (auto& v : Blacklist)
        {
            _worldPacket >> v.ActivityID;
            //_worldPacket >> v.Reason;
        }
        for (auto& v : Guids)
            _worldPacket >> v;
    }

    WorldPacket const* WorldPackets::LFG::LfgListUpdateStatus::Write()
    {
        _worldPacket << ApplicationTicket;
        _worldPacket << ExpirationTime;
        _worldPacket << Status;
        _worldPacket << Request;
        _worldPacket.WriteBit(Listed);
        _worldPacket.FlushBits();
        return &_worldPacket;
    }

    void LfgListApplyToGroup::Read()
    {
        _worldPacket >> application.ApplicationTicket;
        _worldPacket >> application.ActivityID;
        application.Role = _worldPacket.read<uint8>();
        application.Comment = _worldPacket.ReadString(_worldPacket.ReadBits(8));
    }

    WorldPacket const* WorldPackets::LFG::LfgListSearchStatus::Write()
    {
        _worldPacket << Ticket;
        _worldPacket << Status;
        _worldPacket.WriteBit(UnkBit);
        _worldPacket.FlushBits();
        return &_worldPacket;
    }

    WorldPacket const* WorldPackets::LFG::LfgListSearchResults::Write()
    {
        _worldPacket << AppicationsCount;
        _worldPacket << static_cast<uint32>(SearchResults.size());
        for (auto const& v : SearchResults)
            _worldPacket << v;
        return &_worldPacket;
    }

    void WorldPackets::LFG::LfgListUpdateRequest::Read()
    {
        _worldPacket >> Ticket;
        _worldPacket >> UpdateRequest;
    }

    WorldPacket const* WorldPackets::LFG::LfgListApplyToGroupResponce::Write()
    {
        _worldPacket << ApplicantTicket;
        _worldPacket << ApplicationTicket;
        _worldPacket << InviteExpireTimer;
        _worldPacket << Status;
        _worldPacket << Role;
        _worldPacket << SearchResult;
        _worldPacket.WriteBits(ApplicationStatus, 4);
        _worldPacket.FlushBits();
        return &_worldPacket;
    }

    WorldPacket const* WorldPackets::LFG::LfgListApplicationUpdate::Write()
    {
        _worldPacket << ApplicationTicket;
        _worldPacket << static_cast<uint32>(Applicants.size());
        _worldPacket << UnkInt;
        for (auto const& v : Applicants)
        {
            _worldPacket << v.ApplicantTicket;
            _worldPacket << v.ApplicantPartyLeader;
            _worldPacket << static_cast<uint32>(v.Member.size());
            for (auto const& z : v.Member)
            {
                _worldPacket << z.PlayerGUID;
                _worldPacket << z.VirtualRealmAddress;
                _worldPacket << z.ItemLevel;
                _worldPacket << z.Level;
                _worldPacket << z.HonorLevel;
                _worldPacket << z.PossibleRoleMask;
                _worldPacket << z.SelectedRoleMask;
                _worldPacket << static_cast<uint32>(z.AcStat.size());
                for (auto const& x : z.AcStat)
                {
                    _worldPacket << x.UnkInt4;
                    _worldPacket << x.UnkInt5;
                }
            }
            _worldPacket.WriteBits(v.ApplicationStatus, 4);
            _worldPacket.WriteBit(v.Listed);
            _worldPacket << (v.Comment, 8);
        }
        return &_worldPacket;
    }

    WorldPacket const* WorldPackets::LFG::LfgListSearchResultUpdate::Write()
    {
        _worldPacket << static_cast<uint32>(ResultUpdate.size());
        for (auto const& update : ResultUpdate)
        {
            _worldPacket << update.ApplicationTicket;
            _worldPacket << update.UnkInt;
            _worldPacket << static_cast<uint32>(update.Members.size());
            for (auto const& member : update.Members)
                _worldPacket << member;
            _worldPacket.WriteBit(update.UnkGuid.has_value());
            _worldPacket.WriteBit(update.VirtualRealmAddress.has_value());
            _worldPacket.WriteBit(update.UnkInt2.has_value());
            _worldPacket.WriteBit(update.UnkBit96);
            _worldPacket.WriteBit(update.UnkGuid2.has_value());
            _worldPacket.WriteBit(update.LeaderGuid.has_value());
            _worldPacket.WriteBit(update.UnkGuid3.has_value());
            _worldPacket.WriteBit(update.UnkBIt);
            _worldPacket.WriteBit(update.UnkBIt2);
            _worldPacket.WriteBit(update.UnkBIt3);
            _worldPacket.WriteBit(update.UnkBIt4);
            _worldPacket.FlushBits();
            _worldPacket << update.JoinRequest;
            if (update.UnkGuid.has_value())
                _worldPacket << *update.UnkGuid;
            if (update.VirtualRealmAddress.has_value())
                _worldPacket << *update.VirtualRealmAddress;
            if (update.UnkInt2.has_value())
                _worldPacket << *update.UnkInt2;
            if (update.UnkGuid2.has_value())
                _worldPacket << *update.UnkGuid2;
            if (update.LeaderGuid.has_value())
                _worldPacket << *update.LeaderGuid;
            if (update.UnkGuid3.has_value())
                _worldPacket << *update.UnkGuid3;
        }
        return &_worldPacket;
    }

}
