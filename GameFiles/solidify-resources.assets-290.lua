"solidify"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastB"
    "CastFXId" "GolemSolidifyCastFXMega"
    "Icon" "StoneShield"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"

     "AbilitySpecial"
    {
    }


    "OnAbilityAction"
    {

        "GiveArmor"
        {
            "Target" "%TARGET"
            "ArmorAmount" "1000"
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "3"
            "Considerations"
            {
                "requires minimum armor missing"
                {
                    "Curve" "Linear|-10|1|1|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "Min" "2"
                        "Max" "3"
                        "Stat" "#armor"
                    }
                }
            }
        }
    }
}
