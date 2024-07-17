






"dodge_trait"
{
    
    
   "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"
   "Icon" "Dodge"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "dodgeChance" "round(max(min(stat(%CASTER, #evasion) * 100, 100), 0))"
        }
    } 


    "Modifiers"
    {
        "modifier_dodge_trait"
        {
        	"Passive" "1"

            "OnPreHit"
            {
            	"Conditional"
                {
                    "Condition" "hitConnected(%HIT) && (randomBetween(0, 1) < (stat(%TARGET, #evasion))) && hasTags(hitTags(%HIT), #MELEE, #TARGETED) && not(isOnState(%TARGET, #IMMOBILIZED)) && not(hasTags(hitTags(%HIT), #CANTBEDODGED))"
                    "Actions" 
                    {
		                "CancelHit"
		                {

		                }

		                "LookAt"
		                {
		                	"Target" "%TARGET"
		                	"LookAt" "unitPosition(%ATTACKER)"
		                }

		                "PlayActivityAnimation"
                        {
                            "Target" "%TARGET"
                            "Animation" "Dodge"
                        }

                        "UnitRaiseMessage"
                        {
                            "Unit" "%TARGET"
                            
                            "Icon" "Dodge"
                        }

                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatGeneric_dodge"
                        }
		            }
		        }
            }
        }
    }
}
