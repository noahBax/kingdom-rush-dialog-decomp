"blasteon_fire_bomb"
{
    "AbilityBehavior"               "UNIT_TARGET | AOE"
    "AbilityTeamFilter"             "TEAM_ENEMY"
    "AbilityAOETeamFilter"          "TEAM_ENEMY"

    "AnimationID"                   "Attack"
    "CastFXId"                      "FireballCastFXMega"
    "Icon"                          "FireBlast"
   
    "AbilityAOEKind"                "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"      "0"
    "AbilityAOEAffectsCaster"       "1"
    "AbilityAOERange"               "%aoeRadius"

    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"           "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"               "0"
    "AbilityAPCost"                 "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "aoeRadius"           "1"
        }

        "02"
        {
            "var_type"            "FIELD_EXPRESSION"
            "damage"              "stat(%CASTER,#attackDamage)"
        }

        "04"
        {
            "var_type"            "FIELD_FLOAT"
            "burnDuration"        "2"
        }

        "20"
        {
            "var_type"            "FIELD_STRING"
            "iconDamageType"      "damageMagical"
        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "FireballProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "AttachEffect"
        {
            "EffectName"            "FireballExplosionFXMega"
            "Target"                "%TARGET"
        }

        "Hit"
        {
            "Target"            "%TARGET"
            "EffectName"        "FireballHitFXMega" 
            "Tags"              "stringList(#MAGICAL, #AOE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_MAGICAL"
                    "Damage"            "%damage"
                }
            }

            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_burning"
                    "Target"        "%HITTARGET"
                    "Duration"      "%burnDuration"
                    "Refresh"       "1"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "%TARGET"
                "Radius"            "%aoeRadius"
                "ExcludedUnits"     "objectList(%TARGET)"
                "Teams"             "TEAM_ENEMY"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"        "%newTarget"
                    "EffectName"    "FireballHitFXMega" 
                    "Tags"          "stringList(#MAGICAL, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"              "DAMAGE_MAGICAL"
                            "Damage"            "%damage"
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
                    "Curve"             "Linear|-0.1|1|1|0"
                    "Consideration"     "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange"      "expr(%AbilityCastRange)"  
                    }
                }
            }
        }
    }
}
