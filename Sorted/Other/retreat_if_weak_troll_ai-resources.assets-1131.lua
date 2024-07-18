"retreat_if_weak_troll_ai"
{
    "AbilityBehavior"       "MELEE"
    "AbilityTeamFilter"     "TEAM_ENEMY"
    "AbilityCastRange"      "999"
    "AbilityCooldown"       "0"
    "AbilityAPCost"         "0"
    "AnimationID"           "Attack"

    "AbilitySpecial" 
    {
    }

    "OnThink"
    {
        "RetreatIfWeekAI"
        {
           "MaxDistance"    "stat(%CASTER, #walkSpeedAvailable)"
           "BrainId"        "#Custom"
        }
    }

    "AIBrainCustom"
    {
        "Selection" 
        {
            "Weight"        "10"
            "Considerations"
            {
                "Has a minimum of health missing"
                {
                    "Curve" "Linear|1000|1|0|0.99"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "Min" "0"
                        "Max" "stat(%CASTER, #troll_retreat_health_missing_min_percent)"
                        "Stat" "#health_missing_percent"
                        "Owner" "1"
                    }
                }

                "Is not burning"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#BURNING"
                        "Owner" "1"
                    }
                }

                "Avoid Threat"
                {
                    "Curve" "Linear|-0.5|1|1|0"
                    "Consideration" "InfluenceMap"
                    "Params"
                    {
                        "MapId" "#Enemies"  
                        "Max" "5"
                        "Min" "0"
                    }
                }
            }
        }
    }
}
