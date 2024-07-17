"winter_wulf_ai"
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
        "GetCloseToUnitAI"
        {
            "BrainId" "#Custom"
        }
    }

    "AIBrainCustom"
    {
        "Selection" 
        {
            "Weight" "1"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "PathDistance"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }

                "Ignores targets already frozen"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "modifier_new_freeze"  
                    }
                }
            }
        }
    }
}
