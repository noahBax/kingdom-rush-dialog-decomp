"sasquatch_mighty_blow"
{
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"

    "AnimationID"   "SpellCastA"
    "CastFXId" "StunCastFXMega"
    "Icon" "MightyBlow" 

    "AbilitySpecial"
    {
        "01" 
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "max(stat(%CASTER, #attackDamage), 1)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "stunDuration" "1"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "knockback" "1"
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "StunHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

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
                "Knockback" 
                {
                    "Target" "%HITTARGET"
                    "Center" "unitPosition(%HITSOURCE)"
                    "Strength" "expr(%knockback)"
                }

                "ApplyModifier"
                {
                    "ModifierName"   "modifier_stunned"
                    "Target"         "%HITTARGET"
                    "Duration"       "expr(%stunDuration)"
                    "Refresh"        "1"
                }
            }
        }

    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "4"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }
}
