"cleaver_undying_rage"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_FRIENDLY"
    "AnimationID"                       "SpellCastC"
    "CastFXId"                          "CleaverUndyingRageCastFXMega"
    "Icon"                              "UndyingRage"
    "AbilityCastRange"                  "0"
    "AbilityCooldown"                   "4"
    "AbilityAPCost"                     "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "duration"                  "2"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "minHealth"                  "1"
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
            "ModifierName"              "cleaver_undying_rage_modifier"
            "Target"                    "%TARGET"
            "Duration"                  "%duration"
            "Refresh"                   "1"
        }
    }

    "Modifiers"
    {
        "cleaver_undying_rage_modifier"
        {   
            "Tags"                       "shield"
            "Icon"                       "UndyingRage"
            "IconPriority"               "50"
            "EffectName"                 "CleaverUndyingRageStatusFXMega"

            "OnHitPreResult"
           {
                "Conditional"
                {
                    "Condition"             "safeEquals(stat(%TARGET, #health), 0)"
                    "Actions" 
                    {
                        "SetStat"
                        {
                            "Target"        "%TARGET"
                            "Stat"          "#health"
                            "Value"         "%minHealth"
                        }

                        "UnitRaiseMessage"
                        {
                            "Unit"          "%TARGET"
                            
                            "Icon"          "UndyingRage"
                        }
                    }
                }
            }
        }
    }
}
