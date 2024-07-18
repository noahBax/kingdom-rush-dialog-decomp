"arenaDiversifier_encouraging_audience_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "numberOfProps"     "5"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "heal"              "2"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "foodDuration"      "2"
        }
    }

    "Modifiers"
    {
        "arenaDiversifier_encouraging_audience_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#encouraging_audience)"

                    "Actions" 
                    {
                        "SpawnUnit"
                        {
                            "UnitName"              "#DiversifierEncouragingAudienceControlUnit"
                            "Nick"                  "#DiversifierEncouragingAudience"
                            "Position"              "newPoint(1000, 1000, 0)"
                            "UnitGroup"             "@UnitGroup(BadSide)"
                            "IsAI"                  "1"
                            "OnSpawn"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"      "arenaDiversifier_encouraging_audience_summon_tribute"
                                    "Target"            "%UNIT"
                                    "Params"
                                    {
                                        "numberOfProps" 
                                        {
                                            "type" "FIELD_FLOAT"
                                            "value" "%numberOfProps"
                                        }
                                    }
                                }
                            }
                        }

                        "SetToContext"
                        {
                            "Context"   "encounterContext()"
                            "Key"       "#achievementNoFoodWinLost"
                            "Type"      "FIELD_INTEGER"
                            "Value"     "0"
                        }
                    }
                }
            }
        }

        "arenaDiversifier_encouraging_audience_summon_tribute"
        {   
            "StayOnDeath"    "1"

            "OnVictory"
            {
                "Conditional"
                {
                    "Condition" "equal(wrapContext(encounterContext(), %achievementNoFoodWinLost), 0)"
                    "Actions"
                    {
                        "AchievementIncrement"
                        {
                            "Achievement" "#qpa_no_food_win"
                        }   
                    }
                }
            }

            "OnTurnFinished" 
            {
                "PlaySound"
                {
                    "Sound" "#krl_sfx_arenaCombat_diversifiers_encouragingAudienceCheering"
                }

                "StartLogicTick"
                {
                    "Time"          "1"
                    "TickType"      "PriorityCenter"
                    "Position"      "cinematicPosition(#CenterPos)"
                }

                "SpawnUnit"
                {
                    "UnitName"              "#DummyUnit"
                    "Nick"                  "#DiversifierEncouragingAudienceTributeRemover"
                    "Position"              "newPoint(1000, 1000, 0)"
                    "UnitGroup"             "@UnitGroup(BadSide)"
                    "IsAI"                  "0"
                    "AddToInitiativeOrder"  "1"
                    "OnSpawn"
                    {
                        "SetToContext"
                        {
                            "Context"       "currentContext()"
                            "Key"           "#tributeRemover"
                            "Type"          "FIELD_OBJECT"
                            "Value"         "%UNIT"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"      "kill_on_remove_modifier"
                            "Target"            "%UNIT"
                            "Duration"          "%foodDuration"
                        }
                    }
                }

                "CallFunction"
                {
                    "Function"          "Ironhide.Legends.Content.Abilities.QPADiversifierTributeTargets"
                    "Tributes"          "%numberOfProps"
                    "UnitFilter" 
                    {
                        "Center"        "%TARGET"
                        "Radius"        "1000"
                        "Teams"         "TEAM_ALL"
                        "CustomFilter"  "customUnitFilter(#theUnit, not(isOnState(%theUnit, #PROP)))"
                    }
                    
                    "TributesFilter" 
                    {
                        "Center"        "%TARGET"
                        "Radius"        "1000"
                        "Teams"         "TEAM_ALL"
                        "Flags"         "INCLUDE_NON_TARGETABLE"
                        "CustomFilter"  "customUnitFilter(#theUnit, isOnState(%theUnit, #ENCOURAGINGAUDIENCETRIBUTE))"
                    }                  
                    
                    "MinDistanceFromOldTributes"    "1"
                    "MinDistanceBetweenNewTributes" "2"
                    "MaxDistanceToUnits"            "2"
                    					
                                        
                    "IteratorName"      "#hexa"
                    "IteratorIndexName" "#hexaIndex"
                    "Actions"
                    {
                        "Delay"
                        {
                            "Time"          "0 + (%hexaIndex * 0.25)"
                            "Actions"
                            {
                                "AttachEffect"
                                {
                                    "EffectName"    "EncouragingAudienceFXMega"
                                    "Target"        "hexPosition(%hexa)"
                                    "IsFlipped"     "randomBetween(0, 1) > 0.5"
                                }

                                "Delay"
                                {
                                    "Time"          "1"
                                    "Actions"
                                    {
                                        "PlaySound"
                                        {
                                            "Sound" "#krl_sfx_arenaCombat_diversifiers_encouragingAudienceFall_food"
                                        }

                                        "SpawnUnit"
                                        {
                                            "UnitName"                  "#DiversifierEncouragingAudienceTribute"
                                            "Position"                  "hexPosition(%hexa)"
                                            "UnitGroup"                 "@UnitGroup(BadSide)"
                                            "AddToInitiativeOrder"      "1"
                                            "IsAI"                      "1"
                                            "OnSpawn"
                                            {   
                                                "PlayActivityAnimation"
                                                {
                                                    "Target"        "%UNIT"
                                                    "Animation"     "Spawn"
                                                }

                                                "ApplyModifier"
                                                {
                                                    "ModifierName"      "arenaDiversifier_encouraging_audience_tribute"
                                                    "Target"            "%UNIT"
                                                    "Params"
                                                    {
                                                        "heal" 
                                                        {
                                                            "type" "FIELD_FLOAT"
                                                            "value" "%heal"
                                                        }
                                                    }
                                                }

                                                "ApplyModifier"
                                                {
                                                    "ModifierName"      "remove_another_unit_modifier"
                                                    "Target"            "%tributeRemover"
                                                    "Params"
                                                    {
                                                        "UNIT" {
                                                            "type"      "FIELD_OBJECT"
                                                            "value"     "%UNIT"
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        "arenaDiversifier_encouraging_audience_tribute"
        {
            "EffectName" "EncouragingAudienceSmokeFXMega"

            "OnUnitEnteredNode"
            {
               "AreaControl"
               {
                    "Center"        "unitHex(%TARGET)"
                    "Range"         "0"
                    "From"          "%from"
                    "To"            "%to"
                    "EnterActions"
                    {
                        "Conditional"
                        {
                            "Condition" "not(equal(%UNIT, %TARGET)) && matchesTeam(unitGroup(%SOURCE), unitGroup(%UNIT), @TeamFilter(TEAM_ALL))"
                            "Actions"
                            {
                                "PlaySound"
                                {
                                    "Sound" "#krl_sfx_arenaCombat_diversifiers_encouragingAudiencePickup"
                                }

                                "KillUnit"
                                {
                                    "Target"        "%TARGET"
                                    "InstaKill"     "1"
                                }

                                "Delay"
                                {
                                    "Time"          "0.5"
                                    "Actions"
                                    {
                                        "Heal"
                                        {
                                            "Target"        "%UNIT"
                                            "HealAmount"    "%heal"
                                        }

                                        "AttachEffect"
                                        {
                                            "EffectName"    "HealingFXMega"
                                            "Target"        "%UNIT"
                                        }

                                        "Conditional"
                                        {
                                            "Condition" "matchesGroup(unitGroup(%UNIT), @UnitGroup(GoodSide)) && not(isAI(%UNIT))"
                                            "Actions"
                                            {
                                                "SetToContext"
                                                {
                                                    "Context"   "encounterContext()"
                                                    "Key"       "#achievementNoFoodWinLost"
                                                    "Type"      "FIELD_INTEGER"
                                                    "Value"     "1"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            "OnTurnFinishedGlobal"
            {
                "Conditional" 
                {
                    "Condition" "not(equal(%UNIT, %TARGET)) && safeEquals(hexDistance(unitHex(%TARGET), unitHex(%UNIT)), 0) && not(isOnState(%UNIT, #NON_TARGETABLE)) && not(isOnState(%UNIT, #DEAD))"

                    "Actions"
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_arenaCombat_diversifiers_encouragingAudiencePickup"
                        }

                        "KillUnit"
                        {
                            "Target"        "%TARGET"
                            "InstaKill"     "1"
                        }
                                
                        "Delay"
                        {
                            "Time"          "0.5"
                            "Actions"
                            {
                                "Heal"
                                {
                                    "Target"        "%UNIT"
                                    "HealAmount"    "%heal"
                                }

                                "AttachEffect"
                                {
                                    "EffectName"    "HealingFXMega"
                                    "Target"        "%UNIT"
                                }

                                "Conditional"
                                {
                                    "Condition" "matchesGroup(unitGroup(%UNIT), @UnitGroup(GoodSide)) && not(isAI(%UNIT))"
                                    "Actions"
                                    {
                                        "SetToContext"
                                        {
                                            "Context"   "encounterContext()"
                                            "Key"       "#achievementNoFoodWinLost"
                                            "Type"      "FIELD_INTEGER"
                                            "Value"     "1"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
