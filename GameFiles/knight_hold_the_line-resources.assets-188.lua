"knight_hold_the_line"
{
    "AbilityBehavior"               "UNIT_TARGET | AOE | POSITIVE_EFFECT"
    "AbilityTeamFilter"             "TEAM_FRIENDLY"
    "AnimationID"                   "SpellCastD"
    "CastFXId"                      "KnightHoldTheLineCastFXMega"
    "Icon"                          "HoldTheLine"

    "AbilityAOETeamFilter"          "TEAM_FRIENDLY"
    "AbilityAOERange"               "%aoeRadius"
    "AbilityAOEKind"                "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"      "1"
    "AbilityAOEAffectsCaster"       "1"
    "AbilityCastRange"              "0"
    "AbilityCooldown"               "2"
    "AbilityAPCost"                 "1"


     "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"          "2"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "extraArmor"        "4"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "aoeRadius"         "1"
        }        
    }


    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "%TARGET"
                "Radius"            "1"
                "Teams"             "TEAM_FRIENDLY"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierName"      "modifier_knight_hold_the_line"
                    "Target"            "%newTarget"
                }
                
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_knight_hold_the_line"
                    "Target"            "%newTarget"
                    "Duration"          "%duration"
                }

                "RemoveModifier"
                {
                    "ModifierName"      "modifier_asleep"
                    "Target"            "%newTarget"
                }
            }

        }
    }

    "Modifiers"
    {
        "modifier_knight_hold_the_line"
        {
            "EffectName"                "KnightHoldTheLineStatusFXMega"
            "Icon"                      "Fortify"
            "IconPriority"              "50"

            "PropertiesAdd"
            {
                "armor_max"             "%extraArmor"
            }

            "OnAdded"
            {
                "GiveArmor"
                {
                    "Target"            "%TARGET"
                    "ArmorAmount"       "%extraArmor"
                }
            }

            "OnRemoved"
            {
                "GiveArmor"
                {
                    "Target"            "%TARGET"
                    "ArmorAmount"       "0"
                }
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
