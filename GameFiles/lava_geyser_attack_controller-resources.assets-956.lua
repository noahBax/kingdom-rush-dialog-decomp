"lava_geyser_attack_every_other_turn_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "AbilitySpecial"
    {
        "06"
        {
            "var_type"          "FIELD_EXPRESSION"
            "disabledTurns"     "stat(%SOURCE, #disabledTurns)"
        }
    }

    "Modifiers"
    {
        "lava_geyser_attack_init_modifier"
        {
            "Passive" "1"

            "OnAdded"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "lava_geyser_disabled_modifier"
                    "Target"        "%TARGET"
                    "Duration"      "expr(%disabledTurns) - 1"
                }

                "RemoveModifier"
                {
                    "ModifierName"  "lava_geyser_attack_init_modifier"
                    "Target"        "%TARGET"
                }
            }
        }

        "lava_geyser_disabled_modifier"
        {
            "AnimationOverride"     "Disabled"

            "OnTurnStarted"
            {
                "Conditional"
                {
                    "Condition"         "safeEquals(modifierTurnsRemaining(%MODIFIERINSTANCE), 1)"
                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"  "lava_geyser_disabled_modifier"
                            "Target"         "%TARGET"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"  "lava_geyser_ready_modifier"
                            "Target"        "%TARGET"
                            "Duration"      "1"
                        }
                    }
                }
            }

            "States"
            {
                "STUNNED"            "1"
            }
        }

        "lava_geyser_ready_modifier"
        {
            "OnAdded"
            {
                "PlaySound"
                {
                    "Sound" "#krl_sfx_genericCombat_geyserActivated_loop_start"
                }

                "#Delay"
                {
                    "Time" "0.5"
                    "Actions"
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_genericCombat_geyserActivated_loop"
                        }
                    }
                }
            }

            "States"
            {
                "STUNNED"            "1"
            }
        }
    }
}
