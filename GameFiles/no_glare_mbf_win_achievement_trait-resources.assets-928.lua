"no_glare_mbf_win_achievement_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "no_glare_mbf_win_achievement_trait_modifier"
        {
            "Passive" "1"

            "OnAdded"
            {
                "SetToContext"
                {
                    "Context"   "encounterContext()"
                    "Key"       "#glareMbfDamage"
                    "Type"      "FIELD_INTEGER"
                    "Value"     "0"
                }
            }

            "OnPostHitGlobal"
            {
                "Conditional" 
                {
                    "Condition" "hitConnected(%HIT) && matchesGroup(unitGroup(%ATTACKED), @UnitGroup(GoodSide)) && hasTags(hitTags(%HIT), #GLARE_TOWER_OR_CRYSTAL) && isOnState(%ATTACKED, #HERO) && hitEffectiveDamage(%HIT) > 0"
                    "Actions"
                    {
                        "SetToContext"
                        {
                            "Context"   "encounterContext()"
                            "Key"       "#glareMbfDamage"
                            "Type"      "FIELD_INTEGER"
                            "Value"     "1"
                        }
                    }
                }
            }

            "OnVictory"
            {
                "Conditional" 
                {
                    "Condition" "safeEquals(wrapContext(encounterContext(), %glareMbfDamage), 0)"
                    "Actions"
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#no_glare_mbf_win"
                        }
                    }
                }     
            }
        }
    }
}

