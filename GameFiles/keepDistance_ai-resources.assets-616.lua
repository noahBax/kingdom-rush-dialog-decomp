"keepDistance_ai"
{
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "999"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "0"
    "AnimationID"   "Attack"

    "AbilitySpecial" 
    {
    }

    "OnThink"
    {
        "KeepDistanceAI2"
        {
           "BrainId" "#Custom"
        }
    }

    "AIBrainCustom"
    {
        "Selection" 
        {
            "Weight" "10"
            "Considerations"
            {

                "Deseo"
                {
                    "Curve" "Quadratic|-1|2|1|1"
                    "Consideration" "InfluenceMap"
                    "Params"
                    {
                        "MapId" "#Desire"  
                        "Max" "3"
                        "Min" "0"
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
