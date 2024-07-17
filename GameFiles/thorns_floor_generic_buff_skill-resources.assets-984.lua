"thorns_floor_generic_buff_skill"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | PASSIVE"
   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "rootDuration"        "2"
        }

        "02"
        {
            "var_type"            "FIELD_FLOAT"
            "bleedingDuration"    "2"
        }
    }

    "Modifiers"
    {
        "thorns_floor_modifier"
        {
            "EffectName" "ThornsFloorFXMega"
            "Tags" "floor_effect"
            "Passive" "1"

            "OnUnitEnteredNode"
            {
               "AreaControl"
               {
                    "Center" "unitHex(%TARGET)"
                    "Range" "0"
                    "From" "%from"
                    "To" "%to"
                    "EnterActions"
                    {
                        "Conditional" 
                        {
                            "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%UNIT), @TeamFilter(TEAM_ALL))"
                            "Actions"
                            {
                                "Conditional"
                                {
                                    "Condition" "isOnState(%UNIT, #IMMUNE_FOREST_FLOOR_EFFECTS)"
                                    "Actions"
                                    {
                                        "AttachEffect"
                                        {
                                            "EffectName"        "ThornsAttackWithoutBloodFXMega"
                                            "Target"            "%UNIT"
                                        }
                                    }

                                    "ElseActions"
                                    {
                                        "Hit"
                                        {
                                            "Target" "%UNIT"
                                            "Source" "%TARGET"
                                            "EffectName" "ThornsAttackFXMega" 
                                            "Tags" "stringList(#ENVIRONMENTAL)"

                                            "InitActions"
                                            {
                                                "InterruptUnit"
                                                {
                                                    "Target" "%HITTARGET"
                                                }
                                            }

                                            "Actions"
                                            {
                                                "ApplyModifier"
                                                {
                                                    "ModifierName"  "modifier_rooted"
                                                    "Target"        "%HITTARGET"
                                                    "Duration"      "%rootDuration"
                                                    "Refresh"       "1"
                                                }

                                                "ApplyModifier"
                                                {
                                                    "ModifierName"  "modifier_new_bleeding"
                                                    "Target"        "%HITTARGET"
                                                    "Duration"      "%bleedingDuration"
                                                    "Refresh"       "1"
                                                }
                                            }
                                        }
                                    }
                                }

                                "KillUnit"
                                {
                                    "Target"        "%SOURCE"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
