"walk_to_closest_ranged_ai"
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
            "MinDistance" "stat(%UNIT, #rangedAttackRange)"
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
            }
        }
    }
}
