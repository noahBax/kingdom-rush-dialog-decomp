"bravebark_springsap_trait"
{
    "AbilityBehavior"       "PASSIVE"
    "Icon" "Springsap"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "heal"                "2"
        }

        "02"
        {
            "var_type"            "FIELD_FLOAT"
            "healEpic"            "1"
        }
        "03"
        {
            "var_type"            "FIELD_EXPRESSION"
            "threshold"            "stat(%CASTER, #health_max)-(ceil(stat(%CASTER, #health_max)/4))"
        }
    }

    "Modifiers"
    {
        "bravebark_springsap_trait_modifier"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
                "Conditional"
                {
                    
                    "Condition" "stat(%TARGET, #health) < stat(%TARGET, #health_max)-(ceil(stat(%TARGET, #health_max)/4))"
                    "Actions" 
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%TARGET, #ROOTED)"
                            "Actions" 
                            {
                                "Heal"
                                {
                                    "Target"        "%TARGET"
                                    "HealAmount"    "%heal + %healEpic"
                                }

                                "AttachEffect"
                                {
                                    "EffectName"    "HealingFXMega"
                                    "Target"        "%TARGET"
                                }

                                "HitLegendaryTriggered"
                                {
                                    "Unit"              "%TARGET"
                                }
                            }

                            "ElseActions"
                            {
                                "Heal"
                                {
                                    "Target"        "%TARGET"
                                    "HealAmount"    "%heal"
                                }

                                "AttachEffect"
                                {
                                    "EffectName"    "HealingFXMega"
                                    "Target"        "%TARGET"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
