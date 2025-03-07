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

#ifndef MythicPlusPacketsCommon_h__
#define MythicPlusPacketsCommon_h__

#include "ObjectGuid.h"
#include "PacketUtilities.h"
#include "Packet.h"
#include "ObjectGuid.h"

namespace WorldPackets
{
    namespace MythicPlus
    {
        struct DungeonScoreMapSummary
        {
            int32 ChallengeModeID = 0;
            float MapScore = 0.0f;
            int32 BestRunLevel = 0;
            int32 BestRunDurationMS = 0;
            bool FinishedSuccess = false;
            uint8 Unknown1110 = 0;
        };

        struct DungeonScoreSummary
        {
            float OverallScoreCurrentSeason = 0.0f;
            float LadderScoreCurrentSeason = 0.0f;
            std::vector<DungeonScoreMapSummary> Runs;
        };

        struct MythicPlusMember
        {
            ObjectGuid BnetAccountGUID;
            uint64 GuildClubMemberID = 0;
            ObjectGuid GUID;
            ObjectGuid GuildGUID;
            uint32 NativeRealmAddress = 0;
            uint32 VirtualRealmAddress = 0;
            int32 ChrSpecializationID = 0;
            int8 RaceID = 0;
            int32 ItemLevel = 0;
            int32 CovenantID = 0;
            int32 SoulbindID = 0;
        };

        struct MythicPlusRun
        {
            int32 MapChallengeModeID = 0;
            uint32 Level = 0;
            int32 DurationMs = 0;
            Timestamp<> StartDate;
            Timestamp<> CompletionDate;
            int32 Season = 0;
            std::vector<MythicPlusMember> Members;
            float RunScore = 0.0f;
            bool Completed = false;
        };

        struct DungeonScoreBestRunForAffix
        {
            int32 KeystoneAffixID = 0;
            MythicPlusRun Run;
            float Score = 0.0f;
        };

        struct DungeonScoreMapData
        {
            int32 MapChallengeModeID = 0;
            uint32 BestRunCount = 0;
            float OverAllScore = 0.0f;
            std::vector<DungeonScoreBestRunForAffix> BestRuns;
        };

        struct DungeonScoreSeasonData
        {
            int32 Season = 0;
            float SeasonScore = 0.0f;
            float LadderScore = 0.0f;
            std::vector<DungeonScoreMapData> SeasonMaps;
            std::vector<DungeonScoreMapData> LadderMaps;
        };

        struct DungeonScoreData
        {
            int32 TotalRuns = 0;
            std::vector<DungeonScoreSeasonData> Seasons;
        };

        struct MythicPlusReward
        {
            uint32 Unk1 = 0;
            uint32 Unk2 = 0;
            uint64 Unk3 = 0;
            uint64 Unk4 = 0;
            uint64 Unk5 = 0;
            bool UnknownBool = false;
        };

        ByteBuffer& operator<<(ByteBuffer& data, DungeonScoreSummary const& dungeonScoreSummary);
        ByteBuffer& operator<<(ByteBuffer& data, DungeonScoreData const& dungeonScoreData);


        class MythicPlusRequestMapStats final : public ClientPacket
        {
        public:
            MythicPlusRequestMapStats(WorldPacket&& packet) : ClientPacket(CMSG_MYTHIC_PLUS_REQUEST_MAP_STATS, std::move(packet)) { }//15

            void Read() override;

            ObjectGuid BnetAccountGUID;
            int64 MapChallengeModeID = 0;
        };

        class MythicPlusCurrentAffixes final : public ClientPacket
        {
        public:
            MythicPlusCurrentAffixes(WorldPacket&& packet) : ClientPacket(CMSG_REQUEST_MYTHIC_PLUS_AFFIXES, std::move(packet)) { }

            void Read() override;
        };

        class MythicPlusSeasonData final : public ClientPacket
        {
        public:
            MythicPlusSeasonData(WorldPacket&& packet) : ClientPacket(CMSG_REQUEST_MYTHIC_PLUS_SEASON_DATA, std::move(packet)) { }

            void Read() override;

        };

        class MythicPlusSeasonDataResult final : public ServerPacket
        {
        public:
            MythicPlusSeasonDataResult() : ServerPacket(SMSG_MYTHIC_PLUS_SEASON_DATA) { }

            WorldPacket const* Write() override;

            uint8 IsMythicPlusActive = 128;
        };

        class MythicPlusRequestMapStatsResult final : public ServerPacket
        {
        public:
            MythicPlusRequestMapStatsResult() : ServerPacket(SMSG_MYTHIC_PLUS_ALL_MAP_STATS) { }

            WorldPacket const* Write() override;

            uint32 RunCount = 0;
            uint32 RewardCount = 0;
            uint32 DungeonScoreSeasonDataCount = 0;
            uint32 Season = 9;
            uint32 Subseason = 0;
            std::vector<DungeonScoreSeasonData> DungeonScoreSeasonDatas;
            std::vector<MythicPlusReward> Rewards;
        };

        class MythicPlusCurrentAffixesResult final : public ServerPacket
        {
        public:
            MythicPlusCurrentAffixesResult() : ServerPacket(SMSG_MYTHIC_PLUS_CURRENT_AFFIXES) { }

            WorldPacket const* Write() override;

            uint32 Count = 0;
            std::array<uint32, 4> Affixes{ 0, 0, 0, 0 };
            std::array<uint32, 4> RequiredSeason{ 0, 0, 0, 0 };
        };

        class ResetChallengeMode final : public ClientPacket
        {
        public:
            ResetChallengeMode(WorldPacket&& packet) : ClientPacket(CMSG_RESET_CHALLENGE_MODE, std::move(packet)) { }

            void Read() override { }
        };

        class ChallengeModeReset final : public ServerPacket
        {
        public:
            ChallengeModeReset(WorldPacket&& packet) : ServerPacket(SMSG_CHALLENGE_MODE_RESET) {}

            WorldPacket const* Write() override;

            uint32 MapID = 0;
        };

        class StartChallengeMode final : public ClientPacket
        {
        public:
            StartChallengeMode(WorldPacket&& packet) : ClientPacket(CMSG_START_CHALLENGE_MODE, std::move(packet)) { }

            void Read() override;

            uint8 Bag = 0;
            int32 Slot = 0;
            ObjectGuid GameObjectGUID;
        };

        class UpdateDeathCount final : public ServerPacket
        {
        public:
            UpdateDeathCount() : ServerPacket(SMSG_CHALLENGE_MODE_UPDATE_DEATH_COUNT, 4) { }

            WorldPacket const* Write() override;

            uint32 DeathCount = 0;
        };

        class Complete final : public ServerPacket
        {
        public:
            Complete() : ServerPacket(SMSG_CHALLENGE_MODE_COMPLETE, 4) { }

            WorldPacket const* Write() override;

            uint32 MapId = 0;
            uint32 CompletionMilliseconds = 0;
            uint32 ChallengeLevel = 0;
            uint32 ChallengeId = 0;
            uint8 IsCompletedInTimer = 128;
        };

        class Start final : public ServerPacket
        {
        public:
            Start() : ServerPacket(SMSG_CHALLENGE_MODE_START) { }

            WorldPacket const* Write() override;

            uint32 MapID = 0;
            uint32 ChallengeID = 0;
            uint32 ChallengeLevel = 0;
            uint32 DeathCount = 0;

            uint32 Affixes1 = 0;
            uint32 Affixes2 = 0;
            uint32 Affixes3 = 0;
            uint32 Affixes4 = 0;

            uint32 ClientEncounterStartPlayerInfo = 0;

            uint8 Energized = 128;
        };

        class RequestLeaders final : public ClientPacket
        {
        public:
            RequestLeaders(WorldPacket&& packet) : ClientPacket(CMSG_CHALLENGE_MODE_REQUEST_LEADERS, std::move(packet)) { }

            void Read() override;

            time_t LastGuildUpdate = time(nullptr);
            time_t LastRealmUpdate = time(nullptr);
            uint32 MapId = 0;
            uint32 ChallengeID = 0;
        };

        struct ModeAttempt
        {
            struct Member
            {
                ObjectGuid Guid;
                uint32 VirtualRealmAddress = 0;
                uint32 NativeRealmAddress = 0;
                uint32 SpecializationID = 0;
            };

            uint32 InstanceRealmAddress = 0;
            uint32 AttemptID = 0;
            uint32 CompletionTime = 0;
            time_t CompletionDate = time(nullptr);
            uint32 MedalEarned = 0;
            std::vector<Member> Members;
        };

        class RequestLeadersResult final : public ServerPacket
        {
        public:
            RequestLeadersResult() : ServerPacket(SMSG_CHALLENGE_MODE_REQUEST_LEADERS_RESULT, 20 + 8) { }

            WorldPacket const* Write() override;

            uint32 MapID = 0;
            uint32 ChallengeID = 0;
            uint32 GuildLeadersCount = 0;
            uint32 RealmLeadersCount = 0;
            time_t LastGuildUpdate = time(nullptr);
            time_t LastRealmUpdate = time(nullptr);

            std::vector<ModeAttempt> GuildLeaders;
            std::vector<ModeAttempt> RealmLeaders;
        };

        class NewPlayerRecord final : public ServerPacket
        {
        public:
            NewPlayerRecord() : ServerPacket(SMSG_MYTHIC_PLUS_NEW_WEEK_RECORD, 4) { }

            WorldPacket const* Write() override;

            int32 MapID = 0;
            int32 CompletionMilliseconds = 0;
            uint32 ChallengeLevel = 0;
        };

        struct ItemReward
        {
            uint32 ItemID = 0;
            uint32 ItemDisplayID = 0;
            uint32 Quantity = 0;
        };

        struct CurrencyReward
        {
            CurrencyReward(uint32 ID, uint32 count) : CurrencyID(ID), Quantity(count) { }

            uint32 CurrencyID = 0;
            uint32 Quantity = 0;
        };

        struct MapChallengeModeReward
        {
            struct ChallengeModeReward
            {
                std::vector<ItemReward> ItemRewards;
                uint32 Money = 0;
                std::vector<CurrencyReward> CurrencyRewards;
            };

            uint32 MapId = 0;
            std::vector<ChallengeModeReward> Rewards;
        };


        class Rewards final : public ServerPacket
        {
        public:
            Rewards() : ServerPacket(SMSG_WEEKLY_REWARDS_PROGRESS_RESULT, 8) { }

            WorldPacket const* Write() override;

            std::vector<MapChallengeModeReward> MapChallengeModeRewards;
            std::vector<ItemReward> ItemRewards;
        };
    }
}

#endif // MythicPlusPacketsCommon_h__
