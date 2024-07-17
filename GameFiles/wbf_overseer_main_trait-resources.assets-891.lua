"wbf_overseer_main_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "wbf_overseer_phase1_modidfier"
        {
            "Passive" "1"
            "Tags" "wbf_phase"

            "OnAdded"
            {
                "Delay"
                {
                    "Time" "0"
                    "Actions"
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#WBFOverseerPortal"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                                "SetToContext"
                                {
                                    "Context" "unitContext(%TARGET)"
                                    "Key" "#portal"
                                    "Value" "%UNIT"
                                    "Type" "FIELD_OBJECT"
                                }
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#WBFOverseerRocks"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                                "SetToContext"
                                {
                                    "Context" "unitContext(%TARGET)"
                                    "Key" "#rocks"
                                    "Value" "%UNIT"
                                    "Type" "FIELD_OBJECT"
                                }
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#WBFOverseerSpeaker"
                            "Position" "cinematicPosition(#IrizaRespawnPos)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                                "SetToContext"
                                {
                                    "Context" "unitContext(%TARGET)"
                                    "Key" "#speaker"
                                    "Value" "%UNIT"
                                    "Type" "FIELD_OBJECT"
                                }
                            }
                        }
                    }
                }
            }

            "States"
            {
                "PHASE1" "1"
            }
        }

        "wbf_overseer_phase2_modidfier"
        {
            "Tags" "wbf_phase"
            "AutoRemoveTags" "wbf_phase"
            
            "OnAdded"
            {
                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#cocoons"
                    "Value" "stat(%TARGET, #cocoons_phase2)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#tentacles"
                    "Value" "stat(%TARGET, #tentacles_phase2)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#eyes"
                    "Value" "stat(%TARGET, #eyes_phase2)"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Idle"
                    "NewAnimation"      "Idle2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Attack"
                    "NewAnimation"      "Attack2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Angry"
                    "NewAnimation"      "Angry2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Speak"
                    "NewAnimation"      "Speak2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "SpawnUnit"
                {
                    "UnitName" "#WBFOverseerRocks"
                    "Position" "unitPosition(%TARGET)"
                    "UnitGroup" "unitGroup(%TARGET)"
                    "IsAI" "1"
                    "OnSpawn"
                    {
                        "SetToContext"
                        {
                            "Context" "unitContext(%TARGET)"
                            "Key" "#rocks2"
                            "Value" "%UNIT"
                            "Type" "FIELD_OBJECT"
                        }

                        "OverrideAnimation"
                        {
                            "Target"            "%UNIT"
                            "BaseAnimationId"   "Idle"
                            "NewAnimation"      "Idle2"
                            "OverrideId"        "novalue"
                            "Priority"          "20"
                        }

                        "PlayActivityAnimation"
                        {
                            "Target" "%UNIT"
                            "Animation" "Spawn2"
                        }
                    }
                }

                "Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverridePortraitImage('Portrait02') end"
                }
            }

            "States"
            {
                "PHASE2" "1"
            }
        }

        "wbf_overseer_phase3_modidfier"
        {
            "Tags" "wbf_phase"
            "AutoRemoveTags" "wbf_phase"
            
            "OnAdded"
            {
                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#cocoons"
                    "Value" "stat(%TARGET, #cocoons_phase3)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#tentacles"
                    "Value" "stat(%TARGET, #tentacles_phase3)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#eyes"
                    "Value" "stat(%TARGET, #eyes_phase3)"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Idle"
                    "NewAnimation"      "Idle3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Attack"
                    "NewAnimation"      "Attack3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Angry"
                    "NewAnimation"      "Angry3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Speak"
                    "NewAnimation"      "Speak3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "SpawnUnit"
                {
                    "UnitName" "#WBFOverseerRocks"
                    "Position" "unitPosition(%TARGET)"
                    "UnitGroup" "unitGroup(%TARGET)"
                    "IsAI" "1"
                    "OnSpawn"
                    {
                        "SetToContext"
                        {
                            "Context" "unitContext(%TARGET)"
                            "Key" "#rocks3"
                            "Value" "%UNIT"
                            "Type" "FIELD_OBJECT"
                        }

                        "OverrideAnimation"
                        {
                            "Target"            "%UNIT"
                            "BaseAnimationId"   "Idle"
                            "NewAnimation"      "Idle3"
                            "OverrideId"        "novalue"
                            "Priority"          "30"
                        }

                        "PlayActivityAnimation"
                        {
                            "Target" "%UNIT"
                            "Animation" "Spawn3"
                        }
                    }
                }

                "Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverridePortraitImage('Portrait03') end"
                }
            }

            "States"
            {
                "PHASE3" "1"
            }
        }
    }
}

