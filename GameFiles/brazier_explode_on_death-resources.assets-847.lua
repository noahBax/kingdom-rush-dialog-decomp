"brazier_explode_on_death"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
       "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "explodeRadius"         "stat(%TARGET, #explodeRadius)"
        }

        "02"
        {
            "var_type"              "FIELD_FLOAT"
            "duration"              "2"
        }

        "03"
        {
            "var_type"              "FIELD_EXPRESSION"
            "explodeDamage"         "stat(%TARGET, #explodeDamage)"
        }

        "04"
        {
            "var_type"              "FIELD_FLOAT"
            "floorDuration"         "2"
        }
    }

    "Modifiers"
    {   
        "brazier_sparks_modifier"
        {
            "Passive" "1"
            "EffectName" "BrazierSparksFXMega"
        }

        "brazier_explode_on_death_modifier"
        {
           "Passive" "1"


           "OnHitEnd"
            {
                "RemoveModifier"
                {
                    "ModifierName"      "brazier_explode_on_death_modifier"
                    "Target"            "%TARGET"
                }

                "SetToContext"
                {
                    "Context" "currentContext()"
                    "Key" "#explodeDelay"
                    "Value" "randomBetween(0.3, 1.2)"
                    "Type" "FIELD_FLOAT"
                }

                "StartLogicTick"
                {
                    "Time" "%explodeDelay"
                    "TickType" "FX "
                    "Position" "unitPosition(%SOURCE)"
                }

                "AttachEffect"
                {
                    "EffectName" "FireballHitFXMega"
                    "Target" "%SOURCE"
                }

                "Delay"
                {
                    "Time" "%explodeDelay"
                    "Actions"
                    {
                        "AttachEffect"
                        {
                            "EffectName" "FireballExplosionFXMega"
                            "Target" "unitPosition(%TARGET)"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"            "unitPosition(%TARGET)"
                                "Radius"            "expr(%explodeRadius)"
                                "Teams"             "TEAM_ALL"
                                "ExcludedUnits"     "objectList(%TARGET)"
                            }

                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "Hit"
                                {
                                    "Target" "%newTarget"
                                    "EffectName" "FireballHitFXMega" 
                                    "Tags" "stringList(#ENVIRONMENTAL, #AOE)"

                                    "InitActions"
                                    {
                                        "AddDamage"
                                        {
                                            "Type"            "DAMAGE_PHYSICAL"
                                            "Damage"        "expr(%explodeDamage)"
                                        }
                                    }
                                    "Actions"
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"  "modifier_burning"
                                            "Target"        "%HITTARGET"
                                            "Duration"      "%duration"
                                            "Refresh"   "1"
                                        }
                                    }

                                }
                            }
                        }

                        
                        
                        "SpawnUnit"
                        {
                            "UnitName"              "#DummyUnit"
                            "Position"              "unitPosition(%TARGET)"
                            "UnitGroup"             "unitGroup(%TARGET)"
                            "IsAI"                  "0"
                            "Nick"                  "#BrazierFloorController"
                            "InheritsInitiative"    "1"
                            "OnSpawn"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"      "remove_another_unit_modifier"
                                    "Target"            "%UNIT"
                                    "Duration"          "%floorDuration"
                                    "Params"
                                    {
                                        "UNIT" 
                                        {
                                            "type"      "FIELD_OBJECT"
                                            "value"     "%UNIT"
                                        }
                                    }
                                }

                                "SetToContext"
                                {
                                    "Context"       "currentContext()"
                                    "Key"           "#controllerUnit"
                                    "Value"         "%UNIT"
                                    "Type"          "FIELD_OBJECT"
                                }
                            }
                        }

                        "ActOnHexas"
                        {
                            "Center"            "positionHex(unitPosition(%TARGET))"
                            "Range"             "expr(%explodeRadius)"
                            "IteratorName"      "#hexa"
                        
                            "Actions"    
                            {
                                "ActOnTargets"
                                {
                                    "Target"
                                    {
                                        "Center"    "hexPosition(%hexa)"
                                        "Radius"    "0"
                                        "Teams"     "TEAM_ALL"
                                        "Flags"     "INCLUDE_NON_TARGETABLE"
                                    }

                                    "IteratorName" "#newTarget"
                                
                                    "Actions"    
                                    {
                                        "RemoveModifier"
                                        {
                                            "ModifierTag"    "floor_effect"
                                            "Target"         "%newTarget"
                                        }
                                    }
                                }

                                "SpawnUnit"
                                {
                                    "UnitName"              "#DummyUnit"
                                    "Position"              "hexPosition(%hexa)"
                                    "UnitGroup"             "unitGroup(%TARGET)"
                                    "IsAI"                  "0"
                                    "Nick"                  "#BrazierFloor"
                                    "InheritsInitiative"    "1"
                                    "OnSpawn"
                                    {
                                        "ApplyModifier"
                                        {
                                            "ModifierName"      "fire_floor_tile_modifier"
                                            "Target"            "%UNIT"
                                        }

                                        "ApplyModifier"
                                        {
                                            "ModifierName"      "remove_another_unit_modifier"
                                            "Target"            "wrapContext(currentContext(), %controllerUnit)"
                                            "Params"
                                            {
                                                "UNIT" 
                                                {
                                                    "type" "FIELD_OBJECT"
                                                    "value" "%UNIT"
                                                }
                                            }
                                        }
                                    }
                                }
                            }
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
