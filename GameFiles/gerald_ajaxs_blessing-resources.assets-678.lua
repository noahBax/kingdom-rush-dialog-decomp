"gerald_ajaxs_blessing"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"
    "Icon" "Aura_of_Sol"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "reduction"  "-1"
        }
       
    }

    "Modifiers"
    {
        "gerald_ajaxs_blessing_modifier"
        {
            "Passive" "1"
            "EffectName" "AjaxsBlessingAuraFXMega"

            "OnHitPreProcessDamagesGlobal"
            {
                "Conditional"
                {
                    "Condition" "matchesTeam(unitGroup(%TARGET), unitGroup(%ATTACKED), @TeamFilter(TEAM_FRIENDLY)) && safeEquals(hexDistance(unitHex(%ATTACKED), unitHex(%TARGET)), 1) && not(hasTags(hitTags(%HIT), #INTERNAL)) && not(isOnState(%TARGET, #STUNNED) || isOnState(%TARGET, #ASLEEP) || isOnState(%TARGET, #FROZEN))"

                    "Actions" 
                    {

                        "AddDamage"
                        {
                            "Type"            "DAMAGE_PHYSICAL"
                            "Damage"        "%reduction"
                        }

                        "AttachEffect"
                        {
                            "EffectName" "AjaxsBlessingShieldFXMega"
                            "Target" "%ATTACKED"
                        }  

                        "AttachEffect"
                        {
                            "EffectName" "AjaxsBlessingActivatesFXMega"
                            "Target" "%TARGET"
                        }  

                        
                    }
                }
            }
        }
    }
}

