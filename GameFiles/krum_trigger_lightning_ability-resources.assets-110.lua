"krum_trigger_lightning_ability"
{
    "AbilityBehavior"   ""
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    "AbilityCastRange" "1000"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "0"
    "AnimationID" "NOANIMATION"
    "Icon" "Thunderbolt"

    "AbilitySpecial" 
    {

        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damageCenter"  "stat(%CASTER, #lightningDamageDirect)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "damageBorder"  "stat(%CASTER, #lightningDamageSplash)"
        }
    }

    "OnAbilityAction"
    {
        "StartLogicTick"
        {
            "Time" "0.3"
            "TickType" "PriorityCenter"
            "Position" "unitPosition(%TARGET)"
        }

        "Delay"
        {
            "Time" "0.3"
            "Actions"
            {

                "AttachEffect"
                {
                    "EffectName" "KrumLightningStrikeFXMega"
                    "Target" "unitPosition(%TARGET)"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "1"
                        "Teams"     "TEAM_ALL"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Conditional"
                        {
                            "Condition" "not(isOnState(%newTarget, #BOSS))"

                            "Actions"
                            {
                                "Hit"
                                {
                                    "Target" "%newTarget"
                                    "EffectName" "KrumElectricStrikeHitFXMega" 
                                    "Tags" "stringList(#MAGICAL, #AOE, #ENVIRONMENTAL)"

                                    "InitActions"
                                    {
                                        "Conditional"
                                        {
                                            "Condition" "safeEquals(hexDistance(unitHex(%newTarget), unitHex(%TARGET)), 0)"

                                            "Actions"
                                            {
                                                "AddDamage"
                                                {
                                                    "Type"            "DAMAGE_MAGICAL"
                                                    "Damage"        "expr(%damageCenter)"
                                                }
                                            }

                                            "ElseActions"
                                            {
                                                "AddDamage"
                                                {
                                                    "Type"            "DAMAGE_MAGICAL"
                                                    "Damage"        "expr(%damageBorder)"
                                                }
                                            }
                                        }
                                        
                                    }

                                    "Actions"
                                    {
                                        "Knockback" 
                                        {
                                            "Target" "%HITTARGET"
                                            "Center" "unitPosition(%TARGET)" 
                                            "Strength" "1"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                "KillUnit"
                {
                    "Target"        "%TARGET"
                }

                "SetStat"
                {
                    "Target" "%SOURCE"
                    "Stat" "#cantTargets"
                    "Value" "stat(%SOURCE, #cantTargets) - 1"
                }

                "Conditional"
                {
                    "Condition" "stat(%SOURCE, #downIteration) > 0 && safeEquals(stat(%SOURCE, #cantTargets), 0)"

                     "Actions"
                     {
                        "QueueCinematic"
                        {
                            "Cinematic" "#KrumFinishedLightning"
                        }
                     }
                }
            }
        }
    }

    "#OnThink"
    {
        "RunThisSkillAI"
        {
            "BrainId" "#Custom"
            "Target" "%UNIT"
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "30"
            "Considerations"
            {
                "is second action"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "Min" "1"
                        "Max" "2"
                        "Stat" "#actionsTaken"
                        "Owner" "1"
                    }
                }

                "isTarget"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#krumTarget"
                        "Owner" "0"
                    }
                }

                "not finished"
                {
                    "Curve" "Linear|20|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "1"
                        "Stat" "#startedTurn"
                        "Owner" "1"
                    }
                }

                "Priorizacion Por Distance mas cercano a la camara"
                {
                    "Curve" "Linear|-0.01|1|1|0"
                    "Consideration" "DistanceToCamera"
                    "Params"
                    {
                        "MinRange" "0"
                        "MaxRange" "15"
                    }
                }
            }
        }
    }
}
