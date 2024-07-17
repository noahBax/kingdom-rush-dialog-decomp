"sleeping_fungus_attack"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
       "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeRadius"  "stat(%TARGET, #explodeRadius)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "1"
        }
    }

    "Modifiers"
    {
        "sleeping_fungus_invulnerable_modifier"
        {
            "OnPreHit"
            {
                
                "CancelHit"
                {

                }
            }

            "States"
            {
                "NON_TARGETABLE" "1"
            }
        }

        "sleeping_fungus_spent_modifier"
        {
            "AnimationOverride" "Spent"

            "OnRemoved"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "sleeping_fungus_invulnerable_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "sleeping_fungus_attack_modifier"
                    "Target"         "%TARGET"
                }
            }
        }

        "sleeping_fungus_triggered_modifier"
        {
            
        }



        "sleeping_fungus_attack_modifier"
        {
           "Passive" "1"


           "OnHitEnd"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "sleeping_fungus_invulnerable_modifier"
                    "Target"         "%TARGET"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "sleeping_fungus_attack_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "sleeping_fungus_triggered_modifier"
                    "Target"         "%TARGET"
                }

                "SetToContext"
                {
                    "Context" "currentContext()"
                    "Key" "#explodeDelay"
                    "Value" "randomBetween(0.3, 1.2)"
                    "Type" "FIELD_FLOAT"
                }

                "StartLogicTick"
                {
                    "Time" "%explodeDelay"
                    "TickType" "FX "
                    "Position" "unitPosition(%SOURCE)"
                }

                "Delay"
                {
                    "Time" "%explodeDelay"
                    "Actions"
                    {
                        "AttachEffect"
                        {
                            "EffectName" "SleepingFungusSmokeFXMega"
                            "Target" "unitPosition(%TARGET)"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"      "unitPosition(%TARGET)"
                                "Radius"     "expr(%explodeRadius)"
                                "Teams"     "TEAM_ALL"
                                "ExcludedUnits" "objectList(%TARGET)"
                            }

                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "Hit"
                                {
                                    "Target" "%newTarget"
                                    
                                    "Tags" "stringList(#ENVIRONMENTAL, #AOE)"

                                    "InitActions"
                                    {
                                        
                                    }
                                    "Actions"
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"  "modifier_asleep"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%duration"
                                            "Refresh"   "1"
                                        }

                                    }

                                }
                            }
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "sleeping_fungus_spent_modifier"
                            "Target"         "%TARGET"
                            "Duration"  "2"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "sleeping_fungus_triggered_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }

            }
        }
    }
}
