"demon_lord_nethershield"
{
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityAOECustomTargetFilter" "not(isOnState(%UNIT, #PROP))"

    "AnimationID"   "SpellCastA"
    "CastFXId" "DemonLordNethershieldCastFXMega"
    "Icon" "NetherShield"

    "AbilityAOETeamFilter" "TEAM_FRIENDLY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"


    "AbilityCastRange"      "0"
    "AbilityCooldown"       "2"
    "AbilityAPCost"         "1"

     "AbilitySpecial"
    {

        "01"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "2"
        }


        "02"
        {
            "var_type" "FIELD_INTEGER"
            "duration" "2"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "armorBonus" "4"
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
                "CustomFilter"  "customUnitFilter(#theUnit, not(isOnState(%theUnit, #PROP)))"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierName"    "demon_lord_nethershield_modifier"
                    "Target"         "%newTarget"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "demon_lord_nethershield_modifier"
                    "Target"         "%newTarget"
                    "Duration"      "%duration"

                    "Params" 
                    {
                        "extraArmor" 
                        {
                            "type" "FIELD_FLOAT"
                            "value" "expr(%armorBonus)"
                        }
                    }
                }
            }
        }
    }

     "Modifiers"
    {
        "demon_lord_nethershield_modifier"
        {
            "Icon" "NetherShield"
            "IconPriority" "25"

            "EffectName" "DemonLordNethershieldStatusFXMega"

            "OnAdded"
            {
                "GiveArmor"
                {
                    "Target" "%TARGET"
                    "ArmorAmount" "%extraArmor"
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
                "armor_max" "%extraArmor"
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
