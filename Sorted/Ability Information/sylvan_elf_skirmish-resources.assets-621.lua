"sylvan_elf_skirmish"
{
    "AbilityBehavior"           "UNIT_TARGET | AOE"
    "AbilityTeamFilter"         "TEAM_ALL"
    "AbilityCastRange"          "0"
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "2"
    "AnimationID"               "Skirmish"
    "CastFXId"                  "SylvanElfSkirmishCastFXMega"
    "Icon"                      "Skirmish"

    "AbilityAOETeamFilter"      "TEAM_ENEMY"
    "AbilityAOERange"           "expr(%aoeRadius)"
    "AbilityAOEKind"            "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"  "1"
    "AbilityAOEAffectsCaster"   "0"
   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"
            "aoeRadius"         "stat(%CASTER, #rangedAttackRange)"
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"        
            "damage"            "stat(%CASTER, #attackDamage)"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"        
            "numberOfHits"      "3"
        }

        "04"
        {
            "var_type"          "FIELD_FLOAT"        
            "timeBetweenHits"   "0.2"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }

    "OnAbilityStart"
    {
        "StartLogicTick"
        {
            "Time"          "2"
            "TickType"      "PriorityCenter"
            "Position"      "pointAdd(unitPosition(%SOURCE), newPoint(0, 1, 0))"
        }
    }

    "OnAbilityAction"
    {
        "Times"
        {
            "Times"             "%numberOfHits"
            "IteratorName"      "#index"
            "Actions"
            {
                "Delay"
                {
                    "Time"          "(%index * 0.1)"
                    "Actions"
                    {
                        "TrackingProjectile"
                        {
                            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
                            "TargetPos"             "pointAdd(unitPosition(%SOURCE), newPoint(0, 8, 0))"
                            "Model"                 "SylvanElfSkirmishProjectile"
                            "Params"
                            {
                                "firstProjectile" 
                                { 
                                    "type"              "FIELD_FLOAT"
                                    "value"             "1"
                                }
                            }
                        }
                    }
                }
            }
        }

        "StartLogicTick"
        {
            "Time"          "3"
            "TickType"      "PriorityCenter"
            "Position"      "pointAdd(unitPosition(%SOURCE), newPoint(0, 1, 0))"
        }

        "Delay"
        {
            "Time"          "1.5"

            "Actions"
            {
                "SetToContext"
                {
                    "Context"       "currentContext()"
                    "Type"          "FIELD_INTEGER"
                    "Key"           "#numberOfHitsDone"
                    "Value"         "0" 
                }

                "CreateObjectList"
                {
                    "Name"          "#hitUnits"
                }

                "Times"
                {
                    "Times"             "%numberOfHits"
                    "IteratorName"      "#index"
                    "Actions"
                    {
                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"                "%CASTER"
                                "Radius"                "expr(%aoeRadius)"
                                "Teams"                 "TEAM_ENEMY"
                                "MaxTargets"            "1"
                                "Random"                "1"
                                "ExcludedUnits"         "%hitUnits"
                            }
                            "IteratorName" "#newTarget"
                            "Actions"    
                            {
                                "SetToContext"
                                {
                                    "Context"       "currentContext()"
                                    "Type"          "FIELD_INTEGER"
                                    "Key"           "#numberOfHitsDone"
                                    "Value"         "%numberOfHitsDone + 1" 
                                }

                                "AddObjectToList" 
                                {
                                    "List"                      "%hitUnits"
                                    "Value"                     "%newTarget"
                                }

                                "Debug"
                                {
                                    "Text" "First Iteration"
                                    "Expression" "%index"
                                }

                                "Delay"
                                {
                                    "Time"          "(%index * %timeBetweenHits)"
                                    "Actions"
                                    {
                                        "TrackingProjectile"
                                        {
                                            "SourcePos"             "pointAdd(unitPosition(%newTarget), newPoint(0, 5, 0))"
                                            "TargetPos"             "unitPosition(%newTarget)"
                                            "Model"                 "SylvanElfSkirmishProjectile"
                                            "Params"
                                            {
                                                "damage" 
                                                {
                                                    "type"      "FIELD_FLOAT"
                                                    "value"     "expr(%damage)"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }


                "Conditional"
                {
                    "Condition"             "%numberOfHitsDone > 0 && %numberOfHits - %numberOfHitsDone > 0"
                    "Actions" 
                    {
                        "Times"
                        {
                            "Times"             "%numberOfHits - %numberOfHitsDone"
                            "IteratorName"      "#index"
                            "Actions"
                            {
                                "ActOnTargets"
                                {
                                    "Target"
                                    {
                                        "Center"                "%CASTER"
                                        "Radius"                "expr(%aoeRadius)"
                                        "Teams"                 "TEAM_ENEMY"
                                        "MaxTargets"            "1"
                                        "Random"                "1"
                                    }
                                    "IteratorName" "#newTarget"
                                    "Actions"    
                                    {
                                        "SetToContext"
                                        {
                                            "Context"       "currentContext()"
                                            "Type"          "FIELD_INTEGER"
                                            "Key"           "#numberOfHitsDone"
                                            "Value"         "%numberOfHitsDone + 1" 
                                        }

                                        "Debug"
                                        {
                                            "Text" "Second Iteration"
                                            "Expression" "%index"
                                        }

                                        "Delay"
                                        {
                                            "Time"          "(%numberOfHitsDone * %timeBetweenHits) + (%index * %timeBetweenHits)"
                                            "Actions"
                                            {
                                                "TrackingProjectile"
                                                {
                                                    "SourcePos"             "pointAdd(unitPosition(%newTarget), newPoint(0, 5, 0))"
                                                    "TargetPos"             "unitPosition(%newTarget)"
                                                    "Model"                 "SylvanElfSkirmishProjectile"
                                                    "Params"
                                                    {
                                                        "damage" 
                                                        {
                                                            "type"      "FIELD_FLOAT"
                                                            "value"     "expr(%damage)"
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

                "Conditional"
                {
                    "Condition"             "%numberOfHits - %numberOfHitsDone > 0"
                    "Actions" 
                    {
                        "StartLogicTick"
                        {
                            "Time"          "(%numberOfHits - %numberOfHitsDone) * %timeBetweenHits"
                            "TickType"      "PriorityCenter"
                            "Position"      "unitPosition(%TARGET)"
                        }

                        "Times"
                        {
                            "Times"             "%numberOfHits - %numberOfHitsDone"
                            "IteratorName"      "#index"
                            "Actions"
                            {
                                "ActOnHexas"
                                {
                                    "Center"                "unitHex(%TARGET)"
                                    "Range"                 "expr(%aoeRadius)"
                                    "IteratorName"          "#hexa"
                                    "RequireEmpty"          "1"
                                    "Max"                   "1"
                                    "Random"                "1"
                                    "Actions"    
                                    {
                                        "Delay"
                                        {
                                            "Time"          "(%numberOfHitsDone * %timeBetweenHits) + (%index * %timeBetweenHits)"
                                            "Actions"
                                            {
                                                "TrackingProjectile"
                                                {
                                                    "SourcePos"             "pointAdd(hexPosition(%hexa), newPoint(0, 5, 0))"
                                                    "TargetPos"             "hexPosition(%hexa)"
                                                    "Model"                 "SylvanElfSkirmishProjectile"
                                                    "Params"
                                                    {
                                                        "damage" 
                                                        {
                                                            "type"      "FIELD_FLOAT"
                                                            "value"     "expr(%damage)"
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

    "OnProjectileDestinationReached" 
    {
        "Conditional"
        {
            "Condition" "%firstProjectile"
            "Actions"
            {
            }

            "ElseActions" 
            {
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"    "%TARGET"
                        "Radius"    "0"
                        "Teams"     "TEAM_ENEMY"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Hit"
                        {
                            "Target"            "%newTarget"
                            "Tags"              "stringList(#PROJECTILE, #TARGETED, #AOE)"
                            "EffectName"        "SylvanElfSkirmishHitFXMega" 

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "%damage"
                                }
                            }
                        }
                    }

                    "ActionsIfNotFound"
                    {
                        "AttachEffect"
                        {
                            "EffectName"        "SylvanElfSkirmishHitFloorFXMega"
                            "Target"            "%TARGET"
                        }
                        
                    }
                }
            }
        }
    }
}
