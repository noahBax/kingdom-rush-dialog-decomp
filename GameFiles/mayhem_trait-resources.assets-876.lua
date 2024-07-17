"mayhem_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "Icon" "Mayhem"

    "AbilitySpecial"
    {
       "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeRadius"  "1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeDamage"  "3"
        }
    }

    "Modifiers"
    {
        "mayhem_trait_leave_bomb_modifier"
        {
             "Passive" "1"

             "OnRemoved"
             {
                "Conditional"
                {
                    "Condition" "isOnState(%TARGET, #DEAD)"
                    "Actions"
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#BadaboomBomb"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "@UnitGroup(OwnSide)"

                            "IsAI" "1"
                            "Nick" "#MAYHEM_BARREL"
                            "AddToInitiativeOrder" "1"
                            "TmpStates" "stringList(#NON_TARGETABLE)"
                            "TmpStatesDuration" "0.5"

                            "OnSpawn"
                            {

                                "SetStat"
                                {
                                    "Target" "%UNIT"
                                    "Stat" "#explodeDamage"
                                    "Value" "expr(%explodeDamage)"
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"    "damage_on_remove_modifier"
                                    "Target"         "%UNIT"
                                    "Duration"  "1"
                                    "Params"
                                    {

                                        "damage" {
                                            "type" "FIELD_FLOAT"
                                            "value" "1"
                                        }
                                    }
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"    "big_badaboom_alert_one_turn_remaining_modifier"
                                    "Target"         "%UNIT"
                                    "Duration"  "1"
                                    "Params"
                                    {
                                        "remaining" {
                                            "type" "FIELD_FLOAT"
                                            "value" "1"
                                        }
                                    }
                                }

                                "AttachEffect"
                                {
                                    "EffectName" "SummonRobobombFXMega"
                                    "Target" "%UNIT"
                                }
                            }
                        }  
                    }
                }
            }
        }
    }
}
