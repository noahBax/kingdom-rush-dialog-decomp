






"sasquatch_abominable_growl"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | NEGATIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_ALL"

    "AnimationID"   "SpellCastB"
    "CastFXId" "AbominableGrowlCastFXMega"
    "Icon" "AbominableGrowl"

    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "1"
    "AbilityAOEAffectsCaster" "0"


    "AbilityCastRange" "0"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "2"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "1"
        }

        "03" 
        {
           "var_type" "FIELD_EXPRESSION"
            "stunDuration" "1"
        }
    }


    "OnAbilityAction"
    {
        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#sourcePosition"
            "Value" "unitPosition(%SOURCE)"
            "Type" "FIELD_OBJECT"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%CASTER"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ENEMY"
                "MinRadius" "1"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {

                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "StunHitFXMega" 
                    "Tags" "stringList(#AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%damage)"
                        }
                        
                    }

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_stunned"
                            "Target"        "%HITTARGET"
                            "Duration"      "expr(%stunDuration)"
                            "Refresh"   "1"
                        }

                        
                    }
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
                    "Curve" "Logistic|500|5|-4|0.05"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_ENEMY"
                    }
                }
            }
        }
    }
}
