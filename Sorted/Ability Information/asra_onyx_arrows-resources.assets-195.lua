






"asra_onyx_arrows"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET "
    "AbilityCastRange" "2"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCooldown"   "4"
    "AbilityAPCost"     "2"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "OnyxArrowsCastFXMega"
    "Icon" "PointBlankBarrage" 

   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damagePerArrow"  "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "02"
        {
            "var_type" "FIELD_INTEGER"
            "arrows"  "3" 
            
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "timeBetweenArrows"  "0.2" 
            
        }

        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "totalDamage"  "expr(%damagePerArrow) * %arrows"
        }
    }


    "OnAbilityAction" 
    {
    	"Times"
    	{
    		"Times" "%arrows"
    		"IteratorName" "#index"
    		"Actions"
    		{
    			"Delay"
    			{
    				"Time" "%timeBetweenArrows * %index" 
    				"Actions"
    				{
    					"TrackingProjectile"
				        {

 			 

				            "Target"               "%TARGET"
				            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            				"TargetPos"             "unitPosition(%TARGET, #Chest)"
				            "Model" "OnyxArrowsProjectile"
 
				            "Params" 
				            {
				                "damage" 
				                {
				                    "type" "FIELD_FLOAT" 
				                    "value" "expr(%damagePerArrow)"
				                }

                                "startPosition"
                                {
                                    "type" "FIELD_OBJECT"
                                    "value" "unitPosition(%SOURCE)"
                                }

                                "index"
                                {
                                    "type" "FIELD_FLOAT" 
                                    "value" "%index"
                                }

                                "lastArrow"
                                {
                                    "type" "FIELD_FLOAT" 
                                    "value" "safeEquals(%index, %arrows - 1)"
                                }
				            }
				        }


    				}
    			}
    		}
    	}
    }

    "OnProjectileHitUnit" 
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "ArrowOfSorrowHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"            "DAMAGE_PHYSICAL" 
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {
                "Conditional"
                {
                    "Condition" "%lastArrow"
                    "Actions" 
                    {
                        "Knockback"
                        {
                            "Target" "%HITTARGET"
                            "Center" "%startPosition"
                            "Strength" "1"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "modifier_rooted"
                            "Target"         "%TARGET"
                            "Duration"      "1"
                        }
                    }
                }
            }
        }
    }
}
