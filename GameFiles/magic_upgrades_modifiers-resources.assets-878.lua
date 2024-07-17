"magic_upgrades_modifiers"
{
    
    
    "AbilityBehavior"       "PASSIVE"
   
    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "upgrades_magic_manaovermatter_modifier"
        {
            "Passive" "1"
            "StayOnDeath" "1"

            "OnHitPreProcessDamagesGlobal"
            {
                "Conditional"
                {
                    "Condition" "equal(%TARGET, %ATTACKER) && not(matchesTeam(unitGroup(%TARGET), unitGroup(%ATTACKED), @TeamFilter(TEAM_FRIENDLY))) && not(hasTags(hitTags(%HIT), #INTERNAL)) && hasTags(hitTags(%HIT), #MAGICAL)"

                    "Actions" 
                    {

                        "AddDamage"
                        {
                            "Type"            "DAMAGE_ARMOR"
                            "Damage"        "1"
                        } 
                    }
                }
            }
            
        }
    }
}
