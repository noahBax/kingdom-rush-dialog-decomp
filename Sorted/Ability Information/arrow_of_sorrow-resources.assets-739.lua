"arrow_of_sorrow"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "CastFXId" "ArrowOfSorrowCastFXMega"
    "Icon" "BasicBow"

   
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
    }


    "OnAbilityAction"
    {

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "ArrowOfSorrowProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "randomI(expr(%MinRangedDmg), expr(%MaxRangedDmg))"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "ArrowOfSorrowHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED)"

            "InitActions"
            {
                "Conditional"
                {
                    "Condition" "isOnState(%HITTARGET, #IMMOBILIZED)"

                    "Actions" 
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_TRUE"
                            "Damage"        "%damage"
                        }

                        "MarkHitLegendary"
                        {
                        }
                    }

                    "ElseActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "%damage"
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
