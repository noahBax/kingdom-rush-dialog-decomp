"wbf_iriza_one_hit_shield_trait"
{
    "AbilityBehavior"       "UNIT_TARGET | PASSIVE"
    
    "Icon" "tainted_manifestation" 

    "AbilitySpecial"
    {
       
    }



    "Modifiers"
    {
        "wbf_iriza_one_hit_shield_trait_modifier"
        {
           "Passive" "1"

            "OnPreHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && hasTags(hitTags(%HIT), #REFLECTED)"
                    "Actions" 
                    {
                        "CancelHit"
                        {

                        }
                    }
                }
            }

            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT)"

                    "Actions" 
                    {

                        "Conditional"
                        {
                            "Condition" "not(isOnState(%TARGET, #DISABLED))"

                            "Actions" 
                            {
                                "Conditional"
                                {
                                    "Condition" "isOnState(%TARGET, #PHASE1)"

                                    "Actions" 
                                    {
                                        "SpawnUnit"
                                        {
                                            "UnitName" "#IrizaTeleportTarget"
                                            "Position" "cinematicPosition(#IrizaRespawnPos)"
                                            "UnitGroup" "unitGroup(%TARGET)"
                                            "IsAI" "0"
                                            "AddToInitiativeOrder" "1"
                                            "Nick" "#TeleportTarget"
                                            "IsFlipped" "1"
                                            "OnSpawn"
                                            {
                                            }
                                        }
                                    }
                                }

                                "PlayActivityAnimation"
                                {
                                    "Target" "%TARGET"
                                    "Animation" "TakeDamage"
                                    "Events" 
                                    {
                                        "AbilityEnd"
                                        {
                                            "ApplyModifier"
                                            {
                                                "ModifierName"    "wbf_iriza_gone_modidfier"
                                                "Target"         "%TARGET"
                                            }
                                        }
                                    }
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"    "disable_unit_modifier"
                                    "Target"         "%TARGET"
                                }
                            }
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "wbf_iriza_glare_bolt_charging_modifier"
                            "Target"         "%TARGET"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"      "%TARGET"
                                "Radius"     "999"
                                "Teams"     "TEAM_ALL"
                            }

                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "RemoveModifier"
                                {
                                    "ModifierName"    "wbf_iriza_clone_hithandler_trait_modifier"
                                    "Target"         "%newTarget"
                                } 
                            }
                        }  
                    }
                } 
            }
        }
    }
}

