






"dummy_spawner"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | POSITIVE_EFFECT"
    "AbilityCastRange" "5"
    "AbilityCooldown"      "0"
    "AbilityPrewarmCooldown" "1"
    "AbilityAPCost"       "0"


    "AnimationID"   "SpellCastB"
    "CastFXId" "GenericNaturaCastSummonFXMega"
    "Icon" "SummonVerdantDefender"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration" "5"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "characterLevel" "1"
        }

    }


     "OnAbilityAction"
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
            "Position" "%TARGET"
            "UnitGroup" "unitGroup(%CASTER)"
            "IsAI" "0"
            "OnSpawn"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "acid_floor_tile_modifier"
                    "Target"         "%UNIT"
                    "Duration"  "%duration"
                    "InheritsInitiative" "1"

                    "Params"
                    {
                        "damage" {
                            "type" "FIELD_FLOAT"
                            "value" "10"
                        }
                    }
                }

            }
        }

        "AttachEffect"
        {
            "EffectName" "GenericNaturaSummonFXMega"
            "Target" "%TARGET"
        }
    }
}




"fire_floor_ability"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | POSITIVE_EFFECT"
    "AbilityCastRange" "5"
    "AbilityCooldown"      "0"
    "AbilityPrewarmCooldown" "1"
    "AbilityAPCost"       "0"


    "AnimationID"   "SpellCastB"
    "CastFXId" "GenericNaturaCastSummonFXMega"
    "Icon" "SummonVerdantDefender"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration" "5"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "characterLevel" "1"
        }

    }


     "OnAbilityAction"
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
            "Position" "%TARGET"
            "UnitGroup" "unitGroup(%CASTER)"
            "IsAI" "0"
            "InheritsInitiative" "1"
            "OnSpawn"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "fire_floor_tile_modifier"
                    "Target"         "%UNIT"
                    "Duration"  "%duration"
                    "Params"
                    {
                        "damage" {
                            "type" "FIELD_FLOAT"
                            "value" "10"
                        }
                    }
                }

            }
        }

        "AttachEffect"
        {
            "EffectName" "GenericNaturaSummonFXMega"
            "Target" "%TARGET"
        }
    }
}
