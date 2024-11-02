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

#include "ScriptMgr.h"
#include "deadmines.h"
#include "InstanceScript.h"

#define NOTE_TEXT "A note falls to the floor!"

Position const NoteSpawn = { -74.36111f, -820.0139f, 40.67145f, 4.014257f };

ObjectData const creatureData[] =
{
    { NPC_GLUBTOK,              BOSS_GLUBTOK            },
    { NPC_HELIX_GEARBREAKER,    BOSS_HELIX_GEARBREAKER  },
    { NPC_FOE_REAPER_5000,      BOSS_FOE_REAPER_5000    },
    { NPC_ADMIRAL_RIPSNARL,     BOSS_ADMIRAL_RIPSNARL   },
    { NPC_CAPTAIN_COOKIE,       BOSS_CAPTAIN_COOKIE     },
    { NPC_VANESSA_VAN_CLEEF,    BOSS_VANESSA_VANCLEEF   },
    { 0,                        0                       } // END
};

DoorData const doorData[] =
{
    { GO_FACTORY_DOOR,      BOSS_GLUBTOK,           EncounterDoorBehavior::OpenWhenDone             },
    { GO_MAST_ROOM_DOOR,    BOSS_HELIX_GEARBREAKER, EncounterDoorBehavior::OpenWhenDone             },
    { GO_HEAVY_DOOR,        BOSS_HELIX_GEARBREAKER, EncounterDoorBehavior::OpenWhenNotInProgress    },
    { GO_FOUNDRY_DOOR,      BOSS_FOE_REAPER_5000,   EncounterDoorBehavior::OpenWhenDone             },
    { 0,                    0,                      EncounterDoorBehavior::OpenWhenDone             } // END
};

DungeonEncounterData const encounters[] =
{
    { BOSS_GLUBTOK,             {{ 1064 }}  },
    { BOSS_HELIX_GEARBREAKER,   {{ 1065 }}  },
    { BOSS_FOE_REAPER_5000,     {{ 1063 }}  },
    { BOSS_ADMIRAL_RIPSNARL,    {{ 1062 }}  },
    { BOSS_CAPTAIN_COOKIE,      {{ 1060 }}  },
    { BOSS_VANESSA_VANCLEEF,    {{ 1081 }}  }
};

class instance_deadmines : public InstanceMapScript
{
public:
    instance_deadmines() : InstanceMapScript(DMScriptName, 36) {  }

    struct instance_deadmines_InstanceMapScript : public InstanceScript
    {
        instance_deadmines_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
        {
            SetBossNumber(MAX_BOSS);
            //IsVisionOfThePastRunning = false;
            SetHeaders(DataHeader);
            SetBossNumber(EncounterCount);
            LoadObjectData(creatureData, nullptr);
            LoadDoorData(doorData);
            LoadDungeonEncounterData(encounters);

        }

        void OnGameObjectCreate(GameObject* go) override
        {
            switch (go->GetEntry())
            {
            case GO_FACTORY_DOOR: // Door after first boss
                FactoryDoorGUID = go->GetGUID();
                break;
            case GO_FOUNDRY_DOOR: // Door before ship
                FoundaryDoorGUID = go->GetGUID();
                break;
            case GO_HEAVY_DOOR:
                HeavyDoorGUID = go->GetGUID();
                break;
            case GO_IRON_CLAD_DOOR:
                IroncladDoorGUID = go->GetGUID();
                break;
            }
        }

        void SetData(uint32 type, uint32 value) override
        {
            switch (type)
            {
            case DATA_NIGHTMARE_HELIX:
                if (value == DONE)
                    if (GameObject* go = instance->GetGameObject(FoundaryDoorGUID))
                        go->SetGoState(GO_STATE_ACTIVE);
                break;
            case DATA_NIGHTMARE_MECHANICAL:
                if (value == DONE)
                    if (GameObject* go = instance->GetGameObject(IroncladDoorGUID))
                        go->SetGoState(GO_STATE_ACTIVE);
                break;
            case DATA_GLUBTOK:
                if (value == DONE)
                    if (GameObject* go = instance->GetGameObject(FactoryDoorGUID))
                        go->SetGoState(GO_STATE_ACTIVE);
                break;
            case EVENT_VISION_OF_THE_PAST:
                if (value == IN_PROGRESS)
                    StartVisionOfThePastEvent();
                else if (value == SPECIAL)
                    ResetVisionOfThePastEvent();
                else if (value == DONE)
                    IsVisionOfThePastRunning = false;
                break;
            }
        }

        bool SetBossState(uint32 id, EncounterState state) override
        {
            if (!InstanceScript::SetBossState(id, state))
                return false;

            switch (id)
            {
            case BOSS_GLUBTOK:
                if (state == DONE)
                    if (GameObject* go = instance->GetGameObject(FactoryDoorGUID))
                        go->SetGoState(GO_STATE_ACTIVE);
                break;
            case BOSS_HELIX_GEARBREAKER:
                if (state == DONE)
                    if (GameObject* go = instance->GetGameObject(HeavyDoorGUID))
                        go->SetGoState(GO_STATE_ACTIVE);
                break;
            case BOSS_FOE_REAPER_5000:
                if (state == DONE)
                    if (GameObject* go = instance->GetGameObject(FoundaryDoorGUID))
                        go->SetGoState(GO_STATE_ACTIVE);
                break;
            case BOSS_ADMIRAL_RIPSNARL:
                //if (state == DONE)
                //    break;
                break;
            case BOSS_CAPTAIN_COOKIE:
                if (state == DONE)
                {
                    if (instance->IsHeroic())
                    {
                        if (Creature* Note = SummonCreature(NPC_VANESSA_NOTE, NoteSpawn))
                        {
                            Note->TextEmote(NOTE_TEXT, 0, true);

                            if (GameObject* go = instance->GetGameObject(IroncladDoorGUID))
                                go->SetGoState(GO_STATE_READY);

                            if (GameObject* go = instance->GetGameObject(HeavyDoorGUID))
                                go->SetGoState(GO_STATE_READY);

                            if (GameObject* go = instance->GetGameObject(FoundaryDoorGUID))
                                go->SetGoState(GO_STATE_READY);

                        }
                    }
                }
                break;
            case DATA_VANNESSA_NIGHTMARE:
                if (state == FAIL)
                {
                    if (instance->SummonCreature(NPC_VANESSA_NOTE, NoteSpawn))
                    {
                        if (GameObject* go = instance->GetGameObject(IroncladDoorGUID))
                            go->SetGoState(GO_STATE_ACTIVE);

                        if (GameObject* go = instance->GetGameObject(HeavyDoorGUID))
                            go->SetGoState(GO_STATE_ACTIVE);

                        if (GameObject* go = instance->GetGameObject(FoundaryDoorGUID))
                            go->SetGoState(GO_STATE_ACTIVE);
                    }
                }
            case DATA_VANESSA:
                break;
            }

            return true;
        }

    private:
        ObjectGuid FactoryDoorGUID;
        ObjectGuid FoundaryDoorGUID;
        ObjectGuid HeavyDoorGUID;
        ObjectGuid IroncladDoorGUID;
        ObjectGuid uiVanessa;
        ObjectGuid uiVanessaNote;
        ObjectGuid uiVanessaBoss;
        ObjectGuid GlubtokGUID;

        ObjectGuid AllianceWarriorGUID;
        ObjectGuid AlliancePriestGUID;
        ObjectGuid AllianceRogueGUID;
        ObjectGuid AllianceHunterGUID;
        ObjectGuid AllianceMageGUID;
        ObjectGuid EdwinVanCleefGUID;
        ObjectGuid VanessaVanCleefGUID;

        uint32 TeamInInstance;
        bool IsVisionOfThePastRunning;
    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_deadmines_InstanceMapScript(map);
    }
};

void AddSC_instance_deadmines()
{
    new instance_deadmines();
}
