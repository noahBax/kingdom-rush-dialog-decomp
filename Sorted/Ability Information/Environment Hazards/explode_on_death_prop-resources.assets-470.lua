"explode_on_death_prop"
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
    }

    "Modifiers"
    {
        "explode_on_death_prop_modifier"
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
                    "ModifierName"    "explode_on_death_prop_modifier"
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

                "PlaySound"
                {
                    "Sound" "#krl_sfx_combatGeneric_burningEffect"
                }

                "Delay"
                {
                    "Time" "%explodeDelay"
                    "Actions"
                    {
                        "AttachEffect"
                        {
                            "EffectName" "FireballExplosionFXMega"
                            "Target" "unitPosition(%TARGET)"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"      "unitPosition(%TARGET)"
                                "Radius"     "expr(%explodeRadius)"
                                "Teams"     "TEAM_ALL"
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
