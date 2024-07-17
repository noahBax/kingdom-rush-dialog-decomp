"sapling_wild_roots"
{
    "AbilityBehavior"                   "UNIT_TARGET | AOE"
    "AbilityTeamFilter"                 "TEAM_FRIENDLY"
    "AnimationID"                       "SpellCastA"
    "Icon"                              "WildRoots"
    "CastFXId"                          "SaplingWildRootsCastFXMega"

    "AbilityAOETeamFilter"              "TEAM_ENEMY"
    "AbilityAOERange"                   "1"
    "AbilityAOEKind"                    "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"          "1"
    "AbilityAOEAffectsCaster"           "0"

    "AbilityCastRange"                  "0"
    "AbilityCooldown"                   "2"
    "AbilityAPCost"                     "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "rootDuration"              "1"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "area"                      "1"
        }
    }

    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "%CASTER"
                "Radius"                "1"
                "Teams"                 "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_rooted"
                    "Target"            "%newTarget"
                    "Duration"          "%rootDuration"
                    "Refresh"           "1"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"                "unitHex(%CASTER)"
            "Range"                 "1"
            "IteratorName" "#hexa"
        
            "Actions"    
            {
                "AttachEffect"
                {
                    "EffectName"                "SaplingWildRootsFloorFXMega"
                    "Target"                    "hexPosition(%hexa)"
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
                "surrounded by several units"
                {
                    "Curve"             "Logistic|500|5|-4|0.05"
                    "Consideration"     "UnitsAffected"
                    "Params"
                    {
                        "Max"           "5"  
                        "TeamFilter"    "TEAM_ENEMY"
                    }
                }
            }
        }
    }
}
