"sorceress_grounded_trait"
{
    "AbilityBehavior"       "PASSIVE"
    "Icon"                  "Grounded"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"      "FIELD_FLOAT"
            "extraRange"     "2"
        }
    }

    "Modifiers"
    {
        "sorceress_grounded_trait_modifier_provider"
        {
            "Passive"       "1"

            "OnTurnStarted"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "sorceress_grounded_trait_bonus_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "1"
                }
            }
        }

        "sorceress_grounded_trait_bonus_modifier"
        {
            "EffectName"                "AjaxsBlessingAuraFXMega"

            "PropertiesAdd"
            {
                "rangedAttackRange"     "%extraRange"
            }

            "OnUnitLeavingNode"
            {
                "RemoveModifier"
                {
                    "ModifierName"      "sorceress_grounded_trait_bonus_modifier"
                    "Target"            "%TARGET"
                }   
            }
        }
    }
}

