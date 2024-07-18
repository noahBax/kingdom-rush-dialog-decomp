"yeti_smash"
{
    
    
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    
    "AnimationID"   "Attack"
    "Icon" "YetiSmash"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "MinDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "MaxDamage"  "stat(%CASTER, #attackDamage)+1"
        }

         "05"
        {
            "var_type"          "FIELD_EXPRESSION"
            "splashDamage"      "ceil(stat(%CASTER,#attackDamage)/2)"
        }
    }

    "OnCustomTargeting"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"        "hexPosition(hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -2))"
                "Radius"        "0"
                "Teams"         "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName"      "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit"      "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"            "hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -2)"
            "Range"             "0"
            "IteratorName"      "#hexa"
        
            "Actions"
            {
                "AddAsAffected"
                {
                    "Hexa"      "%hexa"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"        "hexPosition(hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -3))"
                "Radius"        "0"
                "Teams"         "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName"      "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit"      "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"            "hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -3)"
            "Range"             "0"
            "IteratorName"      "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa"      "%hexa"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"        "hexPosition(hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -4))"
                "Radius"        "0"
                "Teams"         "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName"      "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit"      "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"            "hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -4)"
            "Range"             "0"
            "IteratorName"      "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa"      "%hexa"
                }
            }
        }
    }

    "OnAbilityAction"
    {

        "Hit"
        {
            "Target"            "%TARGET"
            "EffectName"        "GenericHitFXMega" 
            "Tags"              "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "Conditional"
                {
                    "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%TARGET), @TeamFilter(TEAM_ENEMY))" 
                    "Actions"   
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
                        }
                    }
                    "ElseActions"   
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "1"
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

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "hexPosition(hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), -2))"
                "ExcludedUnits"     "objectList(%SOURCE,%TARGET)"
                "Radius"            "0"
                "Teams"             "TEAM_ALL"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "GenericHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%newTarget), @TeamFilter(TEAM_ENEMY))" 
                            "Actions"   
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "expr(%splashDamage)"
                                }
                            }
                            "ElseActions"   
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "1"
                                }
                            }
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%TARGET)"
                            "Strength" "1"
                        }
                    }
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "hexPosition(hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), -3))"
                "ExcludedUnits"     "objectList(%SOURCE,%TARGET)"
                "Radius"            "0"
                "Teams"             "TEAM_ALL"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "GenericHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%newTarget), @TeamFilter(TEAM_ENEMY))" 
                            "Actions"   
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "expr(%splashDamage)"
                                }
                            }
                            "ElseActions"   
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "1"
                                }
                            }
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target"        "%HITTARGET"
                            "Center"        "unitPosition(%TARGET)"
                            "Strength"      "1"
                        }
                    }
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "hexPosition(hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), -4))"
                "ExcludedUnits"     "objectList(%SOURCE,%TARGET)"
                "Radius"            "0"
                "Teams"             "TEAM_ALL"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "GenericHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%newTarget), @TeamFilter(TEAM_ENEMY))" 
                            "Actions"   
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "expr(%splashDamage)"
                                }
                            }
                            "ElseActions"   
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "1"
                                }
                            }
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target"        "%HITTARGET"
                            "Center"        "unitPosition(%TARGET)"
                            "Strength"      "1"
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
            "Weight" "2.3"
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
