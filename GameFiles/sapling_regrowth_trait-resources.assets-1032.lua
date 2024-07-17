"sapling_regrowth_trait"
{
    "AbilityBehavior"               "UNIT_TARGET | PASSIVE"
    "Icon"                          "Regrowth"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "turnsToRegrowht"           "4"
        }
    }

    "Modifiers"
    {
        "sapling_regrowth_trait_modifier"
        {
            "Passive"                    "1"

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition"     "equal(%DEAD, %TARGET)"
                    "Actions" 
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_genericCombat_saplingDeath"
                        }

                        "Delay"
                        {
                            "Time"              "3"
                            "Actions"
                            {
                                "SpawnUnit"
                                {
                                    "UnitName"                  "#Trunk"
                                    "Position"                  "unitPosition(%TARGET)"
                                    "UnitGroup"                 "unitGroup(%TARGET)"
                                    "IsAI"                      "1"
                                    "IsFlipped"                 "unitIsFlipped(%TARGET)"
                                    "AddToInitiativeOrder"      "0"
                                    "OnSpawn"
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"              "trunk_regrowth_trait_remains_modifier"
                                            "Target"                    "%UNIT"
                                            "Duration"                  "%turnsToRegrowht"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        "trunk_regrowth_trait_remains_modifier"
        {
            "Icon"                      "Regrowing"
            "IconPriority"              "50"
            "AnimationOverride"         "IdleRegrowth"
            "StayOnDeath"    "1"


            "OnRemoved"
            { 
                "PlayActivityAnimation"
                {
                    "Target"            "%TARGET"
                    "Animation"         "SpawnRegrowth"
                }

                "PlaySound"
                {
                    "Sound"             "#krl_sfx_genericCombat_saplingRegrowthFull"
                }
            }

            "OnTurnStarted"
            {
                "Conditional"
                {
                    "Condition"             "modifierTurnsRemaining(%MODIFIERINSTANCE) > 3 || safeEquals(modifierTurnsRemaining(%MODIFIERINSTANCE), 3)"
                    "Actions"
                    {
                        "PlayActivityAnimation"
                        {
                            "Target"            "%TARGET"
                            "Animation"         "ActiveRegrowth01"
                        }

                        "PlaySound"
                        {
                            "Sound"             "#krl_sfx_genericCombat_saplingRegrowthShort"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition"             "safeEquals(modifierTurnsRemaining(%MODIFIERINSTANCE), 2)"
                    "Actions"
                    {
                        "PlayActivityAnimation"
                        {
                            "Target"            "%TARGET"
                            "Animation"         "ActiveRegrowth02"
                        }

                        "PlaySound"
                        {
                            "Sound"             "#krl_sfx_genericCombat_saplingRegrowthMid"
                        }
                    }
                }
            }

            "States"
            {
                "NON_TARGETABLE"            "1"

                "CANT_BE_POISONED"          "1"
                "CANT_BE_BURNT"             "1"
                "CANT_BE_BLED"              "1"
                "CANT_BE_STUNNED"           "1"
                "CANT_BE_ROOTED"            "1"
                "CANT_BE_ASLEPT"            "1"
                "CANT_BE_FROZEN"            "1"

                "NO_CHECK_END_FIGHT"        "1"
                "STUNNED"                   "1"
            }
        }
    }
}

