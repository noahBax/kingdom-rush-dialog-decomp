"ranger_precise_shot"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "AimedShot"
    "CastFXId" "CommonArrowCastSoundFXMega"

   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "MinRangedDmg"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "MaxRangedDmg"  "stat(%CASTER, #attackDamage)+1"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"        
            "extraDamage"  "ceil(stat(%CASTER, #attackDamage)/2)"
        }
    }


    "OnAbilityAction"
    {

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "SimpleArrowProjectile"
            "WillHit" "hitChanceCalc(%TARGET)"
            "MissPosition" "unitPosition(%TARGET)"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "randomI(expr(%MinRangedDmg), expr(%MaxRangedDmg))"
                }

                "extraDamage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%extraDamage)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }

                "Conditional"
                {
                    "Condition" "isOnState(%HITTARGET, #IMMOBILIZED)"

                    "Actions" 
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_TRUE"
                            "Damage"        "%extraDamage"
                        }

                        "MarkHitLegendary"
                        {
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
