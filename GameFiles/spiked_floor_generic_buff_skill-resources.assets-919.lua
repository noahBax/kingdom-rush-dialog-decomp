"spiked_floor_generic_buff_skill"
{
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_FLOAT"
            "damage"                "2"
        }

        "02"
        {
            "var_type"              "FIELD_FLOAT"
            "alternateStateTurns"   "1"
        }
    }

    "Modifiers"
    {
        "spiked_floor_init_modifier"
        {
            "Passive" "1"

            "OnAdded"
            {
                "RemoveModifier"
                {
                    "ModifierName"      "spiked_floor_init_modifier"
                    "Target"            "%TARGET"
                }

                "Conditional" 
                {
                    "Condition" "isOnState(%TARGET, #START_ENABLED)"
                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "spiked_floor_active_modifier"
                            "Target"            "%TARGET"
                            "Duration"          "%alternateStateTurns"
                        }
                    }
                    "ElseActions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "spiked_floor_disabled_modifier"
                            "Target"            "%TARGET"
                            "Duration"          "%alternateStateTurns"
                        }
                    }
                }
            }
        }

        "spiked_floor_disabled_modifier"
        {
            "StayOnDeath"    "1" 

            "OnAdded"
            {
                "PlayActivityAnimation"
                {
                    "Target"            "%TARGET"
                    "Animation"         "Desactivate"
                }

                "PlaySound"
                {
                    "Sound" "#krl_sfx_arenaCombat_spikedFloorSpikesOut"
                }
            }

            "OnRemoved"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "spiked_floor_active_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "%alternateStateTurns"
                }
            }
        }

        "spiked_floor_active_modifier"
        {
            "StayOnDeath"    "1" 
            "AnimationOverride"         "StandActivate"

            "OnRemoved"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "spiked_floor_disabled_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "%alternateStateTurns"
                }
            }

            "OnAdded"
            {
                "PlayActivityAnimation"
                {
                    "Target"            "%TARGET"
                    "Animation"         "Activate"
                }

                "PlaySound"
                {
                    "Sound" "#krl_sfx_arenaCombat_spikedFloorSpikesIn"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"        "%TARGET"
                        "Radius"        "0"
                        "Teams"         "TEAM_ALL"
                    }
                    "IteratorName"      "#newTarget"
                    "Actions"    
                    {
                        "Hit"
                        {
                            "Target"        "%newTarget"
                            "Source"        "%TARGET"
                            "EffectName"    "RuptureHitFXMega" 
                            "Tags"          "stringList(#ENVIRONMENTAL)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%damage"
                                }
                            }
                        }
                    }
                }
            }

            "OnUnitEnteredNode"
            {
                "AreaControl"
                {
                    "Center"    "unitHex(%TARGET)"
                    "Range"     "0"
                    "From"      "%from"
                    "To"        "%to"
                    "EnterActions"
                    {
                        "Hit"
                        {
                            "Target"        "%UNIT"
                            "Source"        "%TARGET"
                            "EffectName"    "SpikedFloorHitFXMega" 
                            "Tags"          "stringList(#ENVIRONMENTAL)"

                            "InitActions"
                            {
                                "#InterruptUnit"
                                {
                                    "Target"    "%HITTARGET"
                                }

                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%damage"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
