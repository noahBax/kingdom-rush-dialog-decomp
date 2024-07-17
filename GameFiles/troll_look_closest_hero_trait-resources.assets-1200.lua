"troll_look_closest_hero_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "troll_look_at_hero_modifier"
        {
            "Passive" "1"
            "OnTurnFinished"
            {
                "Conditional"
                {
                    "Condition" "not(isOnState(%TARGET, #STUNNED)) && not(isOnState(%TARGET, #DEAD)) && not(isOnState(%TARGET, #DISABLED))"
                    "Actions"
                    {   
                        "CallFunction"
                        {
                            "Function"          "Ironhide.Legends.Content.Abilities.ClosestTargetPreferNoFlip"
                            "Source"            "%TARGET"
                            "UnitFilter" 
                            {
                                "Source"        "%TARGET"
                                "Center"        "%TARGET"
                                "Radius"        "1000"
                                "Teams"         "TEAM_ENEMY"
                                "CustomFilter"  "customUnitFilter(#theUnit, not(isOnState(%theUnit, #NO_SKULL)))"
                            }
                            "UnitName" "#closestTarget"
                            "Actions"
                            {
                                "LookAt"
                                {
                                    "Target" "%TARGET"
                                    "LookAt" "unitPosition(%closestTarget)"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

