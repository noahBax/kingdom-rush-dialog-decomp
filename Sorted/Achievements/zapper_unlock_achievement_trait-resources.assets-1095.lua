"zapper_unlock_achievement_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "zapper_unlock_achievement_trait_modifier"
        {
            "Passive" "1"

            "OnPostHitGlobal"
            {
                "Conditional"
                {
                    "Condition" "not(isNull(%ATTACKER))"
                    "Actions" 
                    {
                        "Conditional"
                        {
                            "Condition" "not(matchesGroup(unitGroup(%ATTACKED), @UnitGroup(GoodSide))) && isOnState(%ATTACKER, #PROP) && not(isOnState(%ATTACKED, #NO_SKULL)) && not(isOnState(%ATTACKED, #IS_CINEMATIC))"

                            "Actions" 
                            {
                                "AchievementIncrement"
                                {
                                    "Achievement" "#zapper_unlock"
                                }

                                "AdventureSummaryIncrement"
                                {
                                    "Id" "#summary.enemies_damaged_by_props"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

