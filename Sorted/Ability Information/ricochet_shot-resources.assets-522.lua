"ricochet_shot"
{
    "AbilityBehavior"           "UNIT_TARGET"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"       "stat(%CASTER, #rangedAttackMinRange)"  
    "AbilityCooldown"           "3"
    "AbilityAPCost"             "2"
    "AnimationID"               "SpecialAttack"
    "CastFXId"                  "RicochetCastFXMega"
    "Icon"                      "RicochetShot"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"
            "minDamage"         "stat(%CASTER, #attackDamage)-2"
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"        
            "maxDamage"         "stat(%CASTER, #attackDamage)-1"
        }

        "03"
        {
            "var_type"                  "FIELD_FLOAT"        
            "ricochetNextTargetRange"   "2"
        }

        "04"
        {
            "var_type"          "FIELD_FLOAT"        
            "rootDuration"      "1"
        }

        "05"
        {
            "var_type"          "FIELD_FLOAT"
            "maxTargets"        "3"
        }

    }

    "OnAbilityAction"
    {

        "CreateObjectList"
        {
            "Name"              "#hitUnits"
        }

        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "RicochetProjectile" 

            "Params" 
            {
                "minRangeDamage" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%minDamage)"
                }

                "maxRangeDamage" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%maxDamage)"
                }

                "maxTargets" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "%maxTargets"
                }

                "firstHit" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "1"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {   
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "RicochetHitFXMega" 
            "Tags" "stringList(#PROJECTILE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(%minRangeDamage, %maxRangeDamage)"
                }
            }

            "Actions" 
            {
                "Conditional"
                {
                    "Condition" "%firstHit"

                    "Actions" 
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_rooted"
                            "Target"        "%HITTARGET"
                            "Duration"      "%rootDuration"
                            "Refresh"       "1"
                        }
                    }
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
                "Radius"                "%ricochetNextTargetRange"
                "Teams"                 "TEAM_ENEMY"
                "ExcludedUnits"         "%hitUnits"
                "MaxTargets"            "1"
            }

            "IteratorName"              "#newTarget"
        
            "Actions"    
            {
                "Conditional"
                {
                    "Condition"         "listCount(%hitUnits) < %maxTargets"

                    "Actions" 
                    {
                        "TrackingProjectile"
                        {
                            "Target"                "%newTarget"
                            "SourcePos"             "unitPosition(%TARGET, #Chest)"
                            "TargetPos"             "unitPosition(%newTarget, #Chest)"
                            "Model"                 "RicochetProjectile"

                            "Params" 
                            {
                                "minRangeDamage" 
                                {
                                    "type"         "FIELD_FLOAT"
                                    "value"        "%minRangeDamage"
                                }

                                "maxRangeDamage" 
                                {
                                    "type"         "FIELD_FLOAT"
                                    "value"        "%maxRangeDamage"
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
    
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "4"
            "Considerations"
            {

                "surrounded by several units"
                {
                    "Curve" "Logistic|500|5|-4|0.05"
                    "Consideration" "UnitsSurrounding"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_FRIENDLY"
                        "Range" "%ricochetNextTargetRange"
                    }
                }
            }
        }
    }

}
