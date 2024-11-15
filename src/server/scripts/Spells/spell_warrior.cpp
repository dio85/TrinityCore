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

/*
 * Scripts for spells with SPELLFAMILY_WARRIOR and SPELLFAMILY_GENERIC spells used by warrior players.
 * Ordered alphabetically using scriptname.
 * Scriptnames of files in this file should be prefixed with "spell_warr_".
 */

#include "ScriptMgr.h"
#include "SpellScript.h"
#include "Unit.h"

enum WarriorSpells
{
    SPELL_WARRIOR_CHARGE_STUN                   = 7922,
    SPELL_WARRIOR_CHARGE_ENERGIZE               = 34846,
    SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_BUFF    = 65156,
    SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_TALENT  = 64976
};
// 78 - Heroic Strike
class spell_warr_heroic_strike : public SpellScript
{
    // Damage = {8+$ap*60/100}
    void CalculateDamage(Unit* /*victim*/, int32& damage, int32& /*flatMod*/, float& /*pctMod*/)
    {
        damage = static_cast<int32>(8 + GetCaster()->GetTotalAttackPowerValue(BASE_ATTACK) * 0.6f);
    }

    void Register() override
    {
        CalcDamage += SpellCalcDamageFn(spell_warr_heroic_strike::CalculateDamage);
    }
};

class spell_warr_charge : public SpellScript
{
    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo(
            {
                SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_TALENT,
                SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_BUFF,
                SPELL_WARRIOR_CHARGE_ENERGIZE,
                SPELL_WARRIOR_CHARGE_STUN
            });
    }

    void HandleStun(SpellEffIndex /*effIdex*/)
    {
        if (Unit* caster = GetCaster())
            caster->CastSpell(GetHitUnit(), SPELL_WARRIOR_CHARGE_STUN, true);
    }

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        Unit* caster = GetCaster();
        if (!caster)
            return;

        caster->CastSpell(caster, SPELL_WARRIOR_CHARGE_ENERGIZE, { SPELLVALUE_BASE_POINT0, GetEffectValue() });

        // Juggernaut crit bonus
        if (caster->HasAura(SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_TALENT))
            caster->CastSpell(caster, SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_BUFF, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_charge::HandleStun, EFFECT_0, SPELL_EFFECT_CHARGE);
        OnEffectHitTarget += SpellEffectFn(spell_warr_charge::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
    }
};

void AddSC_warrior_spell_scripts()
{
    RegisterSpellScript(spell_warr_heroic_strike);
    RegisterSpellScript(spell_warr_charge);
}
