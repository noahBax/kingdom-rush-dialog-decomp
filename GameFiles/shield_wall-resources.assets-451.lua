






"shield_wall"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastB"
    "CastFXId" "ShieldWallCastFXMega"
    "Icon" "ShieldWall"

    "AbilityAOETeamFilter" "TEAM_FRIENDLY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"


    "AbilityCastRange" "0"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "armorBonus" "4"
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
                "Teams"     "TEAM_FRIENDLY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierName"    "modifier_shield_wall"
                    "Target"         "%newTarget"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "modifier_shield_wall"
                    "Target"         "%newTarget"
                    "Duration"      "%duration"
                }
            }
        }

       
    }

    "Modifiers"
    {
        "modifier_shield_wall"
        {

           "EffectName" "ShieldWallStatusFXMega"

           "OnAdded"
           {
                "GiveArmor"
                {
                    "Target" "%TARGET"
                    "ArmorAmount" "%armorBonus"
                }
           }

           "OnRemoved"
           {
                "GiveArmor"
                {
                    "Target" "%TARGET"
                    "ArmorAmount" "0"
                }
           }
           

            "PropertiesAdd"
            {
                "armor_max" "%armorBonus"
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
                        "TeamFilter" "TEAM_FRIENDLY"
                    }
                }
            }
        }
    }
}
