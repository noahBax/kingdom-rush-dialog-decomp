"nightshade_thorn_pick"
{
    "AbilityBehavior"           "MELEE"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"           "0"
    "AbilityAPCost"             "1"
    "AnimationID"               "Attack"
    "Icon"                      "ThornPrick"
    "CastFXId"                  "NightshadeThornPickCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type"              "FIELD_FLOAT"
            "heal"                  "1"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damageTrue"
        }
    }

    "OnAbilityAction"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "GenericHitFXMega" 
            "Tags"                  "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_TRUE"
                    "Damage"            "expr(%damage)"
                }
            }

            "Actions"
            {
                "Conditional"
                {
                    "Condition"             "isOnState(%TARGET, #DRAINED)"
                    "Actions" 
                    {
                        "Heal"
                        {
                            "Target"        "%HITSOURCE"
                            "HealAmount"    "%heal"
                        }

                        "AttachEffect"
                        {
                            "EffectName"    "HealingFXMega"
                            "Target"        "%HITSOURCE"
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
            "Weight"            "2.3"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve"             "Linear|-0.1|1|1|0"
                    "Consideration"     "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange"      "10"  
                    }
                }
            }
        }
    }
}
