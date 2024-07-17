"warlock_quick_swing"
{
    "AbilityBehavior"           "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"           "0"
    "AbilityAPCost"             "stat(%CASTER, #attackCostAP)"
    "AnimationID"               "Attack"
    "Icon"                      "QuickSwing"
    "CastFXId"                  "CommonSlashSoundFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "stat(%CASTER, #attackDamage)"
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
            "Tags"                  "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_PHYSICAL"
                    "Damage"            "expr(%damage)"
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
