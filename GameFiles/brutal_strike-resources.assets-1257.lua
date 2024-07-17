"brutal_strike"
{
    "AbilityBehavior"   "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "BarbarianBrutalStikeCastFXMega"
    "Icon" "BrutalStrike"

    "AbilitySpecial"
    {
        "01" 
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #attackDamage)+1"
        }

        "02" 
        {
            "var_type" "FIELD_EXPRESSION"
            "bleedDuration" "2"
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "BarbarianBrutalStrikeExplosionFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "expr(%damage)" 
                }

                "Conditional"
                {
                    "Condition" "isOnState(%HITTARGET, #IMMOBILIZED)"

                    "Actions" 
                    {
                        "MarkHitLegendary"
                        {
                        }
                    }
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

                "Conditional"
                {
                    "Condition" "hitIsLegendary(%HIT)"

                     "Actions" 
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_new_bleeding"
                            "Target"        "%HITTARGET"
                            "Duration"      "%bleedDuration"
                            "Refresh"   "1"
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
