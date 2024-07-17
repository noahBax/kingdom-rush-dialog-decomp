"orc_cleaver_unlock_achievement_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "orc_cleaver_unlock_achievement_trait_modifier"
        {
            "Passive" "1"

            "OnVictory"
            {
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "1000"
                        "Teams"     "TEAM_ALL"
                        "Source"    "%TARGET"
                        "CustomFilter" "customUnitFilter(#theUnit, matchesGroup(unitGroup(%theUnit), @UnitGroup(GoodSide)) && stat(%theUnit, #deaths_in_fights) > 0)"
                    }

                    "ActionsIfNotFound"
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#orc_cleaver_unlock"
                        }
                    }
                }
            }
        }
    }
}

