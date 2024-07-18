"explode_on_death_fireworks"
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
            "var_type" "FIELD_EXPRESSION"
            "explodeDamage"  "stat(%TARGET, #explodeDamage)"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "1"
        }
    }

    "Modifiers"
    {
        "explode_on_death_fireworks_modifier"
        {
           "Passive" "1"


           "OnHitEnd"
            {
                "AttachEffect"
                {
                    "EffectName" "FireStatusFXMega"
                    "Target" "%TARGET"
                }


               "RemoveModifier"
                {
                    "ModifierName"    "explode_on_death_fireworks_modifier"
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
                            "EffectName" "FireWorkExplosionFXMega"
                            "Target" "unitPosition(%TARGET)"
                        }

                        "Times"
                        {   
                            "Times" "3"
                            "Actions"
                            {
                                "PlaySound"
                                {
                                    "Sound" "#krl_sfx_combatGeneric_fireworks"
                                }
                            }
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
                                    "EffectName" "FireballHitFXMega" 
                                    "Tags" "stringList(#ENVIRONMENTAL, #AOE)"

                                    "InitActions"
                                    {
                                        "AddDamage"
                                        {
                                            "Type"            "DAMAGE_PHYSICAL"
                                            "Damage"        "expr(%explodeDamage)"
                                        }
                                    }
                                    "Actions"
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"  "modifier_burning"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%duration"
                                            "Refresh"   "1"
                                        }

                                        "ApplyModifier"
                                        {
                                            "ModifierName"  "modifier_stunned"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%duration"
                                            "Refresh"   "1"
                                        }
                                    }

                                }
                            }
                        }

                        "KillUnit"
                        {
                            "Target"        "%TARGET"
                        }
                    }
                }

            }
        }
    }
}
