"kill_all_allies"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"
    "Icon" "MainTarget"

     "AbilitySpecial"
    {
       
    }

    "Modifiers"
    {
        "modifier_kill_all_allies"
        {
            "Passive" "1"
            "OnRemoved"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "kill_count_achievement_trait_modifier"
                    "Target"         "unitByCinematicId(#TURNMARKER)"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "1000"
                        "Teams"     "TEAM_FRIENDLY"
                        "Source" "%TARGET"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "KillUnit"
                        {
                            "Target"        "%newTarget"
                        }
                    }
                }
                
            }
        }
    }
}
