"ranger_summon_brambles"
{
    "AbilityBehavior"           "POINT_TARGET | NEEDS_CLEAR_TERRAIN"
    "AbilityTeamFilter"         "TEAM_ALL"
    
    "AnimationID"               "SpellCastB"
    "CastFXId"                  "GenericNaturaCastSummonFXMega"
    "Icon"                      "SummonBrambles00" 

    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "1"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"          "3"
        }
        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "extraBrambles"          "2" 
        }
    }

    "OnAbilityAction" 
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "%TARGET"
                "Radius"            "0"
                "Teams"             "TEAM_ALL"
                "Flags"             "INCLUDE_NON_TARGETABLE"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierTag"       "floor_effect"
                    "Target"            "%newTarget"
                }
            }
        }

        "SpawnUnit"
        {
            "UnitName"                  "#Brambles"
            "Position"                  "%TARGET"
            "UnitGroup"                 "unitGroup(%CASTER)"
            "IsAI"                      "1"

            "OnSpawn"
            {
                "#PlayActivityAnimation"
                {
                    "Target"            "%UNIT"
                    "Animation"         "Spawn"
                }

                "AttachEffect"
                {
                    "EffectName"        "SummonBramblesGroundFXMega"
                    "Target"            "%UNIT"
                }

                "ApplyModifier"
                {
                    "ModifierName"     "modifier_ranger_summon_brambles"
                    "Target"           "%UNIT"
                    "Duration"         "%duration"
                }
            }
        } 

        "ActOnHexas"
        {
            "Center"            "positionHex(%TARGET)"
            "Range"             "1"
            "RequireEmpty"      "1"
            "Max"               "2"
            "Random"            "1"
            "MinRange"          "1"
            "IteratorName"      "#hexa"
            
            "Actions"    
            {
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"            "hexPosition(%hexa)"
                        "Radius"            "0"
                        "Teams"             "TEAM_ALL"
                        "Flags"             "INCLUDE_NON_TARGETABLE"
                    }

                    "IteratorName"          "#newTarget"
                
                    "Actions"    
                    {
                        "RemoveModifier"
                        {
                            "ModifierTag"       "floor_effect"
                            "Target"            "%newTarget"
                        }
                    }
                }

                "SpawnUnit"
                {
                    "UnitName"                  "#Brambles"
                    "Position"                  "hexPosition(%hexa)"
                    "UnitGroup"                 "unitGroup(%CASTER)"
                    "IsAI"                      "1"

                    "OnSpawn"
                    {
                        "#PlayActivityAnimation"
                        {
                            "Target"            "%UNIT"
                            "Animation"         "Spawn"
                        }

                        "AttachEffect"
                        {
                            "EffectName"        "SummonBramblesGroundFXMega"
                            "Target"            "%UNIT"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"     "modifier_ranger_summon_brambles"
                            "Target"           "%UNIT"
                            "Duration"         "%duration"
                        }
                    }
                }   
            }
        }
    }

    "Modifiers"
    {
        "modifier_ranger_summon_brambles"
        {
            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"        "%TARGET"
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "2.5"
            "Considerations"
            {
                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }
            }
        }
    }
}
