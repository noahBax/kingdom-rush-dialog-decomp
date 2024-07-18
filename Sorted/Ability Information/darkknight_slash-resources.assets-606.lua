"darkknight_slash"
{
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"

    "AnimationID"   "Attack"
    "Icon" "BasicSword"
    "CastFXId" "CommonSlashSoundFXMega"

    "AbilitySpecial"
    {
        
        
        
          
            
        

        
        
          
            
        

        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #attackDamage)"
        }

        
        
          
            
        
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                
                
                  
                   
                
                "AddDamage"
                {
                    "Type"            "DAMAGE_PHYSICAL"
                    "Damage"        "expr(%damage)"
                }

                "Conditional"
                {
                   
                    

                    
                    
                        
                        
                         
                           
                        

                        
                       
                        
                    

                    "Condition" "isOnState(%HITTARGET, #WEAKENED)"

                    "Actions" 
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%HITSOURCE)"
                            "Strength" "1"
                        }

                        "MarkHitLegendary"
                        {
                        }
                    }
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "4"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }
}
