"sbf_aspect_physical_attack"
{
    "AbilityBehavior"           "UNIT_TARGET"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"       "0"
    "AbilityCooldown"           "0"
    "AbilityAPCost"             "1"
    "AnimationID"               "AttackIn"
    "Icon"                      "NokAttack"
    "CastFXId"                  "SBFAspectPhysicalCastFXMega"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "damage"                    "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type"                  "FIELD_EXPRESSION"        
            "nextTargetRange"   "stat(%CASTER, #nextTargetRange)"
        }

        "03"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "maxTargets"                "stat(%CASTER, #maxTargets)"
        }

        "05"
        {
            "var_type"                  "FIELD_EXPRESSION"        
            "rangeTooltìp"              "stat(%CASTER, #rangedAttackRange)"
        }


        "06"
        {
            "var_type"                  "FIELD_EXPRESSION"        
            "nextTargetRangeTooltip"   "(expr(%nextTargetRange))-1" 
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
            "Time" "0.5"
            "TickType" "PriorityCenter"
            "Position" "unitPosition(%SOURCE)"
        }
    }

    "OnAbilityAction"
    {
        "SetStat"
        {
            "Target" "%CASTER"
            "Stat" "#already_attacked"
            "Value" "1"
        }

        "SetToContext"
        {
            "Context"                   "currentContext()"
            "Key"                       "#sourcePosition"
            "Value"                     "unitPosition(%SOURCE)"
            "Type"                      "FIELD_OBJECT"
        }

        "CreateObjectList"
        {
            "Name"              "#hitUnits"
        }

        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "SBFAspectPhysicalProjectile" 

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }

                "maxTargets" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%maxTargets)"
                }

                "firstHit" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "1"
                }
            }
        }

        "AttachEffect"
        {
            "EffectName"            "RegsonTwilightStepSmokeFXMega"
            "Target"                "unitPosition(%SOURCE)"
        }

        "MoveUnit"
        {
            "Target"                "%SOURCE"
            "Position"              "newPoint(1000, 1000, 0)"
        }

        "ApplyModifier"
        {
            "ModifierName"          "disable_unit_modifier"
            "Target"                "%SOURCE"
        }
    }

    "OnProjectileHitUnit"
    {   
        "Hit"
        {
            "Target"            "%TARGET"
            "EffectName"        "SBFAspectPhysicalHitFXMega" 
            "Tags"              "stringList(#PROJECTILE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {
                "SetToContext"
                {
                    "Context"        "projectileContext(%projectile)"
                    "Key"            "#lastHitConnected"
                    "Value"          "hitConnected(%HIT)"
                    "Type"           "FIELD_FLOAT"
                }
            }
        }

        "AddObjectToList" 
        {
            "List"                      "%hitUnits"
            "Value"                     "%TARGET"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "%TARGET"
                "Radius"                "expr(%nextTargetRange)"
                "Teams"                 "TEAM_ENEMY"
                "ExcludedUnits"         "%hitUnits"
                "MaxTargets"            "1"
            }

            "IteratorName"              "#newTarget"
        
            "Actions"    
            {
                "Conditional"
                {
                    "Condition"         "(listCount(%hitUnits) < %maxTargets) && wrapContext(projectileContext(%projectile), %lastHitConnected)"

                    "Actions" 
                    {
                        "SetToContext"
                        {
                            "Context"        "projectileContext(%projectile)"
                            "Key"            "#mustKeepGoing"
                            "Value"          "1"
                            "Type"           "FIELD_FLOAT"
                        }

                        "TrackingProjectile"
                        {
                            "Target"                "%newTarget"
                            "SourcePos"             "unitPosition(%TARGET, #Chest)"
                            "TargetPos"             "unitPosition(%newTarget, #Chest)"
                            "Model"                 "SBFAspectPhysicalProjectile"

                            "Params" 
                            {
                                "damage" 
                                {
                                    "type"         "FIELD_FLOAT"
                                    "value"        "%damage"
                                }

                                "maxTargets" 
                                {
                                    "type"          "FIELD_FLOAT"
                                    "value"         "%maxTargets"
                                }
                            }
                        }
                    }
                }
            }
        }

        "Conditional"
        {
            "Condition"         "not(wrapContext(projectileContext(%projectile), %mustKeepGoing))"

            "Actions" 
            {
                "Delay"
                {
                    "Time" "0.5"
                    "Actions"
                    {
                        "MoveUnit"
                        {
                            "Target"        "%SOURCE"
                            "Position"      "%sourcePosition"
                        }

                        "AttachEffect"
                        {
                            "EffectName"            "RegsonTwilightStepSmokeFXMega"
                            "Target"                "unitPosition(%SOURCE)"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "disable_unit_modifier"
                            "Target"         "%SOURCE"
                        }

                        "PlayAnimation"
                        {
                            "Target"        "%SOURCE"
                            "Animation"     "AttackOut"
                        }

                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatSBF_physicalReappear"
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
            "Weight" "200"
            "Considerations"
            {
                "is first action"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "0"
                        "Stat" "#already_attacked"
                        "Owner" "1"
                    }
                }

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve"             "Linear|-0.1|1|1|0"
                    "Consideration"     "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange"      "10"  
                    }
                }
            }
        }
    }
}
