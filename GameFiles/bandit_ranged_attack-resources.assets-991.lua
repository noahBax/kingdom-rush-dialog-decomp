"bandit_ranged_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    
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
            }
            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "bandit_move_after_attack_modifier"
                    "Target"        "%HITSOURCE"
                    "Duration"      "1"
                } 
            }
        }
    }

    "Modifiers"
    {
        "bandit_move_after_attack_modifier"
        {

            

            "OnAdded"
            {
                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#walkSpeedAvailable"
                    "Value" "1"
                }
            }

            "OnUnitLeavingNode"
            {
                "Conditional"
                {
                    "Condition" "equal(%TARGET, %UNIT)"

                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "bandit_move_after_attack_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }

            "States"
            {
                "HAS_EXTRA_STEP" "1"
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
