"hit_dev_tetsts"
{
    
    
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "hit_force_miss_modifier"
        {
            "OnPreHitGlobal"
            {
                "CancelHit"
                {

                }

                "UnitRaiseMessage"
                {
                    "Unit" "%ATTACKED"
                    "Text" "SUPRESSED"
                }
            }
        }
    }
}

"hit_logger_ability"
{
    
    
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "hit_logger_modifier"
        {
            "Passive" "1"

            "OnPostHitGlobal"
            {
                "UnitRaiseMessage"
                {
                    "Unit" "%ATTACKED"
                    "Text" "TARGET"
                }

                "UnitRaiseMessage"
                {
                    "Unit" "%ATTACKER"
                    "Text" "SOURCE"
                }
            }
        }
    }
}
