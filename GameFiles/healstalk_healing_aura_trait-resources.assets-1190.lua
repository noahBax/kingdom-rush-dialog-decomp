"healstalk_healing_aura_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "hpToRestore"       "1"
        }
    }

    "Modifiers"
    {
        "healstalk_healing_aura_modifier"
        {
            "EffectName"                "HealingFloorFXMega"
            "AnimationOverride"         "IdleActivated"

            "States"
            {
                "NON_TARGETABLE"        "1"
            }

            "OnAdded"
            {
                "PlayActivityAnimation"
                {
                    "Target"            "%TARGET"
                    "Animation"         "Bloom"
                }
            }

            "OnTurnFinishedGlobal"
            {
                "Conditional" 
                {
                    "Condition" "matchesTeam(unitGroup(%TARGET), unitGroup(%UNIT), @TeamFilter(TEAM_ALL)) && not(isOnState(%UNIT, #NON_TARGETABLE)) && safeEquals(hexDistance(unitHex(%TARGET), unitHex(%UNIT)), 1) && not(isOnState(%UNIT, #DEAD))"

                    "Actions"
                    {
                        "PlayActivityAnimation"
                        {
                            "Target"            "%TARGET"
                            "Animation"         "HealingAura"
                        }

                        "Heal"
                        {
                            "Target"            "%UNIT"
                            "HealAmount"        "%hpToRestore"
                        }

                        "AttachEffect"
                        {
                            "EffectName"        "HealingFXMega"
                            "Target"            "%UNIT"
                        }

                        "AttachEffect"
                        {
                            "EffectName"        "HealingFXMega"
                            "Target"            "%TARGET"
                        }
                    }
                }
            }
        }
    }
}
