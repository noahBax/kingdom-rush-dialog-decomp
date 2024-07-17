






"heavy_strike"
{
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "2"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "HeavyStrikeCastFXMega"
    "Icon" "BrutalStrike"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "damageMultiplier" "2"
        }

        "02" 
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #attackDamage)+2"
        }

        "03" 
        {
           "var_type" "FIELD_EXPRESSION"
            "minDamage" "expr(%damage)-2"
        }

        "04" 
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage" "expr(%damage)+2"
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "OrcHeavyStrikeHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED, #CANTBEBLOCKED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomBetween(expr(%minDamage), expr(%maxDamage))" 
                }
            }

            "Actions"
            {
                "Knockback" 
                {
                    "Target" "%HITTARGET"
                    "Center" "unitPosition(%HITSOURCE)"
                    "Strength" "1"
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
