"arenaDiversifier_sols_guidance_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "arenaDiversifier_sols_guidance_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#sols_guidance)"

                    "Actions" 
                    {
                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"      "%TARGET"
                                "Radius"     "9999"
                                "Teams"     "TEAM_ALL"
                                "CustomFilter"  "customUnitFilter(#theUnit, matchesGroup(unitGroup(%theUnit), @UnitGroup(GoodSide))"
                            }


                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"    "modifier_shield_of_retribution"
                                    "Target"         "%newTarget"
                                }
                            }
                        }
                    }

                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "arenaDiversifier_sols_guidance_modifier"
                            "Target"         "%TARGET"
                        }
                    }
                }
                
            }
        }
    }
}

