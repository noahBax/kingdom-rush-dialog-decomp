"villager_survives_dealbreaker_achievement_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "villager_survives_dealbreaker_achievement_modifier"
        {
            "Passive" "1"

            "OnVictory"
            {
                "Conditional" 
                {
                    "Condition" "not(isOnState(%TARGET, #DEAD))"
                    "Actions"
                    {   
                        "AchievementIncrement"
                        {
                            "Achievement" "#villager_survives_dealbreaker"
                        }
                    }
                }       
            }
        }
    }
}

