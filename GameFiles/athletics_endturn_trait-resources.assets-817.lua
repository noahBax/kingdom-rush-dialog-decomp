"athletics_endturn_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "Icon" "KeenFocus"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "extraDamage"            "2"
        }
    }

    "Modifiers"
    {
        "athletics_endturn_trait_modifier"
        {
            "Passive" "1"

            "OnEndTurnSkillCheck"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "athletics_endturn_trait_modifier_active"
                    "Target"         "%TARGET"
                    "Duration"  "0"
                }
            }
        }

        "athletics_endturn_trait_modifier_active"
        {
            "Icon" "KeenFocus"
            "IconPriority" "25"

            "OnTurnFinished"
            {
               "RemoveModifier"
                {
                    "ModifierName"    "athletics_endturn_trait_modifier_active"
                    "Target"         "%TARGET"
                }
            }

            "PropertiesAdd"
            {
                "extraDamage" "%extraDamage"
            }
        }
    }
}
