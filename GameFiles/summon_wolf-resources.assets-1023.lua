






"summon_wolf"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | POSITIVE_EFFECT | NEEDS_CLEAR_TERRAIN"
    "AbilityCastRange" "3"
    "AbilityCooldown"      "4"
    "AbilityPrewarmCooldown" "1"
    "AbilityAPCost"       "2"


    "AnimationID"   "SpellCastB"
    "CastFXId" "GenericNaturaCastSummonFXMega"
    "Icon" "SummonVerdantDefender"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration" "3"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "characterLevel" "1"
        }

    }


     "OnAbilityAction"
    { 
        "SpawnUnit"
        {
            "UnitName" "#WulfEnt"
            "Position" "%TARGET"
            "UnitGroup" "unitGroup(%CASTER)"
            "IsAI" "0"
            "AddToInitiativeOrder" "0"
            "OnSpawn"
            {
                "PlayActivityAnimation"
                {
                    "Target" "%UNIT"
                    "Animation" "Spawn"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "modifier_summon_wolf"
                    "Target"         "%UNIT"
                    "Duration"  "%duration"
                }

            }

                

        }

         "AttachEffect"
        {
            "EffectName" "GenericNaturaSummonFXMega"
            "Target" "%TARGET"
        }
    }


    "Modifiers"
    {
        "modifier_summon_wolf"
        {
            "Icon"                      "Summoned"
            "IconPriority"              "60"
            "LocalizationId"            "generic_modifier_summoned"

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
