"bravebark_branchbat"
{
    "AbilityBehavior"           "MELEE"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"           "0"
    "AbilityAPCost"             "1"
    "AnimationID"               "Attack"
    "Icon"                      "Branchbat"
    "CastFXId"                  "BravebarkBranchbatCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"
            "mainDamage"        "stat(%CASTER,#attackDamage)"
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"
            "sideDamage"        "stat(%CASTER,#level)"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "epicDamage"        "2"
        }
        
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }

    "OnCustomTargeting"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "hexPosition(hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), -1))"
                "Radius"            "0"
                "Teams"             "TEAM_ENEMY"
                "ExcludedUnits"     "objectList(%SOURCE)"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit"          "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"                "hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), -1)"
            "Range"                 "0"
            "IteratorName"          "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa"          "%hexa"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "hexPosition(hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), 1))"
                "Radius"            "0"
                "Teams"             "TEAM_ENEMY"
                "ExcludedUnits"     "objectList(%SOURCE)"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit"          "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"                "hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), 1)"
            "Range"                 "0"
            "IteratorName"          "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa"          "%hexa"
                }
            }
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "BravebarkBranchbatHitFXMega" 
            "Tags"                  "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "Conditional"
                {
                    "Condition" "isOnState(%HITSOURCE, #ROOTED)"
                    "Actions" 
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%mainDamage) + %epicDamage"
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
                            "Damage"        "expr(%mainDamage)"
                        }
                    }
                }
            }

            "Actions"
            {
                "Knockback" 
                {
                    "Target"        "%HITTARGET"
                    "Center"        "unitPosition(%HITSOURCE)"
                    "Strength"      "1"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "hexPosition(hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), -1))"
                "Radius"                "0"
                "Teams"                 "TEAM_ENEMY"
                "ExcludedUnits"         "objectList(%SOURCE)"
            }

            "IteratorName"              "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "BravebarkBranchbatHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%HITSOURCE, #ROOTED)"
                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "expr(%sideDamage) + %epicDamage"
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
                                    "Damage"        "expr(%sideDamage)"
                                }
                            }
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target"        "%HITTARGET"
                            "Center"        "unitPosition(%HITSOURCE)"
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
                "Center"                "hexPosition(hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), 1))"
                "Radius"                "0"
                "Teams"                 "TEAM_ENEMY"
                "ExcludedUnits"         "objectList(%SOURCE)"
            }

            "IteratorName"              "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "BravebarkBranchbatHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%HITSOURCE, #ROOTED)"
                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "expr(%sideDamage) + %epicDamage"
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
                                    "Damage"        "expr(%sideDamage)"
                                }
                            }
                        }
                    }
                    
                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target"        "%HITTARGET"
                            "Center"        "unitPosition(%HITSOURCE)"
                            "Strength"      "1"
                        }
                    }
                }
            }
        }
    }
}
