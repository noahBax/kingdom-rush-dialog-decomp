"silveroak_sbf_aspect_kill_achievements"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "silveroak_sbf_aspect_kill_achievements_modifier"
        {
            "Passive" "1"

            "OnVictory"
            {
                "Conditional"
                {
                    "Condition" "stat(unitByCinematicId(#Morganok), #aspect_summoner) > 0"

                    "Actions"
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#adventure_completed_silveroak_mor"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "stat(unitByCinematicId(#Morganok), #aspect_magic) > 0"

                    "Actions"
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#adventure_completed_silveroak_ga"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "stat(unitByCinematicId(#Morganok), #aspect_physical) > 0"

                    "Actions"
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#adventure_completed_silveroak_nok"
                        }
                    }
                }
            }
        }
    }
}

