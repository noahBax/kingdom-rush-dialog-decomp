"sasquatch_mudball_throw"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | AOE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "Icon" "MudballThrow"
    "CastFXId"  "SasquatchMudballCastFXMega"

    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"
    "AbilityAOETeamFilter" "TEAM_ENEMY"

    "AbilityAOERange" "%aoeRadius"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)+1"
    "AbilityCooldown"  "3"
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
            "splashDamage"          "ceil(stat(%CASTER, #attackDamage)/3)"
        }

        "04"
        {
            "var_type"              "FIELD_FLOAT"
            "rootDuration"          "1"
        }
    }

    "OnAbilityAction"
    {

        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "MudballThrowProjectile"

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
            "EffectName" "MudballThrowExplosionFXMega"
            "Target" "unitPosition(%TARGET)"
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
                "Teams"         "TEAM_ENEMY"
                "ExcludedUnits" "objectList(%TARGET)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "GenericHitFXMega"
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
}
