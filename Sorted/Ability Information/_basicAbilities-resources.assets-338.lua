"common_melee_attack"
{
    
    
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "BasicSword"
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
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
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


"common_bite_attack"
{
    
    
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "WulfBite"
    "CastFXId" "CommonBiteSoundFXMega"

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
            "EffectName" "WulfBiteHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
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

"common_bash_attack"
{
    
    
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "BasicSword"
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

    }



    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericBashFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
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


"common_ranged_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "BasicBow"
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

"common_ranged_spell_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "SpecialAttack"
    "CastFXId" "MagicBoltCastFXMega"
    "Icon" "BasicMagic" 

   
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
            "Model" "MagicBoltProjectile"

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
            "EffectName" "MagicBoltHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
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

"area_common_melee_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | AOE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "1"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    
    "AbilityAOETeamFilter" "TEAM_ALL"
    
    "AbilityAOERange" "1"
    "AbilityAOEKind" "RANGE_TUNNEL"
    "AbilityAOEWidth" "3"
    "AbilityAOECenterOnCaster" "1"
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
    }



    "OnAbilityAction"
    {

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED, #AOE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
                }
            }

            "Actions"
            {
                "#Knockback" 
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
                            "Damage"        "3"   
                        }
                    }

                    "Actions"
                    {
                        "#Knockback" 
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

"lifesteal_melee_attack"
{
    
    
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"

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
            "Target" "%newTarget"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
                }
            }

            "Actions"
            {
                "Heal"
                {
                    "Target"        "%HITSOURCE"
                    "HealAmount"    "1"
                } 
                "AttachEffect"
                {
                    "EffectName" "HealingFXMega"
                    "Target" "%HITSOURCE"
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

"bleeding_melee_attack"
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

        "03"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"                "1"
        }
    }



    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "RuptureHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
                }
            }

            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_new_bleeding"
                    "Target"        "%HITTARGET"
                    "Duration"      "%duration"
                    "Refresh"    "1"
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

"poison_melee_attack"
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

        "03"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"                "1"
        }
    }



    "OnAbilityAction"
    {

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "RicochetHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
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

    "Modifiers"
    {
        "modifier_poisoned"
        {
            "EffectName" "PoisonStatusFXMega"
            "Tags" "dot"

            "OnTurnFinished"
            {

                "Hit"
                {
                    "Target" "%TARGET"
                    "EffectName" "RicochetHitFXMega" 
                    "Tags" "stringList(#MODIFIER, #INTERNAL)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"            "DAMAGE_TRUE"
                            "Damage"        "%damagePerTurnParam"
                        }
                    }
                }
            }

            "States"
            {
                "POISONED" "1"
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

"fixed_ranged_spell_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "SpecialAttack"
    "CastFXId" "MagicBoltCastFXMega"

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            
            "RangedDmg"  "1"
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "MagicBoltProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type" "FIELD_FLOAT"
                    
                    "value" "1"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "MagicBoltHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
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

"allyNPC_melee_attack"
{
    
    
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "BasicSword"
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

    }



    "OnAbilityAction"
    {
        "Conditional"
        {
            "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%TARGET), @TeamFilter(TEAM_ENEMY))"

            "Actions" 
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
                            "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
                        }

                        "Conditional"
                        {
                            "Condition" "isOnState(%HITTARGET, #WEAKENED)"

                            "Actions" 
                            {
                                "Heal"
                                {
                                    "Target"        "%HITSOURCE"
                                    "HealAmount"    "expr(%heal)"
                                }

                                "AttachEffect"
                                {
                                    "EffectName" "HealingFXMega"
                                    "Target" "%HITSOURCE"
                                }
                                "MarkHitLegendary"
                                {
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
                    "EffectName" "GenericHitFXMega" 
                    "Tags" "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"            "DAMAGE_PHYSICAL"
                            "Damage"        "2"
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
