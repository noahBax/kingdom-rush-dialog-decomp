"spawn_acid_on_death_trait"
{
    
    
    "AbilityBehavior"       "PASSIVE"
    "Icon" "SpawnAcidOnDeath"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration" "2"
        }
    }

    "Modifiers"
    {
        "spawn_acid_on_death_modifier"
        {
            "Passive" "1"

            "OnRemoved"
            {
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "0"
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
                    "UnitName" "#DummyUnit"
                    "Position" "unitPosition(%TARGET)"
                    "UnitGroup" "unitGroup(%TARGET)"
                    "IsAI" "0"
                    "InheritsInitiative" "1"
                    "OnSpawn"
                    {
                        "AttachEffect"
                        {
                            "EffectName" "AcidFloorExplosionFXMega"
                            "Target" "%TARGET"
                        }
        
                        "ApplyModifier"
                        {
                            "ModifierName"    "acid_floor_tile_modifier"
                            "Target"         "%UNIT"
                            "Duration"  "%duration"
                            "Params"
                            {

                                "damage" {
                                    "type" "FIELD_FLOAT"
                                    "value" "1"
                                }
                            }
                        }

                    }
                }
            }

        }
    }
}
