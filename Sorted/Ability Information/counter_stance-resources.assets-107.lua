"counter_stance"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"
    "Icon" "CounterStrike"

     "AbilitySpecial"
    {
       
    }

    "Modifiers"
    {
        "modifier_counter_stance_provider"
        {
         "Passive" "1"


           "OnTurnStarted"
            {
               "RemoveModifier"
                {
                    "ModifierName"    "modifier_counter_stance"
                    "Target"         "%TARGET"
                }
            }

            "OnTurnFinished" 
            {
               "ApplyModifier"
                {
                    "ModifierName"    "modifier_counter_stance"
                    "Target"         "%TARGET"
                }
            }
        }

        "modifier_counter_stance"
        {
            "Passive" "1"
            "ModifierTag"    "counter"

            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "hasTags(hitTags(%HIT), #MELEE, #TARGETED) && matchesTeam(unitGroup(%ATTACKER), unitGroup(%ATTACKED), @TeamFilter(TEAM_ENEMY))"
                    "Actions" 
                    {
                        "QueueAttackUnit"
                        {
                            "Target" "%TARGET"
                            "AttackTarget" "%ATTACKER"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "modifier_counter_stance"
                            "Target"         "%TARGET"
                        }
                    }
                }
            }
        }
    }
}

