"sbf_aspect_summoner_attack2"
{
    "AbilityBehavior"   "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityCastRange"          "0"
    "AbilityCooldown"           "0"
    "AbilityAPCost"             "1"
    "CastFXId"                  "SBFAspectSummonerCastFXMega"
    "AnimationID"               "Attack"
    "Icon"                      "MorAttack"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "turnsToRegrowth" "stat(%CASTER, #turnsToRegrowth)"
        }
    }

    "OnAbilityStart"
    {
        "StartLogicTick"
        {
            "Time" "0.5"
            "TickType" "PriorityCenter"
            "Position" "unitPosition(%SOURCE)"
        }
    }

    "OnAbilityAction"
    { 
        "SetStat"
        {
            "Target" "%CASTER"
            "Stat" "#already_attacked"
            "Value" "1"
        }

        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.SBFAspectSummonerAttackTarget"

            "HeroFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "MainHexa" "unitHex(%SOURCE)"
            "Range" "stat(%CASTER, #rangedAttackRange)"

            "MagicAspectFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_FRIENDLY"
                "CustomFilter" "customUnitFilter(#theUnit, isOnState(%theUnit, #SBF_ASPECT_MAGIC))"
            }

            "TargetHexaName" "#hexa"

            "Actions"
            {
                "Conditional"
                {
                    "Condition"         "safeEquals(stat(%CASTER, #level), 1)"

                    "Actions" 
                    {
                        "#SpawnUnit"
                        {
                            "UnitName"                  "#Trunk"
                            "Position"                  "hexPosition(%hexa)"
                            "UnitGroup"                 "unitGroup(%CASTER)"
                            "IsAI"                      "isAI(%CASTER)"
                            "AddToInitiativeOrder"      "1"
                            "IsFlipped"                 "unitIsFlipped(%CASTER)"
                            "FindFreeHexaInRange"       "3"

                            "OnSpawn"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"              "trunk_regrowth_trait_remains_modifier"
                                    "Target"                    "%UNIT"
                                    "Duration"                  "expr(%turnsToRegrowth)"
                                }
                            }
                        }

                        "#SpawnUnit"
                        {
                            "UnitName"                  "#Thorns"
                            "Position"                  "hexPosition(%hexa)"
                            "UnitGroup"                 "unitGroup(%CASTER)"
                            "IsAI"                      "1"
                            "FindFreeHexaInRange"       "3"
                            "OnSpawn"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"     "bravebark_natures_wrath_modifier"
                                    "Target"           "%UNIT"
                                }
                            }
                        }
                        

                        "SpawnUnit"
                        {
                            "UnitName"                  "#Vinepaw"
                            "Position"                  "hexPosition(%hexa)"
                            "UnitGroup"                 "unitGroup(%CASTER)"
                            "IsAI"                      "isAI(%CASTER)"
                            "AddToInitiativeOrder"      "1"
                            "IsFlipped"                 "unitIsFlipped(%CASTER)"
                            "FindFreeHexaInRange"       "3"
                            
                            "OnSpawn"
                            {
                                "#ApplyModifier"
                                {
                                    "ModifierName"              "modifier_burning"
                                    "Target"                    "%UNIT"
                                    "Duration"                  "3"
                                }
                                "ApplyModifier"
                                {
                                    "ModifierName"              "modifier_asleep"
                                    "Target"                    "%UNIT"
                                    "Duration"                  "2"
                                }
                            }

                        }

                    }
                }

                "Conditional"
                {
                    "Condition"         "safeEquals(stat(%CASTER, #level), 2)"

                   
                    
                      
                       
                         
                           
                            
                            
                            
                            
                            

                            
                            
                            
                        
                    

                    "Actions" 
                    {
                        "SpawnUnit"
                        {
                            "UnitName"                  "#Sapling"
                            "Position"                  "hexPosition(%hexa)"
                            "UnitGroup"                 "unitGroup(%CASTER)"
                            "IsAI"                      "isAI(%CASTER)"
                            "AddToInitiativeOrder"      "1"
                            "IsFlipped"                 "unitIsFlipped(%CASTER)"
                            "FindFreeHexaInRange"       "3"

                            "OnSpawn"
                            {
                            }
                        }
                    }
                }

                "Conditional"
                {
                    "Condition"         "safeEquals(stat(%CASTER, #level), 3)"

                    "Actions" 
                    {
                        "SpawnUnit"
                        {
                            "UnitName"                  "#Trunk"
                            "Position"                  "hexPosition(%hexa)"
                            "UnitGroup"                 "unitGroup(%CASTER)"
                            "IsAI"                      "isAI(%CASTER)"
                            "AddToInitiativeOrder"      "1"
                            "IsFlipped"                 "unitIsFlipped(%CASTER)"
                            "FindFreeHexaInRange"       "3"

                            "OnSpawn"
                            {
                            }
                        }
                    }
                }

                "AttachEffect"
                {
                    "EffectName"                "SBFAspectSummonerPuffFXMega"
                    "Target"                    "hexPosition(%hexa)"
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight"                    "200"
            "Considerations"
            {
                "is first action"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "0"
                        "Stat" "#already_attacked"
                        "Owner" "1"
                    }
                }
            }
        }
    }

}
