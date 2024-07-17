"krum_main_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "krum_main_trait_modifier"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
            	"CameraControl"
            	{
            		"TakeOver" "1"
            	}

                "QueueCinematic"
		        {
		            "Cinematic" "#KrumFocus"
		        }
            }

            "OnTurnFinished"
            {
            	"CameraControl"
            	{
            		"TakeOver" "0"
            	}
            }
        }

        "krum_sounds_trait_modifier"
        {
            "Passive" "1"

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition" "matchesTeam(unitGroup(%TARGET), unitGroup(%DEAD), @TeamFilter(TEAM_FRIENDLY))
                                && not(isOnState(%DEAD, #krumTarget))"

                    "Actions" 
                    {
                        "PlaySound"
                        {
                            "Unit" "%SOURCE"
                            "Sound" "#boo"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "matchesTeam(unitGroup(%TARGET), unitGroup(%DEAD), @TeamFilter(TEAM_ENEMY))
                                && not(isOnState(%DEAD, #krumTarget))"

                    "Actions" 
                    {
                        "PlaySound"
                        {
                            "Unit" "%SOURCE"
                            "Sound" "#cheer"
                        }
                    }
                }
            }
        }

        "krum_onchair_trait_modifier"
        {
            "Passive" "1"

            "OnAdded"
            {
                "#Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('SOURCE').unitView.SetHeightOffset(-2) end"
                }
            }

            "OnTurnStarted"
            {
            	"ActOnTargets" 
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "1000"
                        "Teams"     "TEAM_FRIENDLY"
                    }

                    "IteratorName" "#newTarget"
                
                    "ActionsIfNotFound"    
                    {
				        "SetStat"
				        {
				            "Target" "%SOURCE"
				            "Stat" "#canTeleport"
				            "Value" "1"
				        }

                        "SetStat"
                        {
                            "Target" "%SOURCE"
                            "Stat" "#willGoDown"
                            "Value" "1"
                        }

                        "SetStat"
                        {
                            "Target" "%SOURCE"
                            "Stat" "#downIteration"
                            "Value" "1"
                        }

				        "RemoveModifier"
		                {
		                    "ModifierName"    "krum_onchair_trait_modifier"
		                    "Target"         "%TARGET"
		                }
                    }
                }
            }

           	"States"
            {
                "NON_TARGETABLE" "1"
            }
        }

        "krum_onfloor_trait_modifier"
        {
            "OnTurnStarted"
            {
		        "SetStat"
		        {
		            "Target" "%SOURCE"
		            "Stat" "#canTeleport"
		            "Value" "1"
		        }

                "SetStat"
                {
                    "Target" "%SOURCE"
                    "Stat" "#willGoDown"
                    "Value" "0"
                }

                "SetStat"
                {
                    "Target" "%SOURCE"
                    "Stat" "#downIteration"
                    "Value" "stat(%SOURCE, #downIteration) + 1"
                }
            }

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition" "equal(%DEAD, %TARGET)"

                    "Actions" 
                    {
                        "StartLogicTick"
                        {
                            "Time" "1"
                            "TickType" "PriorityCenter"
                            "Position" "unitPosition(%TARGET)"
                        }


                        "AttachEffect"
                        {
                            "EffectName" "KrumDeathLightningStrikeFXMega"
                            "Target" "%TARGET"
                            "Dependant" "1"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"            "%TARGET"
                                "Radius"            "1000"
                                "Teams"             "TEAM_ALL"
                                "Flags"             "INCLUDE_NON_TARGETABLE"
                                "CustomFilter"      "customUnitFilter(#theUnit, isOnState(%theUnit, #krumTarget))"
                            }

                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "KillUnit"
                                {
                                    "Target"        "%newTarget"
                                }
                            }
                        }

                        "HideInitiativeBar"
                        {
                        }
                    }
                }
            }

            "PropertiesAdd"
            {
                "cantRays" "stat(%TARGET, #extraRays)"
            }
        }
    }
}

