"ranger_kebab_shot"
{
    "AbilityBehavior"               "POINT_TARGET | AOE"
    "AnimationID"                   "SpecialAttack"
    "CastFXId"                      "KebabCastFXMega"
    "Icon"                          "KebabShot" 

    "AbilityAOETeamFilter"          "TEAM_ALL"
    "AbilityAOERange"               "expr(%distanceToTravel)"
    "AbilityAOEKind"                "RANGE_TUNNEL"
    "AbilityAOEWidth"               "1"
    "AbilityAOECenterOnCaster"      "1"
    "AbilityAOEAffectsCaster"       "0"

    "AbilityCastRange"              "expr(%distanceToTravel)"
    "AbilityCooldown"               "3"
    "AbilityPreWarm"                "2"
    "AbilityAPCost"                 "1"


   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "MinDamage"             "ceil(stat(%CASTER, #attackDamage)/2)-1"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"        
            "MaxDamage"             "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "03"
        {
            "var_type"              "FIELD_EXPRESSION"
            "distanceToTravel"      "10"
        }

        "04"
        {
            "var_type"              "FIELD_FLOAT"
            "bleedingDuration"      "1"
        }
    }


    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatRanger_kebabProjectile"
        }

        "SetToContext"
        {
            "Context"           "currentContext()"
            "Type"              "FIELD_FLOAT"
            "Key"               "#firstHit"
            "Value"             "1"
        }

        "TrackingProjectile"
        {
            "Model"                 "KebabShotProjectile"
            "DistanceToTravel"      "expr(%distanceToTravel)"
            "TargetPos"             "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE)"

            "TargetFilter"
            {
                "Radius"            "0"
                "Teams"             "TEAM_ALL"
                "ExcludedUnits"     "objectList(%SOURCE)"
                "Width"             "1"
                "Kind"              "RANGE_TUNNEL"
            }

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT" 
                    "value"         "randomI(expr(%MinDamage), expr(%MaxDamage))"
                }
            }
        }
    }

    "OnProjectileHitUnit" 
    {
        "StopSound"
        {
            "Sound" "#krl_sfx_combatRanger_kebabProjectile"
        }

        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "KebabHitFXMega" 
            "Tags"                  "stringList(#PROJECTILE, #AOE)"


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

                "Conditional"
                {
                    "Condition"                 "%firstHit"

                    "Actions" 
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "modifier_new_bleeding"
                            "Target"            "%HITTARGET"
                            "Duration"          "%bleedingDuration"
                            "Refresh"           "1"
                        }

                        "SetToContext"
                        {
                            "Context"           "currentContext()"
                            "Type"              "FIELD_FLOAT"
                            "Key"               "#firstHit"
                            "Value"             "0"
                        }
                    }
                }
            }
        }

        "KeepProjectileGoing"
        {
        }
    }
}
