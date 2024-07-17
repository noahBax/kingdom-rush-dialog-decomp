"arenaDiversifier_burning_desire_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"              "2"
        }
    }

    "Modifiers"
    {
        "arenaDiversifier_burning_desire_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#burning_desire)"

                    "Actions" 
                    {
                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"        "%TARGET"
                                "Radius"        "9999"
                                "Teams"         "TEAM_ALL"
                                "CustomFilter"  "customUnitFilter(#theUnit, matchesGroup(unitGroup(%theUnit), @UnitGroup(GoodSide))"
                            }
                            "IteratorName" "#newTarget"
                            "Actions"    
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"    "invigorated_from_map_modifier"
                                    "Target"          "%newTarget"
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"    "modifier_burning"
                                    "Target"          "%newTarget"
                                    "Duration"        "%duration"
                                }
                            }
                        }
                    }

                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "arenaDiversifier_burning_desire_modifier"
                            "Target"          "%TARGET"
                        }
                    }
                }
            }

            "OnVictory"
            {
                "Conditional"
                {
                    "Condition" "wrapContext(encounterContext(), %turnNumber) < 4"

                    "Actions" 
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#qpa_fast_win_burning_desire"
                        }
                    }
                }
            }
        }
    }
}

