






"summon_arcane_sentry"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | POSITIVE_EFFECT | NEEDS_CLEAR_TERRAIN"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "SummonArcaneSentryCastFXMega"
    "Icon" "SummonSentry"

    "AbilityCastRange" "2"
    "AbilityCooldown"  "4"
    "AbilityAPCost"    "2"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration" "3"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "baseDamage" "3"
        }
    }


     "OnAbilityAction"
    { 
        "SpawnUnit"
        {
            "UnitName" "#ArcaneSentry" 
            "Position" "%TARGET"
            "UnitGroup" "unitGroup(%CASTER)"
            "IsAI" "1"
            "AddToInitiativeOrder" "0"
            "OnSpawn"
            {

                "#DebugGolemize"
                {
                    "Target" "%UNIT"
                }

                "PlayActivityAnimation"
                {
                    "Target" "%UNIT"
                    "Animation" "Spawn"
                }
               
                "ApplyModifier"
                {
                    "ModifierName"    "modifier_summoned_arcaneSentry"
                    "Target"         "%UNIT"
                    "Duration"  "%duration"
                }
            }
        }
    }


    "Modifiers"
    {
        "modifier_summoned_arcaneSentry"
        {
            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"        "%TARGET"
                }
            }
        }
    }
}





"sentry_ranged_spell_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "MinRangedDmg"  "stat(%CASTER, #attackDamage)*0.4"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "MaxRangedDmg"  "stat(%CASTER, #attackDamage)*1.6"
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "ArcaneSentryProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type" "FIELD_FLOAT"
                    "value" "randomBetween(expr(%MinRangedDmg), expr(%MaxRangedDmg))"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "ArcaneSentryHitFXMega" 
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

                 "Ignores targets frozen"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "modifier_freeze"  
                    }
                }
            }
        }
    }
}
