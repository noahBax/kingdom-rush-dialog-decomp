"lava_geyser_attack"
{
    "AbilityBehavior"           "UNIT_TARGET"
    "AbilityTargetFilterFlags"  "INCLUDE_NON_TARGETABLE"
    "AbilityTeamFilter"         "TEAM_ALL"
    "AbilityCastRange"          "0"
    "AbilityCooldown"           "1"
    "AbilityAPCost"             "1"
    "AnimationID"               "Eruption"
    "Icon"                      "MagmaRift"
    "CastFXId"                  "LavaGeyserAttackCastFXMega"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"
            "aoeRadius"         "stat(%SOURCE, #explodeRadius)"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "numberOfHits"      "3"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "minDamage"         "2"
        }

        "04"
        {
            "var_type"          "FIELD_FLOAT"
            "maxDamage"         "3"
        }

        "05"
        {
            "var_type"          "FIELD_FLOAT"
            "burnDuration"      "2"
        }

        "06"
        {
            "var_type"          "FIELD_EXPRESSION"
            "disabledTurns"     "stat(%SOURCE, #disabledTurns)"
        }
    }

    "OnAbilityAction"
    {   
        "#StopSound"
        {
            "Sound" "#krl_sfx_genericCombat_geyserActivated_loop"
        }
                
        "SetToContext"
        {
            "Context"       "currentContext()"
            "Type"          "FIELD_INTEGER"
            "Key"           "#numberOfHitsDone"
            "Value"         "0" 
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "unitPosition(%SOURCE)"
                "Source"            "%CASTER"
                "Radius"            "expr(%aoeRadius)"
                "Teams"             "TEAM_ALL"
                "MaxTargets"        "%numberOfHits"
                "Random"            "1"
                "ExcludedUnits"     "objectList(%SOURCE)"
            }
            "IteratorName"          "#newTarget"
            "Actions"  
            {
                "TrackingProjectile"
                {
                    "SourcePos"             "unitPosition(%SOURCE, #Chest)"
                    "Target"                "%newTarget"
                    "TargetPos"             "unitPosition(%newTarget, #Chest)"
                    "Model"                 "FireballProjectile"
                }

                "SetToContext"
                {
                    "Context"       "currentContext()"
                    "Type"          "FIELD_INTEGER"
                    "Key"           "#numberOfHitsDone"
                    "Value"         "%numberOfHitsDone + 1" 
                }
            }
        }

        "Conditional"
        {
            "Condition"             "%numberOfHits - %numberOfHitsDone > 0"
            "Actions" 
            {
                "ActOnHexas"
                {
                    "Center"        "unitHex(%TARGET)"
                    "Range"         "expr(%aoeRadius)"
                    "IteratorName"  "#hexa"
                    "RequireEmpty"  "1"
                    "Max"           "%numberOfHits - %numberOfHitsDone"
                    "Random"        "1"
                    "Actions"    
                    {
                        "TrackingProjectile"
                        {
                            "SourcePos"             "unitPosition(%SOURCE, #Chest)"
                            "TargetPos"             "hexPosition(%hexa)"
                            "Model"                 "FireballProjectile"
                            "Params"
                            {
                                "floorPoryectile" 
                                {
                                    "type"      "FIELD_FLOAT"
                                    "value"     "1"
                                }
                            }
                        }
                    }
                }
            }
        }

        "ApplyModifier"
        {
            "ModifierName"  "lava_geyser_disabled_modifier"
            "Target"        "%TARGET"
            "Duration"      "expr(%disabledTurns)"
        }
    }

    "OnProjectileHitUnit"
    {
        "Conditional"
        {
            "Condition" "%floorPoryectile"
            "Actions" 
            {
                "AttachEffect"
                {
                    "EffectName"    "FireballExplosionFXMega"
                    "Target"        "%TARGET"
                }

                "#SpawnUnit"
                {
                    "UnitName"      "#DummyUnit"
                    "Position"      "%TARGET"
                    "UnitGroup"     "unitGroup(%CASTER)"
                    "IsAI" "0"
                    "InheritsInitiative" "1"
                    "OnSpawn"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "fire_floor_tile_modifier"
                            "Target"            "%UNIT"
                            "Duration"          "%burnDuration"
                        }

                    }
                }
            }

            "ElseActions"
            {
                "Hit"
                {
                    "Target"                "%TARGET"
                    "EffectName"            "FireballExplosionFXMega" 
                    "Tags"                  "stringList(#PROJECTILE, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "randomI(%minDamage, %maxDamage)"
                        }
                    }

                    "Actions"
                    {
                        "Conditional"
                        {
                            "Condition" "not(isOnState(%HITTARGET, #DEAD))"
                            "Actions"
                            {
                                "RemoveModifier"
                                {
                                    "ModifierTag"       "dot"
                                    "Target"            "%HITTARGET"
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"      "modifier_burning"
                                    "Target"            "%HITTARGET"
                                    "Duration"          "%burnDuration"
                                    "Refresh"           "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "2.3"
            "Considerations"
            {
                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }
}
