"healstalk_healing_bloom_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "healstalk_healing_bloom_modifier"
        {
            "Passive" "1"

            "OnHitPreResult"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "healstalk_healing_aura_modifier"
                    "Target"            "%TARGET"
                }

                "RemoveModifier"
                {
                    "ModifierName"      "healstalk_healing_bloom_modifier"
                    "Target"            "%TARGET"
                }
            }
        }
    }
}
