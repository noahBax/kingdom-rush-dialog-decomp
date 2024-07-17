"darkknight_spike_reforge"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_FRIENDLY"
    "AnimationID"                       "SpellCastB"
    "CastFXId"                          "SpikeReforgeCastFXMega"
    "Icon"                              "SpikeReforge"
    "AbilityCastRange"                  "0"
    "AbilityCooldown"                   "3"
    "AbilityAPCost"                     "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "thornsIncrease"           "3"
        }

        "02"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "duration"                  "stat(%CASTER, #level)"
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierTag"               "dot"
            "Target"                    "%TARGET"
        }

        "ApplyModifier"
        {
            "ModifierName"              "darkknight_spike_reforge_modifier"
            "Target"                    "%TARGET"
            "Duration"                  "expr(%duration)"
            "Refresh"                   "1"
        }

        "GiveArmor"
        {
            "Target"                    "%TARGET"
            "ArmorAmount"               "1000"
        }
    }

    "Modifiers"
    {
        "darkknight_spike_reforge_modifier"
        {
            "Icon"                       "SpikeReforge"
            "IconPriority"               "24"
            "EffectName"                 "SpikeReforgeStatusFXMega"

            "OnRemoved"
            {
                "GiveArmor"
                {
                    "Target"            "%TARGET"
                    "ArmorAmount"       "0"
                }
            }

            "PropertiesAdd"
            {
                "armorOfThornsDamage"             "%thornsIncrease"
            }
        }
    }
}
