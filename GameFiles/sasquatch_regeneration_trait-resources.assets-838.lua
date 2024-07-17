"sasquatch_regeneration_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "Icon" "Regeneration"
    
     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "healForTooltip" "stat(%CASTER,#sasquatch_regeneration)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "heal" "stat(%TARGET,#sasquatch_regeneration)"
        }
    }

    "Modifiers"
    {
        "sasquatch_regeneration_trait_modifier"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
                "Conditional"
                {
                    "Condition" "(expr(%heal) > 0) && (stat(%TARGET,#health_missing) > 0) && not(isOnState(%TARGET, #BURNING))"

                     "Actions" 
                    {
                        "Heal"
                        {
                            "Target"        "%TARGET"
                            "HealAmount"    "expr(%heal)"
                        }

                        "AttachEffect"
                        {
                            "EffectName" "HealingFXMega"
                            "Target" "%TARGET"
                        }
                    }
                }
            }
        }
    }
}

