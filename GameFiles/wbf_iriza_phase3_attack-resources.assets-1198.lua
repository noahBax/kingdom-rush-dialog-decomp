"wbf_iriza_phase3_attack"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | NEGATIVE_EFFECT | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "Attack3"
    "CastFXId" "WBFIrizaFireWhipChargeFXMega"
    "Icon" "fire_whip"
    "AbilityShowDetailFilter" "isOnState(%CASTER, #PHASE3)"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "1"
    "AbilityAPCost"       "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #phase3_damage)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "5"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "fireDuration" "3"
        }
        "04"
        {
            "var_type" "FIELD_FLOAT"
            "attackDirections" "3" 
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierName"    "wbf_iriza_phase3_attack_charging_modifier"
            "Target"         "%SOURCE"
        }

        "CreateObjectList"
        {
            "Name" "#hexCandidates"
        }

        "ActOnHexas"
        {
            "Kind"              "RANGE_TUNNEL"
            "Origin"            "unitHex(%SOURCE)"
            "End"               "hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), 0)"
            "Range"             "%aoeRadius"
            "MinRange"          "1"
            "Random"            "0"
            "IteratorName"      "#hexa"
            "IteratorIndexName" "#hexaIndex"

            "Actions"
            {
                "AddObjectToList" 
                {
                    "List" "%hexCandidates"
                    "Value" "%hexa"
                }
            }
        }

        "ActOnHexas"
        {
            "Kind"              "RANGE_TUNNEL"
            "Origin"            "unitHex(%SOURCE)"
            "End"               "hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), 2)"
            "Range"             "%aoeRadius"
            "MinRange"          "1"
            "Random"            "0"
            "IteratorName"      "#hexa"
            "IteratorIndexName" "#hexaIndex"

            "Actions"
            {
                "AddObjectToList" 
                {
                    "List" "%hexCandidates"
                    "Value" "%hexa"
                }
            }
        }

        "ActOnHexas"
        {
            "Kind"              "RANGE_TUNNEL"
            "Origin"            "unitHex(%SOURCE)"
            "End"               "hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), -2)"
            "Range"             "%aoeRadius"
            "MinRange"          "1"
            "Random"            "0"
            "IteratorName"      "#hexa"
            "IteratorIndexName" "#hexaIndex"

            "Actions"
            {
                "AddObjectToList" 
                {
                    "List" "%hexCandidates"
                    "Value" "%hexa"
                }
            }
        }


        
        
        "SpawnUnit"
        {
            "UnitName"              "#DummyUnit"
            "Position"              "unitPosition(%TARGET)"
            "UnitGroup"             "unitGroup(%TARGET)"
            "IsAI"                  "0"
            "Nick"                  "#irizafloorcontroller"
            "InheritsInitiative"    "1"
            "OnSpawn"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "remove_another_unit_modifier"
                    "Target"            "%UNIT"
                    "Duration"          "expr(%fireDuration)"
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




        "EachInList"
        {
            "List" "%hexCandidates"
            "IteratorName" "#hexa"
            "IteratorIndexName" "#hexaIndex"
            "Actions"
            {
                "Delay"
                {
                    "Time" "(hexDistance(%hexa, unitHex(%CASTER)) * 0.2) + randomBetween(0, 0.025)"

                    "Params" 
                    {
                        "damage" 
                        { 
                            "type"              "FIELD_FLOAT"
                            "value"             "expr(%damage)"
                        }

                        "controllerUnit" 
                        { 
                            "type"              "FIELD_OBJECT"
                            "value"             "%controllerUnit"
                        }
                    }


                    "Actions"
                    {
                        "AttachEffect"
                        {
                            "EffectName"    "WBFIrizaFireWhipFXMega"
                            "Target"        "hexPosition(%hexa)"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"    "hexPosition(%hexa)"
                                "Radius"    "0"
                                "Teams"     "TEAM_ALL"
                            }

                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "Hit"
                                {
                                    "Target" "%newTarget"
                                    "Tags" "stringList(#PROJECTILE, #TARGETED, #CANTBEBLOCKED)"

                                    "InitActions"
                                    {
                                        "AddDamage"
                                        {
                                            "Type"          "DAMAGE_PHYSICAL"
                                            "Damage"        "%damage"
                                        }
                                    }
                                }
                            }
                        }

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
                            "UnitGroup"             "unitGroup(%CASTER)"
                            "IsAI"                  "0"
                            "Nick"                  "#FireballFloor"
                            "InheritsInitiative"    "1"

                            "OnSpawn"
                            {
                                "AttachEffect"
                                {
                                    "EffectName"        "BombardierNapalmShowerExplotionFXMega"
                                    "Target"            "%UNIT"
                                }

                                "SetState"
                                {
                                    "Target"    "%UNIT"
                                    "State"     "#SKIP_TURN"
                                    "Value"     "1"
                                }

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
            }
        }
    }

    "Modifiers"
    {
        "wbf_iriza_phase3_attack_charging_modifier"
        {
            
            "Tags" "iriza_charging"
            
            "States"
            {
                "CHARGING_PHASE3_ATTACK" "1"
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "4"
            "Considerations"
            {
                "#ischarging"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#CHARGING_PHASE3_ATTACK"
                        "Owner" "1"
                    }
                }

                "enabled"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#PHASE3"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
