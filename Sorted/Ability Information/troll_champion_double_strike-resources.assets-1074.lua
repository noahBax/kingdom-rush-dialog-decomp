"troll_champion_double_strike"
{
    
    
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"
    "AnimationID"   "DoubleStrike"
    "Icon" "DoubleStrike"
    "CastFXId" "CommonSlashSoundFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "primaryDamage"  "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "secondaryDamage"  "ceil(stat(%CASTER, #attackDamage)/2)"
        }

    }



    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "RuptureHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "expr(%primaryDamage)"
                }
            }
        }
    }

    "OnAbilityCustomEvent"
    {
        "Conditional"
        {
            "Condition" "equal(%customEvent, #AbilityAction2)"

            "Actions" 
            {
                "Hit"
                {
                    "Target" "%TARGET"
                    "EffectName" "RuptureHitFXMega" 
                    "Tags" "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%secondaryDamage)"
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
            "Weight" "3.3"
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
