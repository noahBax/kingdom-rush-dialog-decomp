"sbf_aspect_dead_monitor"
{
    "AbilityBehavior"       "UNIT_TARGET | PASSIVE"

    "AbilitySpecial"
    {
        
    }

    "Modifiers"
    {
        "sbf_aspect_dead_monitor_modifier"
        {
            "Passive" "1"

            "OnAdded"
            {

                "Conditional"
                {
                    "Condition" "safeEquals(stat(%TARGET, #level), 3)"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_kill_all_allies"
                            "Target"        "%TARGET"
                        }

                        "SetState"
                        {
                            "Target"    "unitByCinematicId(#Morganok)"
                            "State"     "#PREVENT_END_FIGHT"
                            "Value"     "-1"
                        }

                        "OverrideAnimation"
                        {
                            "Target"            "%TARGET"
                            "BaseAnimationId"   "Death"
                            "NewAnimation"      "FinalDeath"
                            "OverrideId"        "novalue"
                            "Priority"          "100"
                        }
                    }
                }

                "Delay"
                {
                    "Time" "0"
                    "Actions"
                    {
                        "Lua"
                        {
                            "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverridePortraitImage('Portrait01') end"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "safeEquals(stat(%TARGET, #level), 1)"

                    "Actions"
                    {
                        "Lua"
                        {
                            "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverrideExoPartAlpha('Asst_Horn_Level2', 0) end"
                        }

                        "Lua"
                        {
                            "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverrideExoPartAlpha('Asst_Horn_Level3', 0) end"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "safeEquals(stat(%TARGET, #level), 2)"

                    "Actions"
                    {
                        "Lua"
                        {
                            "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverrideExoPartAlpha('Asst_Horn_Level3', 0) end"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "safeEquals(stat(%TARGET, #level), 3)"

                    "Actions"
                    {
                        "Lua"
                        {
                            "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverrideExoPartAlpha('Asst_Horn_Level2', 0) end"
                        }
                    }
                }
            }

            "OnTurnStarted"
            {
                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#canTeleport"
                    "Value" "1"
                }
            }

            "OnTurnFinished"
            {
                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#already_attacked"
                    "Value" "0"
                }
            }

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition" "isOnState(%DEAD, #SBF_ASPECT)"

                    "Actions" 
                    {
                        
                        "Conditional"
                        {
                            "Condition" "equal(%DEAD, %TARGET)"

                            "Actions" 
                            {
                                "Conditional"
                                {
                                    "Condition" "not(safeEquals(stat(%TARGET, #level), 3))"

                                    "Actions"
                                    {
                                        "SetStat"
                                        {
                                            "Target" "unitByCinematicId(#Morganok)"
                                            "Stat" "unitConfigString(%TARGET, #aspectStat)"
                                            "Value" "0"
                                        }

                                        "PlaySound"
                                        {
                                            "Unit"        "%TARGET"
                                            "Sound"       "#realDeath"
                                        }
                                    }

                                    "ElseActions"
                                    {
                                        "PlaySound"
                                        {
                                            "Unit"        "%TARGET"
                                            "Sound"       "#finalDeath"
                                        }
                                    }
                                }

                                "SpawnUnit"
                                {
                                    "UnitName" "#DummyUnit"
                                    "Position" "unitPosition(%TARGET)"
                                    "UnitGroup" "@UnitGroup(BadSide)"

                                    "IsAI" "1"
                                    "Nick" "#CinematicTriggerer"
                                    "AddToInitiativeOrder" "0"
                                    
                                    "OnSpawn"
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"    "sbf_aspect_dead_monitor_cinematic_trigger_modifier"
                                            "Target"         "%UNIT"
                                            "Duration"  "0"

                                            "Params"
                                            {
                                                "level" {
                                                    "type" "FIELD_FLOAT"
                                                    "value" "stat(%TARGET, #level)"
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            "ElseActions"
                            {
                                "RemoveModifier"
                                {
                                    "ModifierName"    "sbf_aspect_dead_monitor_modifier"
                                    "Target"         "%TARGET"
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"    "disable_unit_modifier"
                                    "Target"         "%TARGET"
                                }

                                "OverrideAnimation"
                                {
                                    "Target"            "%TARGET"
                                    "BaseAnimationId"   "Death"
                                    "NewAnimation"      "TeleportOut"
                                    "OverrideId"        "novalue"
                                    "Priority"          "20"
                                }

                                "Delay"
                                {
                                    "Time" "randomBetween(1, 2)"
                                    "Actions"
                                    {
                                        "PlaySound"
                                        {
                                            "Unit"        "%TARGET"
                                            "Sound"       "#teleportOut"
                                        }

                                        "KillUnit"
                                        {
                                            "Target"        "%TARGET"
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }

         "sbf_aspect_dead_monitor_cinematic_trigger_modifier"
        {
            "OnTurnStarted"
            {
                "QueueCinematic"
                {
                    "Cinematic" "stringWithIndex(#AspectDied, %level)"
                    "Optional"  "1"
                } 

                "KillUnit"
                {
                    "Target"        "%TARGET"
                }
            }
        }
    }
}

