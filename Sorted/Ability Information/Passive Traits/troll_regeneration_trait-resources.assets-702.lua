"troll_regeneration_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "Icon" "TrollRegeneration"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "healForTooltip" "stat(%CASTER,#troll_regeneration)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "heal" "stat(%TARGET,#troll_regeneration)"
        }
    }

    "Modifiers"
    {
        "troll_regeneration_trait_modifier"
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

