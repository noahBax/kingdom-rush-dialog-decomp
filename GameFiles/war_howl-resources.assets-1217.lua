






"war_howl"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | AOE"
    "AbilityTeamFilter" "TEAM_ALL"

    "AnimationID"   "SpellCastB"
    "CastFXId" "FireballCastFXMega"
    "Icon" "WarHowl"

    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"


    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "attackBonus" "-2"
        }

        "02"
        {
            "var_type" "FIELD_INTEGER"
            "duration" "2"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "1"
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
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierName"    "modifier_war_howl"
                    "Target"         "%newTarget"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "modifier_war_howl"
                    "Target"         "%newTarget"
                    "Duration"      "%duration"
                }
            }
        }

       
    }

    "Modifiers"
    {
        "modifier_war_howl"
        {

           "EffectName" "ShieldWallStatusFXMega"


            "PropertiesAdd"
            {
                "extraDamage" "%attackBonus"
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
