"stormcloud_high_sorcerer_summon_golem"
{
    
    
    "AbilityBehavior"           "POINT_TARGET | POSITIVE_EFFECT | NEEDS_CLEAR_TERRAIN"
    "AbilityCastRange"          "4  "
    "AbilityCooldown"           "4"
    "AbilityPrewarmCooldown"    "1"
    "AbilityAPCost"             "2"

    "AnimationID"               "SpellCastB"
    "CastFXId"                  "HighSorcererSummonGolemCastFXMega"
    "Icon"                      "SummonGolem"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"          "4"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "characterLevel"    "1"
        }
    }

     "OnAbilityAction"
    { 
        "SpawnUnit"
        {
            "UnitName"                  "#Golem"
            "Position"                  "%TARGET"
            "UnitGroup"                 "unitGroup(%CASTER)"
            "IsAI"                      "isAI(%CASTER)"
            "AddToInitiativeOrder"      "0"

            "OnSpawn"
            {
                "PlayActivityAnimation"
                {
                    "Target" "%UNIT"
                    "Animation" "Summoned"
                }

                "ApplyModifier"
                {
                    "ModifierName"      "stormcloud_high_sorcerer_modifier_summon_golem"
                    "Target"            "%UNIT"
                    "Duration"          "%duration"
                }
            }
        }

         "AttachEffect"
        {
            "EffectName"                "SorceressGolemSummonFXMega"
            "Target"                    "%TARGET"
        }
    }


    "Modifiers"
    {
        "stormcloud_high_sorcerer_modifier_summon_golem"
        {
            "Icon"                      "Summoned"
            "IconPriority"              "60"
            "LocalizationId"            "generic_modifier_summoned"

            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"            "%TARGET"
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight"                    "4"
            "Considerations"
            {
                "Close to enemies"
                {
                    "Curve" "Linear|100|1|100|1"
                    "Consideration" "InfluenceMap"
                    "Params"
                    {
                        "MapId" "#CloseToEnemies"  
                        "Max" "3"
                        "Min" "0"
                    }
                }

                "Amenaza"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "InfluenceMap"
                    "Params"
                    {
                        "MapId" "#Threat"  
                        "Max" "3"
                        "Min" "0"
                    }
                }
            }
        }
    }

}
