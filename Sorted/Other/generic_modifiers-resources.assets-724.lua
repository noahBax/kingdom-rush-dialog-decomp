"generic_modifiers"
{
    
    
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "kill_on_remove_modifier"
        {
            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"        "%TARGET"
                }
            }
        }

        "remove_another_unit_modifier"
        {
            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"        "%UNIT"
                }
            }
        }
        
        "damage_on_remove_modifier" 
        {
            "Passive" "1"
            
            "OnRemoved"
            {
                "Hit"
                {
                    "Target" "%TARGET"
                    
                    "Tags" "stringList(#INTERNAL)"

                    "InitActions"
                    {
                    }
                }
            }
        }

        "disable_unit_modifier"
        {
            "Passive" "1"
            
            "States"
            {
                "DISABLED" "1"
            }
        }

        "camera_control_modifier"
        {
            "Passive" "1"
            
            "States"
            {
                "CONSTROLSCAMERA" "1"
            }
        }

       

        "cheat_restore_cooldown"
        {
            "OnTurnStarted"
            {
               "ResetCooldown"
               {
                    "Target" "%TARGET"
               }
            }
        }
    }
}
