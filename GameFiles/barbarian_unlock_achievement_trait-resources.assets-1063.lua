"barbarian_unlock_achievement_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "barbarian_unlock_achievement_trait_modifier"
        {
            "Passive" "1"

            "OnVictory"
            {
                
                "AchievementIncrement"
                {
                    "Achievement" "#barbarian_unlock"
                }       
            }
        }
    }
}

