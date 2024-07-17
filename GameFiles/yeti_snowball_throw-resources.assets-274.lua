"yeti_snowball_throw"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | AOE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "YetiSnowballCastFXMega"
    "Icon" "IcicleRain" 

    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"
    "AbilityAOETeamFilter" "TEAM_ENEMY"

    "AbilityAOERange" "%aoeRadius"
    "AbilityCastMinRange" "2"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"  "2"
    "AbilityAPCost"    "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_FLOAT"
            "aoeRadius"             "1"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "directDamage"          "stat(%CASTER, #attackDamage)"
        }

        "03"
        {
            "var_type"              "FIELD_EXPRESSION"
            "splashDamage"          "stat(%CASTER, #attackDamage)"
        }

        "04"
        {
            "var_type"              "FIELD_FLOAT"
            "rootDuration"          "1"
        }
    }

    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatSasquatch_mudballProjectile"
        }
        
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "ArcaneIceLanceProjectile"

            "Params" 
            {
                "directDamage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%directDamage)"
                }

                "splashDamage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%splashDamage)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "AttachEffect"
        {
            "EffectName" "IceLanceProjectileEndFXMega" 
            "Target" "unitPosition(%TARGET)"
        }

        "StopSound"
        {
            "Sound" "#krl_sfx_combatSasquatch_mudballProjectile"
        }

        "PlaySound"
        {
            "Sound" "#krl_sfx_combatSasquatch_mudballHit"
        }

       "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #AOE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%directDamage"
                }
            }

            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_rooted"
                    "Target"        "%HITTARGET"
                    "Duration"      "%rootDuration"
                    "Refresh"       "1"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"        "%TARGET"
                "Radius"        "%aoeRadius"
                "Teams"         "TEAM_ALL"
                "ExcludedUnits" "objectList(%TARGET)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "IceLanceProjectileEndFXMega" 
                    "Tags" "stringList(#PROJECTILE, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"              "DAMAGE_PHYSICAL"
                            "Damage"            "%splashDamage"
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


            }
        }
    }
}
