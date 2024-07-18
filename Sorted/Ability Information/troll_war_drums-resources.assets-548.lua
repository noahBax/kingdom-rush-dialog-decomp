"troll_war_drums"
{
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "TrollWarDrumsCastFXMega"
    "Icon" "WarDrums"

    "AbilityAOETeamFilter" "TEAM_FRIENDLY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"

    "AbilityAOECustomTargetFilter" "isOnState(%UNIT, #TROLL)"
    "AbilityCastRange" "0"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"

     "AbilitySpecial"
    {
        "02"
        {
            "var_type" "FIELD_INTEGER"
            "duration" "2"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "2"
        }
    }


    "OnAbilityAction"
    {

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_FRIENDLY"
                "ExcludedUnits" "objectList(%CASTER)"
                "CustomFilter" "customUnitFilter(#theUnit, isOnState(%theUnit, #TROLL))"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierName"    "troll_enrage_enraged_modifier"
                    "Target"         "%newTarget"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "troll_enrage_enraged_modifier"
                    "Target"         "%newTarget"
                    "Duration"      "%duration"
                }

                "Conditional"
                {
                    "Condition" "not(isOnState(%newTarget, #STUNNED)) && not(isOnState(%newTarget, #ASLEEP)) && not(isOnState(%newTarget, #IMMOBILIZED))"
                    "Actions" 
                    {
                        "PlayActivityAnimation"
                        {
                            "Target"            "%newTarget"
                            "Animation"         "Enraged"
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
                    "Curve" "Logistic|100|5|-4|0"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "5"  
                        "Min" "2"
                        "TeamFilter" "TEAM_FRIENDLY"
                    }
                }
            }
        }
    }
}
