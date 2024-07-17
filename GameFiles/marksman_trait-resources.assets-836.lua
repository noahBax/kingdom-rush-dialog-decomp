"marksman_trait"
{
    "AbilityBehavior"       "PASSIVE"

     "AbilitySpecial"
    {
       
    }

    "Modifiers"
    {
        "marksman_trait_provider"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "marksman_trait_bonus_modifier"
                    "Target"         "%TARGET"
                    "Duration" "1"
                }
            }

            "OnUnitLeavingNode"
            {
                "Conditional"
                {
                    "Condition" "equal(%TARGET, %UNIT)"

                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "marksman_trait_bonus_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }
        }

        "marksman_trait_bonus_modifier"
        {

            

            "PropertiesAdd"
            {
                "rangedAttackRange" "1"
                "extraDamage" "1"
            }
        }
    }
}
