"pass_turn_abilities"
{
    
    
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "pass_turn_extra_armor_modifier"
        {
            

           "OnAdded"
           {
                "GiveArmor"
                {
                    "Target" "%TARGET"
                    "ArmorAmount" "%pass_turn_extra_armor_bonus" 
                }
           }

           "OnRemoved"
           {
                "GiveArmor"
                {
                    "Target" "%TARGET"
                    "ArmorAmount" "0"
                }
           }

           "OnTurnStarted"
            {
               "RemoveModifier"
                {
                    "ModifierName"    "pass_turn_extra_armor_modifier"
                    "Target"         "%TARGET"
                }
            }
           

            "PropertiesAdd"
            {
                "armor_max" "%pass_turn_extra_armor_bonus" 
            }
        }


    }
}
