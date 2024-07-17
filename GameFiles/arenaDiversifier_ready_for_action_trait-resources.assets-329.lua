"arenaDiversifier_ready_for_action_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "cooldownReduction"     "-1"
        }
    }

    "Modifiers"
    {
        "arenaDiversifier_ready_for_action_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#ready_for_action)"

                    "Actions" 
                    {
                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"        "%TARGET"
                                "Radius"        "9999"
                                "Teams"         "TEAM_ALL"
                                "CustomFilter"  "customUnitFilter(#theUnit, matchesGroup(unitGroup(%theUnit), @UnitGroup(GoodSide) && matchesCinematicId(%theUnit, #Heroe))"
                            }
                            "IteratorName" "#newTarget"
                            "Actions"    
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"    "arenaDiversifier_ready_for_action_lowerCooldown_modifier"
                                    "Target"          "%newTarget"
                                }
                            }
                        }
                    }

                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "arenaDiversifier_ready_for_action_modifier"
                            "Target"          "%TARGET"
                        }
                    }
                }
                
            }
        }

        "arenaDiversifier_ready_for_action_lowerCooldown_modifier"
        {
            "PropertiesAdd"
            {
                "cooldownOffset" "%cooldownReduction"
            }
        }
    }
}

