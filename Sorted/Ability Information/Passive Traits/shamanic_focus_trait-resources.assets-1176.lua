"shamanic_focus_trait"
{
    "AbilityBehavior"       "PASSIVE"
    "Icon" "ShamanicFocus"
     "AbilitySpecial"
    {
       "01"
        {
            "var_type"              "FIELD_FLOAT"
            "extraDamage"                  "1"
        }
    }

    "Modifiers"
    {
        "shamanic_focus_trait_provider"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "shamanic_focus_bonus_modifier"
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
                            "ModifierName"    "shamanic_focus_bonus_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }
        }

        "shamanic_focus_bonus_modifier"
        {

            

            "PropertiesAdd"
            {
                "baseDamage" "%extraDamage"
            }
        }
    }
}
