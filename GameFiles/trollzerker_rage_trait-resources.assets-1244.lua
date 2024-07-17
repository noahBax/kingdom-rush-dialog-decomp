"trollzerker_rage_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "Icon"                  "TrollzerkersRage"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "trollzerker_rage_trait_trait_modifier"
        {
            "Passive" "1"

            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && hitEffectiveDamage(%HIT) > 0"
                    "Actions" 
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "troll_enrage_enraged_modifier"
                            "Target"          "%TARGET"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"     "troll_enrage_enraged_modifier" 
                            "Target"           "%TARGET"
                            "Duration"          "2"
                        }

                        "AttachEffect"
                        {
                            "EffectName"      "TrollEnrageFXMega"
                            "Target"          "%TARGET"
                        }

                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_genericCombat_trollzerkerRage"
                        }
                    }
                }
            }
        }
    }
}

