"arenaDiversifier_orcish_forge_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_INTEGER"
            "extra_armor"           "3"
        }
    }

    "Modifiers"
    {
        "arenaDiversifier_orcish_forge_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#orcish_forge)"

                    "Actions" 
                    {
                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"        "%TARGET"
                                "Radius"        "9999"
                                "Teams"         "TEAM_ALL"
                                "CustomFilter"  "customUnitFilter(#theUnit, matchesGroup(unitGroup(%theUnit), @UnitGroup(BadSide)) && not(isOnState(%theUnit, #PROP)))"
                            }
                            "IteratorName" "#newTarget"
                            "Actions"    
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"    "orcish_forge_extra_armor_modifier"
                                    "Target"          "%newTarget"
                                }
                            }
                        }
                    }

                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "arenaDiversifier_orcish_forge_modifier"
                            "Target"          "%TARGET"
                        }
                    }
                }
            }
        }

        "orcish_forge_extra_armor_modifier"
        {
            "PropertiesAdd"
            {
                "armor_max"             "%extra_armor"
            }

            "OnAdded"
            {
                "GiveArmor"
                {
                    "Target"            "%TARGET"
                    "ArmorAmount"       "%extra_armor"
                }
            }
        }
    }
}

