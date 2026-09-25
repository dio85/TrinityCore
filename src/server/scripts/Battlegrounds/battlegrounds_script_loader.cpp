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

// This is where scripts' loading functions should be declared:
// Generic Arena Scripts
void AddSC_arena_scripts_generic();

// Alterac Valley
void AddSC_alterac_valley();
void AddSC_boss_balinda();
void AddSC_boss_drekthar();
void AddSC_boss_galvangar();
void AddSC_boss_vanndar();
void AddSC_battleground_alterac_valley();

// Arathi Basin
void AddSC_arathi_basin();
void AddSC_battleground_arathi_basin();

// Warsong Gulch
void AddSC_battleground_warsong_gulch();

// The name of this function should match:
// void Add${NameOfDirectory}Scripts()
void AddBattlegroundsScripts()
{
    AddSC_arena_scripts_generic();

    // Alterac Valley
    AddSC_alterac_valley();
    AddSC_boss_balinda();
    AddSC_boss_drekthar();
    AddSC_boss_galvangar();
    AddSC_boss_vanndar();
    AddSC_battleground_alterac_valley();

    // Arathi Basin
    AddSC_arathi_basin();
    AddSC_battleground_arathi_basin();

    // Warsong Gulch
    AddSC_battleground_warsong_gulch();
}
