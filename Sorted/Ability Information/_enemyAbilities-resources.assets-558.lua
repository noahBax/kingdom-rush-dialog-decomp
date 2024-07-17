"area_knockback_melee_attack"
{
    
    
    "AbilityBehavior"   "MELEE | AOE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    
    "AbilityAOETeamFilter" "TEAM_ALL"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "0"



    "AnimationID"   "Attack"
    "Icon" "AreaKnockbackMeleeAttack"
    "CastFXId" "CommonSlashSoundFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "MinDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "MaxDamage"  "stat(%CASTER, #attackDamage)+1"
        }
        
        "03"
        {
            "var_type"  "FIELD_FLOAT"
            "aoeRadius" "1.4"
        }
        "04"
        {
            "var_type"  "FIELD_FLOAT"
            "splashDamage" "3"
        }
    }



    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericBashFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED, #AOE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomBetween(expr(%MinDamage), expr(%MaxDamage))"
                }
            }

            "Actions"
            {
                "Knockback" 
                {
                    "Target" "%HITTARGET"
                    "Center" "unitPosition(%HITSOURCE)"
                    "Strength" "1"
                }

            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "ExcludedUnits" "objectList(%SOURCE,%TARGET)"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ALL"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "GenericHitFXMega" 
                    "Tags" "stringList(#MELEE, #TARGETED, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "%splashDamage" 
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%HITSOURCE)"
                            "Strength" "1"
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
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }

}


"single_knockback_melee_attack"
{
    
    
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "meleeAttack"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "MinDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "MaxDamage"  "stat(%CASTER, #attackDamage)+1"
        }
    }



    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomBetween(expr(%MinDamage), expr(%MaxDamage))"
                }
            }

            "Actions"
            {
                "Knockback" 
                {
                    "Target" "%HITTARGET"
                    "Center" "unitPosition(%HITSOURCE)"
                    "Strength" "1"
                }

            }
        }
    }
}












