






"spider_poison_spit"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "PoisonShotCastFXMega"
    "Icon" "PoisonSpit" 

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "1"
    "AbilityAPCost"     "1"

    

   
    "AbilitySpecial" 
    {

        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "1"
        }


        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "totalDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "hitDamage"  "expr(%totalDamage)"
        }

    }


    "OnAbilityAction" 
    {

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"            "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"            "unitPosition(%TARGET, #Chest)"
            "Model"                "SpiderSplitProjectile"
            
            "WillHit" "hitChanceCalc(%TARGET)"
            "MissPosition" "unitPosition(%TARGET)"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%hitDamage)"
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
            "Tags" "stringList(#PROJECTILE, #TARGETED, #CANTBEBLOCKED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"            "DAMAGE_TRUE" 
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {
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

    "OnProjectileMissedUnit"
    {
      
        "AttachEffect"
        {
            "EffectName" "FireballHitFXMega"
            "Target" "%TARGET"
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
