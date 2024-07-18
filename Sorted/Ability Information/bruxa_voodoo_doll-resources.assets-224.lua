"bruxa_voodoo_doll"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityCustomTargetFilter"         "not(isOnState(%UNIT, #NO_SKULL)) && not(isOnState(%UNIT, #BOSS))"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "20"
    "AbilityCooldown"                   "4"
    "AbilityPrewarmCooldown"            "1"
    "AbilityAPCost"                     "2"
    "AnimationID"                       "VoodooBlow"
    "Icon"                              "VoodooDoll"
    "CastFXId"                          "BruxaVoodooDollCastFXMega"


     "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"          "5"
        }
    }

    "OnAbilityAction"
    {
        "SpawnUnit"
        {
            "UnitName"                  "#BruxaVoodooDoll"
            "Position"                  "hexPosition(hexNeighbourOrNextFree(unitHex(%CASTER), unitHex(%TARGET), 0))"
            "UnitGroup"                 "unitGroup(%TARGET)"
            "IsAI"                      "1"
            "AddToInitiativeOrder"      "0"

            "OnSpawn"
            {
                "AttachEffect"
                {
                    "EffectName"             "BruxaVoodooDollSummonFXMega"
                    "Target"                 "%UNIT"
                }

                "AttachEffect"
                {
                    "EffectName"             "BruxaVoodooDollSummonFXMega"
                    "Target"                 "%TARGET"
                }

                "PlayActivityAnimation"
                {
                    "Target"                "%UNIT"
                    "Animation"             "Spawn"
                }

                "SetStat"
                {
                    "Target"                "%UNIT"
                    "Stat"                  "#unitTargetId"
                    "Value"                 "getUnitId(%TARGET)"
                }

                "ApplyModifier"
                {
                    "ModifierName"          "bruxa_voodoo_doll_modifier"
                    "Target"                "%UNIT"
                }

                "ApplyModifier"
                {
                    "ModifierName"          "bruxa_voodoo_doll_effect_modifier"
                    "Target"                "%UNIT"
                }

                "ApplyModifier"
                {
                    "ModifierName"          "bruxa_voodoo_doll_effect_modifier"
                    "Target"                "%TARGET"
                }
            }
        }
    }

    "Modifiers"
    {
        "bruxa_voodoo_doll_effect_modifier"
        {   
            "EffectName"            "BruxaVoodooDollDebuffFXMega"
        }

        "bruxa_voodoo_doll_modifier"
        {
            "OnPostHit"
            {
                "AttachEffect"
                {
                    "EffectName"             "BruxaVoodooDollHitFXMega"
                    "Target"                 "%TARGET"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"            "%TARGET"
                        "ExcludedUnits"     "objectList(%TARGET)"
                        "Radius"            "20"
                        "Teams"             "TEAM_ENEMY"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Conditional"
                        {
                            "Condition"                 "equal(round(getUnitId(%newTarget)), stat(%TARGET, #unitTargetId))"
                            "Actions"
                            {
                                "Delay"
                                {
                                    "Time"          "0.25"
                                    "Actions"
                                    {
                                        "StartLogicTick"
                                        {
                                            "Time"          "0.5"
                                            "TickType"      "Target"
                                            "Position"      "unitPosition(%newTarget)"
                                        }

                                        "Delay"
                                        {
                                            "Time"          "0.25"
                                            "Params"
                                            {
                                                "dollDamage" 
                                                {
                                                    "type"      "FIELD_FLOAT"
                                                    "value"     "hitEffectiveDamage(%HIT)"
                                                }
                                            }

                                            "Actions"
                                            {
                                                "QueueHit"
                                                {
                                                    "Target"            "%newTarget"
                                                    "Source"            "%ATTACKER"
                                                    "EffectName"        "BruxaVoodooDollEnemyHitFXMega" 
                                                    "Tags"              "stringList(#MAGICAL, #TARGETED)"

                                                    "InitActions"
                                                    {
                                                        "AddDamage"
                                                        {
                                                            "Type"              "DAMAGE_MAGICAL"
                                                            "Damage"            "%dollDamage"
                                                        }
                                                    }

                                                    "Actions"
                                                    {
                                                        "Conditional"
                                                        {
                                                            "Condition" "isOnState(%newTarget, #DEAD)"
                                                            "Actions"
                                                            {
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
                            }
                        }
                    }
                }
            }

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition"                 "equal(round(getUnitId(%DEAD)), stat(%TARGET, #unitTargetId))"
                    "Actions"
                    {
                        "KillUnit"
                        {
                            "Target"        "%TARGET"
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
