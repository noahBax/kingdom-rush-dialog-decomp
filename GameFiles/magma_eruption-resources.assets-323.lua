"magma_eruption"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"               "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"                   "3"
    "AbilityAPCost"                     "1"
    "AnimationID"                       "SpellCastC"
    "CastFXId"                          "OlochMagmaEruptionCastFXMega"
    "Icon"                              "MagmaEruption"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "RangedDmg"                 "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "epicRadius"                 "1"
        }
        "03"
        {
            "var_type"                  "FIELD_FLOAT"
            "epicDamage"                 "1"
        }

        "04"
        {
            "var_type"                  "FIELD_FLOAT"
            "epicDuration"                 "1"
        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                    "%TARGET"
            "SourcePos"                 "unitPosition(%TARGET, #Base)"
            "TargetPos"                 "unitPosition(%TARGET, #Base)"
            "Model"                     "EmptyProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"              "FIELD_FLOAT"
                    "value"             "expr(%RangedDmg)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "AttachEffect"
        {
            "EffectName"    "MagmaEruptionFXMega"
            "Target"        "unitPosition(%TARGET)"
        }

        "Hit"
        {
            "Target"                    "%TARGET"
            "EffectName"                "AbyssalBlastHitFXMega" 
            "Tags"                      "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_MAGICAL"
                    "Damage"            "%damage"
                }
            }

            "Actions"
            {
                "Conditional"
                {
                    "Condition"         "isOnState(%TARGET, #DEAD)"
                    "Actions"
                    {
                        "MarkHitLegendary"
                        {
                        }

                        "SetToContext"
                        {
                            "Context"       "currentContext()"
                            "Key"           "#explodeDelay"
                            "Value"         "randomBetween(1,1)"
                            "Type"          "FIELD_FLOAT"
                        }

                        "StartLogicTick"
                        {
                            "Time"          "%explodeDelay"
                            "TickType"      "FX"
                            "Position"      "unitPosition(%SOURCE)"
                        }

                        "Delay"
                        {
                            "Time"          "%explodeDelay"
                            "Actions"
                            {
                                "AttachEffect"
                                {
                                    "EffectName"    "AbyssalBlastHitFXMega"
                                    "Target"        "unitPosition(%TARGET, #Chest)"
                                }

                                "ActOnTargets"
                                {
                                    "Target"
                                    {
                                        "Center"        "unitPosition(%TARGET)"
                                        "Radius"        "%epicRadius"
                                        "Teams"         "TEAM_ALL"
                                    }

                                    "IteratorName"      "#newTarget"
                                
                                    "Actions"    
                                    {
                                        "Hit"
                                        {
                                            "Target"        "%newTarget"
                                            "EffectName"    "AbyssalBlastHitFXMega" 
                                            "Tags"          "stringList(#ENVIRONMENTAL, #AOE)"

                                            "InitActions"
                                            {
                                                "AddDamage"
                                                {
                                                    "Type"        "DAMAGE_PHYSICAL"
                                                    "Damage"      "%epicDamage"
                                                }
                                            }

                                            "Actions"
                                            {
                                               
                                               "ApplyModifier"
                                                {
                                                    "ModifierName"      "modifier_burning"
                                                    "Target"            "%HITTARGET"
                                                    "Duration"          "%epicDuration"
                                                    "Refresh"           "1"
                                                }
                                           }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
