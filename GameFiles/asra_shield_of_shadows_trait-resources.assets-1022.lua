"asra_shield_of_shadows_trait"
{
    "AbilityBehavior"       "UNIT_TARGET | PASSIVE"
    "Icon" "ShieldOfShadows"

     "AbilitySpecial"
    {
       "01"
        {
            "var_type"              "FIELD_FLOAT"
            "duration"                  "1"
        }
    }

    "Modifiers"
    {
        "asra_shield_of_shadows_monitor_modifier"
        {
           "Passive" "1"

           "OnHitPreResult"
           {
                "Conditional"
                {
                    "Condition" "safeEquals(stat(%TARGET, #health),0)"
                    "Actions" 
                    {
                        "SetStat"
                        {
                            "Target" "%TARGET"
                            "Stat" "#health"
                            "Value" "1"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "asra_shield_of_shadows_monitor_modifier"
                            "Target"         "%TARGET"
                        }

                        "RemoveModifier"
                        {
                            "ModifierTag"    "shield"
                            "Target"         "%TARGET"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "asra_shield_of_shadows_shield_modifier"
                            "Target"         "%TARGET"
                            "Duration"      "%duration"
                        }

                    }
                }
           }

        }

        "asra_shield_of_shadows_shield_modifier"
        {
            "Tags" "shield"

            "EffectName" "ShieldOfShadowsFXMega"
            "Icon" "ShieldOfShadows"
            "IconPriority" "50"

            "OnPreHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && not(hasTags(hitTags(%HIT), #CANTBESHIELDED)"
                    "Actions" 
                    {
                        "CancelHit"
                        {

                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "asra_shield_of_shadows_shield_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }
        }
    }
}

