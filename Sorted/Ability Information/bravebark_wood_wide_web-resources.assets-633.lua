"bravebark_wood_wide_web"
{
    "AbilityBehavior"                   "POINT_TARGET | AOE | NEEDS_CLEAR_TERRAIN"

    "AnimationID"                       "SummonOut"
    "Icon"                              "WoodWideWeb"
    "CastFXId"                          "BravebarkWoodWideWebCastFXMega"

    "AbilityAOETeamFilter"              "TEAM_ENEMY"
    "AbilityAOERange"                   "%aoeRadius"
    "AbilityAOEKind"                    "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"          "1"
    "AbilityAOEAffectsCaster"           "0"

    "AbilityCastRange"                  "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"                   "2"
    "AbilityAPCost"                     "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "rootDuration"              "1"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "selfRootedDuration"        "2"
        }

        "03"
        {
            "var_type"                  "FIELD_FLOAT"
            "aoeRadius"                 "1"
        }
    }

    "OnAbilityAction"
    {
        "AttachEffect"
        {
            "EffectName"                "BravebarkWoodwideWebExplosionFXMega"
            "Target"                    "%SOURCE"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "%CASTER"
                "Radius"                "%aoeRadius"
                "Teams"                 "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "ApplyModifier"
                {
                    "ModifierName"              "modifier_rooted"
                    "Target"                    "%newTarget"
                    "Duration"                  "%rootDuration"
                    "Refresh"                   "1"
                }

                "AttachEffect"
                {
                    "EffectName"                "BravebarkWoodWideWebHitFXMega"
                    "Target"                    "%newTarget"
                }
            }
        }

        "SetToContext"
        {
            "Context"           "unitContext(%CASTER)"
            "Key"               "#sourcePosition"
            "Value"             "unitPosition(%SOURCE)"
            "Type"              "FIELD_OBJECT"
        }

        "SetToContext"
        {
            "Context"           "unitContext(%CASTER)"
            "Key"               "#targetPosition"
            "Value"             "%TARGET"
            "Type"              "FIELD_OBJECT"
        }
    }

    "OnAbilityCustomEvent"
    {
        "Conditional"
        {
            "Condition" "equal(%customEvent, #AbilityAction02)"

            "Actions" 
            {
                "StartLogicTick"
                {
                    "Time"              "1"
                    "TickType"          "PriorityCenter"
                    "Position"          "wrapContext(unitContext(%CASTER), %targetPosition)"
                }

                "MoveUnit"
                {
                    "Target"            %SOURCE"
                    "Position"          "newPoint(1000, 1000, 0)"
                }

                "Delay"
                {
                    "Time" "0.5"
                    "Actions"
                    {
                        "MoveUnit"
                        {
                            "Target"            "%SOURCE"
                            "Position"          "wrapContext(unitContext(%CASTER), %targetPosition)"
                        }

                        "PlayActivityAnimation"
                        {
                            "Target" "%SOURCE"
                            "Animation" "SummonIn"
                        }

                        "AttachEffect"
                        {
                            "EffectName"        "BravebarkWoodWideWebOutFXMega"
                            "Target"            "wrapContext(unitContext(%CASTER), %targetPosition)"
                        }

                         "Delay"
                        {
                            "Time" "1.5"
                            "Actions"
                            {

                                "ApplyModifier"
                                {
                                    "ModifierName"      "modifier_rooted"
                                    "Target"            "%SOURCE"
                                    "Duration"          "%selfRootedDuration"
                                    "Refresh"           "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
