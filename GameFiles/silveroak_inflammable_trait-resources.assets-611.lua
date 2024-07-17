"silveroak_inflammable_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "Icon"                  "Inflammable"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "extraBurnDamage"           "1"
        }
    }

    "Modifiers"
    {
        "silveroak_inflammable_trait_modifier"
        {
            "Passive"   "1"

            "OnAdded"
            {
                "SetStat"
                {
                    "Target"        "%TARGET"
                    "Stat"          "#extraBurnDamage"
                    "Value"         "1"
                }
            }
        }
    }
}

