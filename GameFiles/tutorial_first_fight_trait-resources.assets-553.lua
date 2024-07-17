"tutorial_first_fight_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "tutorial_first_fight_trait_end_turn_modifier"
        {
            "Passive" "1"

            "OnUnitEnteredNode"
            {
                "QueueCinematic"
                {
                    "Cinematic" "#EndTurnTutorial"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "tutorial_first_fight_trait_end_turn_modifier"
                    "Target"         "%TARGET"
                }
            }
        }

        "tutorial_first_fight_trait_first_movement_modifier"
        {
            "Passive" "1"

            "OnTurnStartedGlobal"
            {
                "QueueCinematic"
                {
                    "Cinematic" "#FirstMovementTutorial"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "tutorial_first_fight_trait_first_movement_modifier"
                    "Target"         "%TARGET"
                }
            }
        }

        "tutorial_first_fight_trait_melee_movement_modifier"
        {
            "Passive" "1"

            "OnTurnStartedGlobal"
            {
                "Conditional"
                {
                    "Condition" "debugExpression(stat(%TARGET, #turnsPlayed) > 0)"

                    "Actions" 
                    {

                        "QueueCinematic"
                        {
                            "Cinematic" "#MeleeMovementTutorial"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"  "tutorial_first_fight_trait_melee_attack_modifier"
                            "Target"        "%TARGET"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "tutorial_first_fight_trait_melee_movement_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }
        }

        "tutorial_first_fight_trait_melee_attack_modifier"
        {
            "Passive" "1"

            "OnUnitEnteredNode"
            {
                "QueueCinematic"
                {
                    "Cinematic" "#MeleeAttackTutorial"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "tutorial_first_fight_trait_melee_attack_modifier"
                    "Target"         "%TARGET"
                }
            }
        }
    }
}

