"arcane_ray"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "SpecialAttack"
    "CastFXId" "ArcaneRayCastFXMega"
    "Icon" "BasicMagic" 

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage"  "stat(%CASTER, #attackDamage)"
        }
    }


    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatArcaneMage_arcaneRay_loop"
        }

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #RayPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "ArcaneMageRayProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type" "FIELD_FLOAT"
                    "value" "round(lerp(1, stat(%CASTER, #rangedAttackRange), 1, expr(%maxDamage), hexDistance(unitHex(%SOURCE), unitHex(%TARGET))))"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {   
        "StopSound"
        {
            "Sound" "#krl_sfx_combatArcaneMage_arcaneRay_loop"
        }
        
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatArcaneMage_arcaneRay_loopEnd"
        }

        "Hit"
        {
            "Target" "%TARGET"
            "Tags" "stringList(#RAY, #MAGICAL)"
            "EffectName" "ArcaneMageRayHitFXMega" 

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
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
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }
            }
        }
    }
}
