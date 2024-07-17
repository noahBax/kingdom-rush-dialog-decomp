"magic_endturn_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "Icon" "Preparation"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "cooldownOffset"            "1"
        }
    }

    "Modifiers"
    {
        "magic_endturn_trait_modifier"
        {
            "Passive" "1"

            "OnEndTurnSkillCheck"
            {
                "OffsetCooldown"
                {
                    "Target" "%TARGET"
                    "Offset" "0-%cooldownOffset"
                }
            }
        }
    }
}
