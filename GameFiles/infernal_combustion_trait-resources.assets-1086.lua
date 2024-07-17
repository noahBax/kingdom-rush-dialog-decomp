"infernal_combustion_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "Icon" "InfernalCombustion"

    "AbilitySpecial"
    {
       "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeRadius"  "1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeDamage"  "ceil(stat(%TARGET, #attackDamage)/2)"
            
        }
        "03"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "2"
        }
        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeDamageForTooltip" "ceil(stat(%CASTER,#attackDamage)/2)"
        }
    }

    "Modifiers"
    {
        "infernal_combustion_explode_modifier"
        {
             "Passive" "1"


             "OnRemoved"
             {
                "Conditional"
                {
                    "Condition" "isOnState(%TARGET, #DEAD)"
                    "Actions"
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatOloch_infernalCombustion"
                        }
                        
                        "SetToContext"
                        {
                            "Context" "currentContext()"
                            "Key" "#explodeDelay"
                            "Value" "0.78"
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
                                    "EffectName" "InfernalCombustionExplosionFXMega"
                                    "Target" "unitPosition(%TARGET)"
                                }

                                "ActOnTargets"
                                {
                                    "Target"
                                    {
                                        "Center"      "unitPosition(%TARGET)"
                                        "Radius"     "expr(%explodeRadius)"
                                        "Teams"     "TEAM_ENEMY"
                                    }

                                    "IteratorName" "#newTarget"
                                
                                    "Actions"    
                                    {
                                        "Hit"
                                        {
                                            "Target" "%newTarget"
                                            "EffectName" "AbyssalBlastHitFXMega" 
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
                                               "Knockback" 
                                                {
                                                    "Target" "%HITTARGET"
                                                    "Center" "unitPosition(%HITSOURCE)"
                                                    "Strength" "1"
                                               }

                                               "ApplyModifier"
                                                {
                                                    "ModifierName"  "modifier_burning"
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
    }
}
