






"block_trait"
{
    
    
   "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"
    "Icon" "Block"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "blockChance" "round(max(min(stat(%CASTER, #blockChance) * 100, 100), 0))"
        }
    } 


    "Modifiers"
    {
        "modifier_block_trait"
        {
        	"Passive" "1"

            "OnPreHit"
            {
            	"Conditional"
                {
                    "Condition" "hitConnected(%HIT) && (randomBetween(0, 1) < (stat(%TARGET, #blockChance))) && not(hasTags(hitTags(%HIT), #AOE) || hasTags(hitTags(%HIT), #INTERNAL) || hasTags(hitTags(%HIT), #ENVIRONMENTAL) || hasTags(hitTags(%HIT), #MAGICAL) || hasTags(hitTags(%HIT), #CANTBEBLOCKED)||isOnState(%TARGET, #IMMOBILIZED))"
                    "Actions" 
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatGeneric_armorHit"
                        }
                                        
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

                        "PlaySound"
                        {
                            "Unit" "%TARGET"
                            "Sound" "#receiveArmorDamage"
                        }

		                "UnitRaiseMessage"
		                {
		                    "Unit" "%TARGET"
		                    
                            "Icon" "Block"
		                }
		            }
		        }
            }
        }
    }
}
