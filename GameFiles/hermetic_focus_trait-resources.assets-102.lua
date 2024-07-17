"hermetic_focus_trait"
{
    "AbilityBehavior"       "PASSIVE"

     "AbilitySpecial"
    {
       
    }

    "Modifiers"
    {
        "hermetic_focus_trait_provider"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "hermetic_focus_bonus_modifier"
                    "Target"         "%TARGET"
                    "Duration" "1"
                }
            }

            "OnUnitLeavingNode"
            {
                "Conditional"
                {
                    "Condition" "equal(%TARGET, %UNIT)"

                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "hermetic_focus_bonus_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }
        }

        "hermetic_focus_bonus_modifier"
        {

            

            "PropertiesAdd"
            {
                "rangedAttackRange" "1"
            }
        }
    }
}
