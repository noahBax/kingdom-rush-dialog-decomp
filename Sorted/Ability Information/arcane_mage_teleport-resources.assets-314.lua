"arcane_mage_teleport"
{
    "AbilityBehavior"           "POINT_TARGET |  NEEDS_CLEAR_TERRAIN" 

    "AbilityAOETeamFilter"      "TEAM_ALL"

    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "2"
    "AnimationID"               "SpellCastA"
    "CastFXId"                  "ArcaneMageTeleportCastFXMega"
    "Icon"                      "Teleport"

   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"          "2"
        }
    }

    "OnAbilityAction"
    {
        "SetStat"
        {
            "Target" "%SOURCE"
            "Stat" "#actionsAvailable"
            "Value" "stat(%SOURCE, #actionsAvailable) + 1"
        }

        "SetToContext"
        {
            "Context"           "currentContext()"
            "Key"               "#sourcePosition"
            "Value"             "unitPosition(%SOURCE)"
            "Type"              "FIELD_OBJECT"
        }

        "SetToContext"
        {
            "Context"           "currentContext()"
            "Key"               "#targetPosition"
            "Value"             "%TARGET"
            "Type"              "FIELD_OBJECT"
        }

        "StartLogicTick"
        {
            "Time"              "0.5"
            "TickType"          "PriorityCenter"
            "Position"          "%targetPosition"
        }

        "MoveUnit"
        {
            "Target"            %SOURCE"
            "Position"          "newPoint(1000, 1000, 0)"
        }

        "AttachEffect"
        {
            "EffectName"        "ArcaneMageTeleportOutFXMega"
            "Target"            "%sourcePosition"
        }

        "Delay"
        {
            "Time" "0.5"
            "Actions"
            {
                "MoveUnit"
                {
                    "Target"            "%SOURCE"
                    "Position"          "%targetPosition"
                }

                "AttachEffect"
                {
                    "EffectName"        "ArcaneMageTeleportInFXMega"
                    "Target"            "%targetPosition"
                }

                "ApplyModifier"
                {
                    "ModifierName"  "arcane_mage_teleport_walk_or_act_modifier"
                    "Target"        "%SOURCE"
                    "Duration"      "1" 
                    "Refresh"       "1" 
                }
            }
        }
    }

     "Modifiers"
    {
        "arcane_mage_teleport_walk_or_act_modifier"
        {
            "States"
            {
                "WALKING_ENDS_TURN" "1"
            }
        }
    }
}
