"bravebark_branchball"
{
    "AbilityBehavior"           "MELEE"
    "AbilityTeamFilter"         "TEAM_ALL"
    "AbilityCastRange"          "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"           "3"
    "AbilityAPCost"             "stat(%CASTER, #attackCostAP)"
    "AnimationID"               "Attack"
    "Icon"                      "Branchball"
    "CastFXId"                  "BravebarkBranchballCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "ceil(stat(%CASTER, #attackDamage)*1.5)"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "epicDamage"            "ceil(stat(%CASTER, #attackDamage)/2)"
        }
        "10"
        {
            "var_type" "FIELD_FLOAT"
            "epicKnockback"  "1"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }

    "OnAbilityAction"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "GenericHitFXMega" 
            "Tags"                  "stringList(#MELEE, #TARGETED, #CANTBEBLOCKED, #CANTBEDODGED, #CANTBESHIELDED)"

            "InitActions"
            {
                "Conditional"
                {
                    "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%TARGET), @TeamFilter(TEAM_ENEMY))"
                    "Actions" 
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%HITSOURCE, #ROOTED)"
                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"              "DAMAGE_PHYSICAL"
                                    "Damage"            "expr(%damage) + expr(%epicDamage)"
                                }
                            }
                            "ElseActions" 
                            {
                                "AddDamage"
                                {
                                    "Type"              "DAMAGE_PHYSICAL"
                                    "Damage"            "expr(%damage)"
                                }
                            }
                        }
                    }
                }
            }

            "Actions"
            {
                "RemoveModifier"
                {
                    "ModifierName"      "modifier_rooted"
                    "Target"            "%HITTARGET"
                }

                "Conditional"
                {
                    "Condition" "isOnState(%HITSOURCE, #ROOTED)"
                    "Actions" 
                    {
                        "Knockback" 
                        {
                            "Target"            "%HITTARGET"
                            "Center"            "unitPosition(%HITSOURCE)"
                            "Strength"          "2"
                        }

                        "MarkHitLegendary"
                        {
                        }
                    }
                    "ElseActions" 
                    {
                        "Knockback" 
                        {
                            "Target"            "%HITTARGET"
                            "Center"            "unitPosition(%HITSOURCE)"
                            "Strength"          "1"
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
