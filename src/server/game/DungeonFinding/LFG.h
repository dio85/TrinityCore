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

#ifndef _LFG_H
#define _LFG_H

#include "Define.h"
#include "ObjectGuid.h"
#include <map>
#include <set>
#include <string>

namespace lfg
{

enum LFGEnum
{
    LFG_TANKS_NEEDED                             = 1,
    LFG_HEALERS_NEEDED                           = 1,
    LFG_DPS_NEEDED                               = 3
};

enum LfgRoles
{
    PLAYER_ROLE_NONE                             = 0x00,
    PLAYER_ROLE_LEADER                           = 0x01,
    PLAYER_ROLE_TANK                             = 0x02,
    PLAYER_ROLE_HEALER                           = 0x04,
    PLAYER_ROLE_DAMAGE                           = 0x08,
    PLAYER_ROLE_ANY                              = PLAYER_ROLE_LEADER | PLAYER_ROLE_TANK | PLAYER_ROLE_HEALER | PLAYER_ROLE_DAMAGE
};

enum LfgUpdateType
{
    LFG_UPDATETYPE_DEFAULT                       = 0,      // Internal Use
    LFG_UPDATETYPE_LEADER_UNK1                   = 1,      // FIXME: At group leave
    LFG_UPDATETYPE_LEAVE_RAIDBROWSER             = 2,
    LFG_UPDATETYPE_JOIN_RAIDBROWSER              = 3,
    LFG_UPDATETYPE_ROLECHECK_ABORTED             = 4,
    LFG_UPDATETYPE_JOIN_QUEUE                    = 6,
    LFG_UPDATETYPE_ROLECHECK_FAILED              = 7,
    LFG_UPDATETYPE_REMOVED_FROM_QUEUE            = 8,
    LFG_UPDATETYPE_PROPOSAL_FAILED               = 9,
    LFG_UPDATETYPE_PROPOSAL_DECLINED             = 10,
    LFG_UPDATETYPE_GROUP_FOUND                   = 11,
    LFG_UPDATETYPE_ADDED_TO_QUEUE                = 13,
    LFG_UPDATETYPE_SUSPENDED_QUEUE               = 14,
    LFG_UPDATETYPE_PROPOSAL_BEGIN                = 15,
    LFG_UPDATETYPE_UPDATE_STATUS                 = 16,
    LFG_UPDATETYPE_GROUP_MEMBER_OFFLINE          = 17,
    LFG_UPDATETYPE_GROUP_DISBAND_UNK16           = 18,     // FIXME: Sometimes at group disband
    LFG_UPDATETYPE_JOIN_QUEUE_INITIAL            = 25,
    LFG_UPDATETYPE_DUNGEON_FINISHED              = 26,
    LFG_UPDATETYPE_PARTY_ROLE_NOT_AVAILABLE      = 46,
    LFG_UPDATETYPE_JOIN_LFG_OBJECT_FAILED        = 48,
    LFG_UPDATETYPE_REMOVED_LEVELUP               = 49,
    LFG_UPDATETYPE_REMOVED_XP_TOGGLE             = 50,
    LFG_UPDATETYPE_REMOVED_FACTION_CHANGE        = 51
};

enum LfgState : uint8
{
    LFG_STATE_NONE,                                        // Not using LFG / LFR
    LFG_STATE_ROLECHECK,                                   // Rolecheck active
    LFG_STATE_QUEUED,                                      // Queued
    LFG_STATE_PROPOSAL,                                    // Proposal active
    //LFG_STATE_BOOT,                                      // Vote kick active
    LFG_STATE_DUNGEON = 5,                                 // In LFG Group, in a Dungeon
    LFG_STATE_FINISHED_DUNGEON,                            // In LFG Group, in a finished Dungeon
    LFG_STATE_RAIDBROWSER                                  // Using Raid finder
};

enum LfgQueueType
{
    LFG_QUEUE_DUNGEON       = 1,
    LFG_QUEUE_LFR           = 2,
    LFG_QUEUE_SCENARIO      = 3,
    LFG_QUEUE_FLEX          = 4,
    LFG_QUEUE_WORLD_PVP     = 5,
    LFG_QUEUE_SCHEDULED_PVP = 6,    // pvp brawl
};

/// Instance lock types
enum LfgLockStatusType
{
    LFG_LOCKSTATUS_INSUFFICIENT_EXPANSION        = 1,
    LFG_LOCKSTATUS_TOO_LOW_LEVEL                 = 2,
    LFG_LOCKSTATUS_TOO_HIGH_LEVEL                = 3,
    LFG_LOCKSTATUS_TOO_LOW_GEAR_SCORE            = 4,
    LFG_LOCKSTATUS_TOO_HIGH_GEAR_SCORE           = 5,
    LFG_LOCKSTATUS_RAID_LOCKED                   = 6,
    LFG_LOCKSTATUS_NO_SPEC                       = 14,
    LFG_LOCKSTATUS_HAS_RESTRICTION               = 15,
    LFG_LOCKSTATUS_ATTUNEMENT_TOO_LOW_LEVEL      = 1001,
    LFG_LOCKSTATUS_ATTUNEMENT_TOO_HIGH_LEVEL     = 1002,
    LFG_LOCKSTATUS_QUEST_NOT_COMPLETED           = 1022,
    LFG_LOCKSTATUS_MISSING_ITEM                  = 1025,
    LFG_LOCKSTATUS_NOT_IN_SEASON                 = 1031,
    LFG_LOCKSTATUS_MISSING_ACHIEVEMENT           = 1034
};

/// Used to hide random LFG dungeon entries from the dungeon finder. Either value above 0 is doing that, however, only 2 is being sent in sniffs
enum class LfgSoftLock : uint8
{
    None = 0,
    Unk1 = 1,
    Unk2 = 2
};

/// Answer state (Also used to check compatibilites)
enum LfgAnswer
{
    LFG_ANSWER_PENDING                           = -1,
    LFG_ANSWER_DENY                              = 0,
    LFG_ANSWER_AGREE                             = 1
};

struct TC_GAME_API LfgLockInfoData
{
    LfgLockInfoData(uint32 _lockStatus = 0, uint16 _requiredItemLevel = 0, float _currentItemLevel = 0, LfgSoftLock _softLock = LfgSoftLock::None) :
        lockStatus(_lockStatus), requiredItemLevel(_requiredItemLevel), currentItemLevel(_currentItemLevel), softLock(_softLock) { }

    uint32 lockStatus;
    uint16 requiredItemLevel;
    float currentItemLevel;
    LfgSoftLock softLock;
};

typedef std::set<uint32> LfgDungeonSet;
typedef std::map<uint32, LfgLockInfoData> LfgLockMap;
typedef std::map<ObjectGuid, LfgLockMap> LfgLockPartyMap;
typedef std::map<ObjectGuid, uint8> LfgRolesMap;
typedef std::map<ObjectGuid, ObjectGuid> LfgGroupsMap;

TC_GAME_API std::string ConcatenateDungeons(LfgDungeonSet const& dungeons);
TC_GAME_API std::string GetRolesString(uint8 roles);
TC_GAME_API std::string GetStateString(LfgState state);

// allow implicit enum to int conversions for formatting
inline int32 format_as(LfgUpdateType e) { return e; }
inline uint8 format_as(LfgState e) { return e; }

} // namespace lfg

#endif
