"sorceress_trebuchet"
{
    "AbilityBehavior"               "UNIT_TARGET | AOE"
    "AbilityTeamFilter"             "TEAM_ENEMY"
    "AbilityAOETeamFilter" "TEAM_ENEMY"

    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "0"

    "AbilityAOERange" "%aoeRadius"



    "AnimationID"                   "Trebuchet"
    "CastFXId"                      "SorceressTrebuchetCastFXMega"
    "Icon"                          "Trebuchet"

    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"               "3"
    "AbilityAPCost"                 "2"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "splashDamage"          "floor(stat(%CASTER, #attackDamage)/2)"
        }

        "03"
        {
            "var_type"              "FIELD_INTEGER"
            "pushBackHexes"         "2"
        }

        "04"
        {
            "var_type"              "FIELD_INTEGER"
            "rootDuration"       "2"
        }
        "05"
        {
            "var_type"              "FIELD_FLOAT"
            "aoeRadius"       "1"
        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "SorceressTrebuchetProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }

                "splashDamage" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%splashDamage)"
                }

                "pushBackHexes" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "%pushBackHexes"
                }

                "rootDuration" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "%rootDuration"
                }
            }
        }

        "Delay"
        {
            "Time" "0.1"
            "Actions"
            {
                "Knockback" 
                {
                    "Target"        "%SOURCE"
                    "Center"        "unitPosition(%TARGET)"
                    "Strength"      "2"
                    "Animation"     "#Dodge"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "SorceressTrebuchetExplosionFXMega"
            "Tags"                  "stringList(#RAY, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
            }
        }

        "ApplyModifier"
        {
            "ModifierName"      "modifier_rooted"
            "Target"            "%TARGET"
            "Duration"          "%rootDuration"
            "Refresh"           "1"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "%TARGET"
                "ExcludedUnits"         "objectList(%TARGET)"
                "Radius"                "%aoeRadius"
                "Teams"                 "TEAM_ENEMY"
            }

            "IteratorName"              "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "SorceressTrebuchetExplosionFXMega" 
                    "Tags"              "stringList(#PROJECTILE, #TARGETED)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"      "DAMAGE_PHYSICAL"
                            "Damage"    "%splashDamage"
                        }
                    }
                }
            }
        }
    }
}
