"bravebark_natures_wrath"
{
    "AbilityBehavior"           "POINT_TARGET | NEEDS_CLEAR_TERRAIN"
    "AbilityTeamFilter"         "TEAM_ALL"
    
    "AnimationID"               "SpellCastA"
    "CastFXId"                  "BravebarkNaturesWrathCastFXMega"
    "Icon"                      "NaturesWrath" 

    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "1"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "extraHexes"  "2"
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
            "UnitName"                  "#Thorns"
            "Position"                  "%TARGET"
            "UnitGroup"                 "unitGroup(%CASTER)"
            "IsAI"                      "1"

            "OnSpawn"
            {
                "AttachEffect"
                {
                    "EffectName"        "BravebarkNaturesWrathSpawnThornsFXMega" 
                    "Target"            "%UNIT"
                }

                "ApplyModifier"
                {
                    "ModifierName"     "bravebark_natures_wrath_modifier"
                    "Target"           "%UNIT"
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
                    "UnitName"                  "#Thorns"
                    "Position"                  "hexPosition(%hexa)"
                    "UnitGroup"                 "unitGroup(%CASTER)"
                    "IsAI"                      "1"

                    "OnSpawn"
                    {
                        "AttachEffect"
                        {
                            "EffectName"        "BravebarkNaturesWrathSpawnThornsFXMega" 
                            "Target"            "%UNIT"
                        }
                
                        "ApplyModifier"
                        {
                            "ModifierName"     "bravebark_natures_wrath_modifier"
                            "Target"           "%UNIT"
                        }
                    }
                }   
            }
        }
    }

    "Modifiers"
    {
        "bravebark_natures_wrath_modifier"
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
}
