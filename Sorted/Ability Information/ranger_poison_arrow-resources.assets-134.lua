"ranger_poison_arrow"
{
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "PoisonShotCastFXMega"
    "Icon" "PoisonArrow" 

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"  
    "AbilityCooldown"   "2"
    "AbilityAPCost"     "1"
   
    "AbilitySpecial" 
    {

        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "3"
        }


        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #attackDamage)"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"        
            "rootDuration"  "1"
        }

    }


    "OnAbilityAction" 
    {

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"            "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"            "unitPosition(%TARGET, #Chest)"
            "Model"                "PoisonArrowProjectile"
            
            "WillHit" "hitChanceCalc(%TARGET)"
            "MissPosition" "unitPosition(%TARGET)"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%damage)"
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
            "Tags" "stringList(#PROJECTILE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"            "DAMAGE_TRUE"
                    "Damage"        "%damage"
                }
                
                "Conditional"
                {
                    "Condition" "isOnState(%HITTARGET, #WEAKENED)"

                    "Actions" 
                    {
                        "MarkHitLegendary"
                        {
                        }
                    }
                }
            }

            "Actions"
            {
                "Conditional"
                {
                    "Condition" "hitIsLegendary(%HIT)"

                    "Actions" 
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_rooted"
                            "Target"        "%HITTARGET"
                            "Duration"      "%rootDuration"
                            "Refresh"   "1"
                        }
                    }
                }
                
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_new_poison"
                    "Target"        "%HITTARGET"
                    "Duration"      "%duration"
                    "Refresh"   "1"
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "2.5"
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

                "Ignores targets already poisoned"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "modifier_new_poison"  
                    }
                }
            }
        }
    }
}
