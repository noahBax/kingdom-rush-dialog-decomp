"witch_doctor_tainted_healing"
{
    "AbilityBehavior"               "UNIT_TARGET"
    "AbilityTeamFilter"             "TEAM_ENEMY"
    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange)-1"
    "AbilityCastMinRange"           "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"               "4"
    "AbilityAPCost"                 "2"
    "AnimationID"                   "SpecialAttack"
    "CastFXId"                      "WitchDoctorTaintedHealingCastFXMega"
    "Icon"                          "TaintedHealing" 
   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "attackDamage"          "stat(%CASTER, #attackDamage)"
        }

        
        
          
           
        

        
        
          
            
        
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "WitchDoctorTaintedHealingProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"          "FIELD_FLOAT"
                    
                    "value"         "expr(%attackDamage)"
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
        "Conditional"
        {
            "Condition" "%firstHit"

            "Actions"
            {
                "Hit"
                {
                    "Target"                "%TARGET"
                    "EffectName"            "WitchDoctorTaintedHealingHitFXMega" 
                    "Tags"                  "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

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
                        "Delay"
                        {
                            "Time" "0.5"
                            "Actions"
                            {
                                "PlaySound"
                                {
                                    "Sound" "#krl_sfx_combatWitchDoctor_taintedHealingReturnProjectile"
                                }

                                "TrackingProjectile"
                                {
                                    "Target"                "%SOURCE"
                                    "SourcePos"             "unitPosition(%TARGET, #Chest)"
                                    "TargetPos"             "unitPosition(%SOURCE, #Chest)"
                                    "Model"                 "WitchDoctorTaintedHealingBackProjectile"

                                    "Params" 
                                    {
                                        "healingValue" 
                                        { 
                                            "type"          "FIELD_FLOAT"
                                            "value"         "ceil(hitEffectiveDamage(%HIT)/2)"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            "ElseActions"
            {
                "Heal"
                {
                    "Target"            "%SOURCE"
                    "HealAmount"        "%healingValue"
                }

                "AttachEffect"
                {
                    "EffectName"        "HealingFXMega"
                    "Target"            "%SOURCE"
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
