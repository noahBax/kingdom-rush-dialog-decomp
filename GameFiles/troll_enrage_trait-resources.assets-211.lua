"troll_enrage_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "Icon" "Enrage"
    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "extraRegeneration"                  "1"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "extraDamage"                  "1"
        }
    }

    "Modifiers"
    {
        "troll_enrage_trait_modifier"
        {
            "Passive" "1"

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition" "isOnState(%DEAD, #TROLL) && matchesTeam(unitGroup(%TARGET), unitGroup(%DEAD), @TeamFilter(TEAM_FRIENDLY)) && safeEquals(hexDistance(unitHex(%DEAD), unitHex(%TARGET)), 1) "

                    "Actions" 
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "troll_enrage_enraged_modifier"
                            "Target"         "%TARGET"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "troll_enrage_enraged_modifier"
                            "Target"         "%TARGET"
                            "Duration" "2"
                        }

                        "AttachEffect"
                        {
                            "EffectName"    "TrollEnrageFXMega"
                            "Target"        "%TARGET"
                        } 
                    }
                }
            }
        }

        "troll_enrage_enraged_modifier"
        {

            "EffectName" "TrollEnrageStatusFXMega"
            "Icon" "Enraged02"
            "IconPriority" "50"

            "PropertiesAdd"
            {
                "troll_regeneration" "%extraRegeneration"
                "extraDamage" "%extraDamage"
            }
        }
    }
}

