"gerald_rally"
{
    "AbilityBehavior"               "UNIT_TARGET | AOE | POSITIVE_EFFECT"
    "AbilityTeamFilter"             "TEAM_FRIENDLY"
    "AnimationID"                   "SpellCastA"
    "CastFXId"                      "GeraldRallyCastFXMega"
    "Icon"                          "RallyV2"

    "AbilityAOETeamFilter"          "TEAM_FRIENDLY"
    "AbilityAOERange"               "%aoeRadius"
    "AbilityAOEKind"                "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"      "1"
    "AbilityAOEAffectsCaster"       "1"
    "AbilityCastRange"              "0"
    "AbilityCooldown"               "3"
    "AbilityAPCost"                 "1"


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
            "aoeRadius"         "2"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "extraSpeed"        "1"
        }
    }


    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "%TARGET"
                "Radius"            "%aoeRadius"
                "Teams"             "TEAM_FRIENDLY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_gerald_rally"
                    "Target"            "%newTarget"
                    "Duration"          "%duration"
                }

                "RemoveModifier"
                {
                    "ModifierTag"    "dot"
                    "Target"         "%newTarget"
                }

                "RemoveModifier"
                {
                    "ModifierTag"    "status_effect"
                    "Target"         "%newTarget"
                }
            }

        }
    }

    "Modifiers"
    {
        "modifier_gerald_rally"
        {
            "EffectName"                "GeraldRallyStatusFXMega"
            "Icon"                      "Rally"
            "IconPriority"              "50"

            "PropertiesAdd"
            {
                "walkSpeed"             "%extraSpeed"
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

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }
}
