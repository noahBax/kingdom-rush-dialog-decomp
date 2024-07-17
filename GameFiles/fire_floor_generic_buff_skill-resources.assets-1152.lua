"fire_floor_generic_buff_skill"
{
    
    
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "dotDuration"            "2"
        }

        "02"
        {
            "var_type"            "FIELD_FLOAT"
            "extraDamage"            "1"
        }
    }

    "Modifiers"
    {
        "fire_floor_tile_modifier"
        {
            "EffectName" "FireFloorFXMega"
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
                                "Hit"
                                {
                                    "Target" "%UNIT"
                                    "Source" "%TARGET"
                                    
                                    "EffectName" "FireballHitFXMega" 
                                    "Tags" "stringList(#ENVIRONMENTAL)"

                                    "InitActions"
                                    {
                                        "Conditional"
                                        {
                                            "Condition" "isOnState(%HITTARGET, #BURNING)"

                                            "Actions" 
                                            {
                                                "AddDamage"
                                                {
                                                    "Type"          "DAMAGE_TRUE"
                                                    "Damage"        "%extraDamage"
                                                }
                                            }
                                        }
                                    }

                                    "Actions" 
                                    {
                                        "Conditional"
                                        {
                                            "Condition" "isOnState(%HITTARGET, #BURNING)"
                                            
                                            "Actions"
                                            {

                                            }
                                            
                                            "ElseActions" 
                                            {
                                                "ApplyModifier"
                                                {
                                                    "ModifierName"  "modifier_burning"
                                                    "Target"        "%HITTARGET"
                                                    "Duration"      "%dotDuration"
                                                    "Refresh"   "1"
                                                }
                                            }
                                        }

                                        "PlaySound"
                                        {
                                            "Sound" "#krl_sfx_combatGeneric_stepOnFire"
                                        }
                                    }
                                }
                            }
                        }
                    }
               }
            }

            "OnTurnStartedGlobal"
            {
               "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "0"
                        "Teams"     "TEAM_ALL"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Conditional" 
                        {
                            "Condition" "equal(activeUnit(), %newTarget)"

                            "Actions"
                            {
                                "Hit"
                                {
                                    "Target" "%newTarget"
                                    "Source" "%TARGET"
                                    
                                    "EffectName" "FireballHitFXMega" 
                                    "Tags" "stringList(#ENVIRONMENTAL)"

                                    "InitActions"
                                    {
                                        "Conditional"
                                        {
                                            "Condition" "isOnState(%HITTARGET, #BURNING)"

                                            "Actions" 
                                            {
                                                "AddDamage"
                                                {
                                                    "Type"          "DAMAGE_TRUE"
                                                    "Damage"        "%extraDamage"
                                                }
                                            }
                                        }
                                    }

                                    "Actions" 
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"  "modifier_burning"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%dotDuration"
                                            "Refresh"   "1"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }


            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"        "%TARGET"
                }
            }
        }
    }
}
