






"cleaver_whirlwind_strike"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | NEGATIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastA"
    "CastFXId" "OrcCleaverWhirlwindCastFXMega"
    "Icon" "WhirlwindStrike"

   
    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"

    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "1"
        }


        "03" 
        {
           "var_type" "FIELD_EXPRESSION"
            "minDamage" "ceil(stat(%CASTER, #attackDamage)/2)"
        }

       
        "04" 
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage" "ceil(stat(%CASTER, #attackDamage)/2) +1"
        }

        "05" 
        {
           "var_type" "FIELD_EXPRESSION"
            "burnDuration" "2"
        }
    }


    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "OrcCleaverWhirlwindHitFXMega" 
                    "Tags" "stringList(#MELEE)"

                    
                    
                      
                       
                         
                           
                       
                        
                    
                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%HITTARGET, #WEAKENED)"

                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "max(1,randomI(expr(%minDamage), expr(%maxDamage)))"
                                }

                                "MarkHitLegendary"
                                {
                                }
                            }

                            "ElseActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "max(1,randomI(expr(%minDamage), expr(%maxDamage)))"
                                }
                            }
                        }

                        
                    }

                    "Actions"
                    {
                        
                        
                          

                            
                            
                              
                                
                                  
                                    
                                    
                                    
                                

                                
                                
                                
                            

                        
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%HITSOURCE)"
                            "Strength" "1"
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

                "surrounded by several units"
                {
                    "Curve" "Logistic|500|5|-4|0.05"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_ENEMY"
                    }
                }
            }
        }
    }
}
