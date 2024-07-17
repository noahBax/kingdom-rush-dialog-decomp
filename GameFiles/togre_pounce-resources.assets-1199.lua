"togre_pounce"
{
    "AbilityBehavior"               "UNIT_TARGET | NEGATIVE_EFFECT | AOE"
    "AbilityTeamFilter"             "TEAM_ALL"

    "AnimationID"                   "SpellCastA"
    "Icon"                          "TogrePounce"
    "CastFXId"                      "TogrePounceCastFXMega"

    "AbilityAOETeamFilter"          "TEAM_ALL"
    "AbilityAOERange"               "%aoeRadius"
    "AbilityAOEKind"                "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"      "1"
    "AbilityAOEAffectsCaster"       "0"

    "AbilityCastRange"              "0"
    "AbilityCooldown"               "3"
    "AbilityAPCost"                 "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "ceil(stat(%CASTER,#attackDamage)/2)"
        }

        "02"
        {
            "var_type"              "FIELD_FLOAT"
            "aoeRadius"             "1"
        }

        "03" 
        {
           "var_type"               "FIELD_EXPRESSION"
            "stunDuration"          "1"
        }

        "20"
        {
            "var_type"              "FIELD_STRING"
            "iconDamageType"        "damagePhysical"
        }
    }

    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "%CASTER"
                "Radius"            "%aoeRadius"
                "Teams"             "TEAM_ALL"
                "MinRadius"         "1"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "AttachEffect"
                {
                    "EffectName"                "TogrePounceHitFXMega"
                    "Target"                    "%SOURCE"
                }

                "Hit"
                {
                    "Target"        "%newTarget"
                    "Tags"          "stringList(#AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%damage)"
                        }
                    }

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_stunned"
                            "Target"        "%HITTARGET"
                            "Duration"      "expr(%stunDuration)"
                            "Refresh"       "1"
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
            "Weight" "5"
            "Considerations"
            {
                "surrounded al least by two units"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Min" "1"
                        "Max" "2"
                        "TeamFilter" "TEAM_ENEMY"
                    }
                }

                "surrounded by several units"
                {
                    "Curve" "Logistic|0.08|5|-4|-0.4"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "6"
                        "TeamFilter" "TEAM_ENEMY"
                    }
                }
            }
        }
    }
}
