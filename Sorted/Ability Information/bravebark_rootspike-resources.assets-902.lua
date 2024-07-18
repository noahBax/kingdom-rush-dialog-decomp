"bravebark_rootspike"
{
    "AbilityBehavior"                   "UNIT_TARGET | AOE"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AnimationID"                       "SpellCastD"
    "Icon"                              "Rootspike"
    "CastFXId"                          "BravebarkRootspikeCastFXMega"

    "AbilityAOETeamFilter"              "TEAM_ENEMY"
    "AbilityAOERange"                   "%aoeRadius"
    "AbilityAOEKind"                    "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"          "0"
    "AbilityAOEAffectsCaster"           "0"

    "AbilityCastRange"                  "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"                   "3"
    "AbilityAPCost"                     "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "rootDuration"              "2"
        }

        "02"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "damage"                    "stat(%CASTER, #attackDamage)"
        }

        "03"
        {
            "var_type"                  "FIELD_FLOAT"
            "epicDamage"                "2"
        }

        "04"
        {
            "var_type"                  "FIELD_FLOAT"
            "aoeRadius"                 "1"
        }

        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }

    "OnAbilityAction"
    {        
        "ApplyModifier"
        {
            "ModifierName"              "modifier_rooted"
            "Target"                    "%CASTER"
            "Duration"                  "%rootDuration"
            "Refresh"                   "1"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "%TARGET"
                "Radius"                "%aoeRadius"
                "Teams"                 "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"                "%newTarget"
                    "EffectName"            "BravebarkRootspikeHitFXMega" 
                    "Tags"                  "stringList(#TARGETED)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition"             "isOnState(%newTarget, #WEAKENED)"
                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"              "DAMAGE_PHYSICAL"
                                    "Damage"            "expr(%damage) + %epicDamage"
                                }

                                "MarkHitLegendary"
                                {
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
        }
    }
}
