"arenaDiversifier_fans_favourite_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"              "2"
        }

        "02"
        {
            "var_type"              "FIELD_FLOAT"
            "attackBonus"           "1"
        }

        "03"
        {
            "var_type"              "FIELD_FLOAT"
            "damageResistance"      "1"
        }

        "20"
        {
            "var_type"              "FIELD_STRING"
            "iconDamageType"        "damageTrue"
        }
    }

    "Modifiers"
    {
        "arenaDiversifier_fans_favourite_modifier"
        {
            "Passive" "1"

            "OnStartFight"
            {
                "Conditional"
                {
                    "Condition" "isDiversifierActive(#fans_favourite)"

                    "Actions" 
                    {
                    }

                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"    "arenaDiversifier_fans_favourite_modifier"
                            "Target"          "%TARGET"
                        }
                    }
                }
                
            }

            "OnUnitDiedGlobal"
            {
                
                "Conditional"
                {
                    "Condition" "matchesGroup(unitGroup(activeUnit()), @UnitGroup(GoodSide)) && not(matchesGroup(unitGroup(%DEAD), @UnitGroup(GoodSide))) && (isOnState(%DEAD, #FORCE_FANS_FAVOURITE) || (not(isOnState(%DEAD, #NO_SKULL)) && not(isOnState(%DEAD, #PROP))))"

                    "Actions" 
                    {
                        "Conditional"
                        {
                            "Condition" "not(isOnState(activeUnit(), #DEAD))"

                            "Actions" 
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"      "modifier_gerald_martyrs_inspiration"
                                    "Target"            "activeUnit()"
                                    "Duration"          "%duration"
                                    "Refresh"           "1"
                                }

                                "PlaySound"
                                {
                                    "Sound" "#krl_sfx_arenaCombat_diversifiers_fansFavourite"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

