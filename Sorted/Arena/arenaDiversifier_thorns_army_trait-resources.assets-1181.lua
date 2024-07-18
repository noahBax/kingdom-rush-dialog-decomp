"arenaDiversifier_thorns_army_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {

       "01"
        {
            "var_type"              "FIELD_FLOAT"
            "damage"                "1"
        }
    }

    "Modifiers"
    {
        "arenaDiversifier_thorns_army_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#thorns_army)"

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
                                    "ModifierName"    "darkknight_armor_of_thorns_trait_modifier"
                                    "Target"          "%newTarget"
                                }
                            }
                        }
                    }

                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "arenaDiversifier_thorns_army_modifier"
                            "Target"          "%TARGET"
                        }
                    }
                }
                
            }

            "OnUnitSpawnedGlobal"
            {
                "Conditional"
                {
                    "Condition" "matchesGroup(unitGroup(%UNIT), @UnitGroup(BadSide)) && not(isOnState(%UNIT, #PROP))"

                    "Actions" 
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"    "darkknight_armor_of_thorns_trait_modifier"
                            "Target"          "%UNIT"
                        }
                    }
                }
            }
        }
    }
}

