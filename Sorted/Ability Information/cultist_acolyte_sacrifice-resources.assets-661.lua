"cultist_acolyte_sacrifice"
{
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "Transform"
    "CastFXId" "CultistSacrificeAcolyteCastFXMega"
    "Icon" "DarkSacrifice"

    "AbilityCastRange" "0"
    "AbilityCooldown"     "2"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {
       "01"
        {
            "var_type" "FIELD_FLOAT"
            "healthValue"  "1"
        }
    }

    "OnAbilityAction"
    {
        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#sourcePosition"
            "Value" "unitPosition(%TARGET)"
            "Type" "FIELD_OBJECT"
        }

        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#isFlipped"
            "Value" "unitIsFlipped(%TARGET)"
            "Type" "FIELD_FLOAT"
        }

        "StartLogicTick"
        {
            "Time" "1.5"
            "TickType" "ActiveUnit "
            "Position" "unitPosition(%TARGET)"
        }

        "SetState"
        {
            "Target"    "%TARGET"
            "State"     "#NO_SKULL"
            "Value"     "1"
        }

        "KillUnit"
        {
            "Target"        "%TARGET"
            "InstaKill" "1"
        }

       "SpawnUnit"
        {
            "UnitName" "unitConfigString(%TARGET, #cultistSacrificeUnit)"
            "Position" "%sourcePosition"
            "UnitGroup" "unitGroup(%CASTER)"
            "IsAI" "1"
            "IsFlipped" "%isFlipped"
            "AddToInitiativeOrder" "1"
            "OnSpawn"
            {
            }
        }

        "AttachEffect"
        {
            "EffectName" "unitConfigString(%TARGET, #cultistSacrificeFX)"
            "Target" "%sourcePosition"
        }
    }


    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "300"
            "Considerations"
            {
                "Has 1 remaining health"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "CurrentHealth"
                    "Params"
                    {
                        "Health" "%healthValue"  
                    }
                }
            }
        }
    }
}
