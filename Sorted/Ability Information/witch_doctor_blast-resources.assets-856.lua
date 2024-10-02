"witch_doctor_blast"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "SpecialAttack"
    "CastFXId" "WitchDoctorWildBlastCastFXMega"
    "Icon" "ShamanBlast" 

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"        
            "fixedDamage"  "(stat(%CASTER, #attackDamage)/2)+1"
        }
        "02"
        {
            "var_type" "FIELD_FLOAT"        
            "epicHeal"  "1"
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "WitchDoctorWildBlastProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type" "FIELD_FLOAT"
                    
                    "value" "expr(%fixedDamage)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "WitchDoctorWildBlastHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
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
