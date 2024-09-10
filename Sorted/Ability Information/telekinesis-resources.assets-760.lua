"telekinesis"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "1" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "SpecialAttack"
    "CastFXId" "TelekinesisRayCastFXMega"
    "Icon" "Telekinesis" 

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage"  "ceil((stat(%CASTER, #attackDamage)+1)/2)"
        }
        "02"
        {
            "var_type" "FIELD_FLOAT"
            "pullValue"  "1"
        }
        "03"
        {
            "var_type" "FIELD_FLOAT"
            "pushValue"  "2"
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "TelekinesisRayProjectile"

            "Params" 
            {
            }
        }

        "Delay"
        {
            "Time" "0.5"
            "Actions"
            {

                "Conditional"
                {
                    "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%TARGET), @TeamFilter(TEAM_ENEMY))"

                    "Actions" 
                    {

                        "Hit"
                        {
                            "Target" "%TARGET"
                            "Tags" "stringList(#RAY, #MAGICAL)"

                            "InitActions"
                            {

                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_MAGICAL"
                                    "Damage"        "expr(%maxDamage)"
                                }
                                "Conditional"
                                {
                                    "Condition""safeEquals(hexDistance(unitHex(%SOURCE), unitHex(%TARGET)),1)"
                                    "Actions" 
                                    {
                                        "Knockback" 
                                        {
                                            "Target" "%HITTARGET"
                                            "Center" "unitPosition(%HITSOURCE)"
                                            "Strength" "%pushValue"
                                        }
                                    } 
                                    "ElseActions" 
                                    {
                                        "Knockback" 
                                        {
                                            "Target" "%HITTARGET"
                                            "Center" "hexPosition(hexNeighbour(unitHex(%HITTARGET), unitHex(%HITSOURCE), 3))"
                                            "Strength" "%pullValue"
                                        }
                                    }       
                                }
                            }
                            
                        }
                    }
                    "ElseActions"
                    {
                        "Hit"
                        {
                            "Target" "%TARGET" 
                            "Tags" "stringList(#RAY, #MAGICAL)"

                            "InitActions"
                            {
                                "Conditional"
                                {
                                    "Condition""safeEquals(hexDistance(unitHex(%SOURCE), unitHex(%TARGET)),1)"
                                    "Actions" 
                                    {
                                        "Knockback" 
                                        {
                                            "Target" "%HITTARGET"
                                            "Center" "unitPosition(%HITSOURCE)"
                                            "Strength" "%pushValue"
                                        }
                                    } 
                                    "ElseActions" 
                                    {
                                        "Knockback" 
                                        {
                                            "Target" "%HITTARGET"
                                            "Center" "hexPosition(hexNeighbour(unitHex(%HITTARGET), unitHex(%HITSOURCE), 3))"
                                            "Strength" "%pullValue"
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

    "OnProjectileHitUnit"
    {
        
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
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }
            }
        }
    }
}
