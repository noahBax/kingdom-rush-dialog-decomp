"berserk_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "Icon" "Berserker"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "heal"                  "2"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "extraDamage"                  "2"
        }

        "03"
        {
            "var_type"                  "FIELD_FLOAT"
            "stunTurns"                  "1"
        }

        "04"
        {
            "var_type" "FIELD_FLOAT"
            "triggerChance" "40"
        }
    }

    "Modifiers"
    {
        "berzerk_trait_provider"
        {
            "Passive" "1"

            "OnPostHit"
            {
                "Conditional" 
                {
                    "Condition" "hitConnected(%HIT) && (randomBetween(0, 1) <= (%triggerChance/100)) && not(isOnState(%TARGET, #STUNNED)) && not(hasModifier(%TARGET, #berzerk_trait_state_modifier)"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"    "berzerk_trait_state_modifier"
                            "Target"         "%TARGET"
                        }

                        "PlayAnimation"
                        {
                            "Target" "%TARGET"
                            "Animation" "Berserk"
                        }

                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatBarbarian_berserkRitualCast"
                        }

                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatBarbarian_berserkActivation"
                        }
                    }
                }
            }
        }

        "berzerk_trait_state_modifier"
        {
            
            "EffectName" "BarbarianBerserkStatusFXMega"

            "Icon" "Enraged01"
            "IconPriority" "50"

            "OnTurnStarted"
            {
                "Heal"
                {
                    "Target"        "%TARGET"
                    "HealAmount"    "%heal"
                }

                "#AttachEffect"
                {
                    "EffectName" "HealingFXMega"
                    "Target" "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "berzerk_trait_monitor_modifier"
                    "Target"         "%TARGET"
                }
            }

            "PropertiesAdd"
            {
                "extraDamage" "%extraDamage"
            }
        }

        "berzerk_trait_monitor_modifier"
        {
            "OnTurnFinished"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "berzerk_trait_state_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "modifier_stunned"
                    "Target"         "%TARGET"
                    "Duration" "%stunTurns"
                }

                "PlaySound"
                {
                    "Sound" "#krl_sfx_combatGeneric_stunnedStatus"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "berzerk_trait_monitor_modifier"
                    "Target"         "%TARGET"
                }
            }

            "OnPostHitGlobal"
            {
                "Conditional" 
                {
                    "Condition" "hitConnected(%HIT) && equal(%TARGET, %ATTACKER)"
                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "berzerk_trait_monitor_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }

        }

    }
}
