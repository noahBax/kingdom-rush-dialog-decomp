"gerald_martyrs_inspiration"
{
    "AbilityBehavior"           "UNIT_TARGET | POSITIVE_EFFECT | AOE"
    "AbilityTeamFilter"         "TEAM_FRIENDLY"
    "AbilityCastRange"          "0"
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "1"
    "AbilityAOETeamFilter"      "TEAM_FRIENDLY"
    "AbilityAOERange"           "%aoeRadius"
    "AbilityAOEKind"            "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"  "1"
    "AbilityAOEAffectsCaster"   "0"

    "AnimationID"               "SpellCastA"
    "CastFXId"                  "MartyrsInspirationCastFXMega"
    "Icon"                      "MartyrsInspiration"


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
            "damageReduction"   "-1"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "extraDamage"       "1"
        }

        "04"
        {
            "var_type"          "FIELD_FLOAT"
            "healthSpent"       "2"
        }

        "05"
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
                "ExcludedUnits"     "objectList(%SOURCE, %TARGET)"
                "Radius"            "%aoeRadius"
                "Teams"             "TEAM_FRIENDLY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_gerald_martyrs_inspiration"
                    "Target"            "%newTarget"
                    "Duration"          "%duration"
                }
            }

        }
        "AttachEffect"
        {
            "EffectName" "RuptureHitFXMega"
            "Target" "%CASTER"
        }

        "RemoveHealth"
        {
            "Target"                    "%SOURCE"
            "HealthToRemove"            "%healthSpent"
        }
    }

    "Modifiers"
    {
        "modifier_gerald_martyrs_inspiration"
        {
            "EffectName"                "MartyrsInspirationStatusFXMega"
            "Icon"                      "Martyr"
            "IconPriority"              "50"

            "OnHitPreProcessDamages"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_PHYSICAL"
                    "Damage"            "%damageReduction"
                }

                "AttachEffect"
                {
                    "EffectName"        "MartyrsInspirationShieldFXMega"
                    "Target"            "%ATTACKED"
                }
            }

            "PropertiesAdd"
            {
                "extraDamage" "%extraDamage"
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
