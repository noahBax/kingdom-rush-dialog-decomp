"silveroak_oak_multiple_hit_win_achievement_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "silveroak_oak_multiple_hit_win_achievement_trait_modifier"
        {
            "Passive" "1"

            "OnVictory"
            {
                "AchievementIncrement"
                {
                    "Achievement"   "#oak_multiple_hit_win"
                    "Index"         "1"
                }
            }
        }
    }
}

