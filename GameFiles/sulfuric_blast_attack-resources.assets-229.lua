"sulfuric_blast_attack"
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
            "stunDuration"  "1"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "poisonDuration"  "2"
        }
    }

    "Modifiers"
    {
        "sulfuric_blast_invulnerable_modifier"
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

        "sulfuric_blast_spent_modifier"
        {
            "AnimationOverride" "Spent"

            "OnRemoved"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "sulfuric_blast_invulnerable_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "sulfuric_blast_attack_modifier"
                    "Target"         "%TARGET"
                }
            }
        }

        "sulfuric_blast_triggered_modifier"
        {
            
        }



        "sulfuric_blast_attack_modifier"
        {
           "Passive" "1"

           "OnHitEnd"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "sulfuric_blast_invulnerable_modifier"
                    "Target"         "%TARGET"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "sulfuric_blast_attack_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "sulfuric_blast_triggered_modifier"
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

                        "PlayActivityAnimation"
                        {
                            "Target" "%TARGET"
                            "Animation" "Attack"
                        }

                        "AttachEffect"
                        {
                            "EffectName" "SulfuricBlastSmokeFXMega"
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
                                            "ModifierName"  "modifier_stunned"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%stunDuration + (equal(activeUnit(), %HITTARGET) ? 1 : 0)"
                                            "Refresh"       "1"
                                        }

                                        "ApplyModifier"
                                        {
                                            "ModifierName"  "modifier_new_poison"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%poisonDuration"
                                            "Refresh"       "1"
                                        }
                                    }

                                }
                            }
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "sulfuric_blast_spent_modifier"
                            "Target"         "%TARGET"
                            "Duration"  "2"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "sulfuric_blast_triggered_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }

            }
        }
    }
}
