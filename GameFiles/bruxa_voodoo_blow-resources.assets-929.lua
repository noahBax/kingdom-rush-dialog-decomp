"bruxa_voodoo_blow"
{
    "AbilityBehavior"       "MELEE"
    "AbilityTeamFilter"     "TEAM_ENEMY"
    "AbilityCastRange"      "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"       "3"
    "AbilityAPCost"         "1"
    "AnimationID"           "VoodooKiss"
    "Icon"                  "VoodooBlow"
    "CastFXId"              "BruxaVoodooBlowCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"                      "FIELD_EXPRESSION"
            "epicDamage"                    "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "02"
        {
            "var_type"                      "FIELD_FLOAT"        
            "sleepingDuration"              "3"
        }

        "03"
        {
            "var_type"                      "FIELD_FLOAT"        
            "sleepingDurationAdjacents"     "2"
        }
    }

    "OnCustomTargeting"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"        "hexPosition(hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), -1))"
                "Radius"        "0"
                "Teams"         "TEAM_ENEMY"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit" "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center" "hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), -1)"
            "Range" "0"
            "IteratorName" "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa" "%hexa"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "hexPosition(hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), 1))"
                "Radius"     "0"
                "Teams"     "TEAM_ENEMY"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit" "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center" "hexNeighbour(%DESTINATIONHEXA, unitHex(%TARGET), 1)"
            "Range" "0"
            "IteratorName" "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa" "%hexa"
                }
            }
        }
    }


    "OnAbilityAction"
    {
         "Times"
        {
            "Times"             "3"
            "IteratorName"      "#index"

            "Actions"
            {
                "ActOnHexas"
                {
                    "Center"        "hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), %index - 1)"
                    "Range"         "0"
                    "IteratorName"  "#hexa"
                    "RequireEmpty"  "0"
                    "Max" "1"
                    
                    "Actions"    
                    {
                        "Conditional"
                        {
                            "Condition" "%index == 1"

                            "Actions" 
                            {
                                "AttachEffect"
                                {
                                    "EffectName"    "BruxaVoodooBlowFXMega"
                                    "Target"        "hexPosition(%hexa)"
                                }
                            }
                            "ElseActions" 
                            {
                                "AttachEffect"
                                {
                                    "EffectName"    "BruxaVoodooBlowSmallFXMega"
                                    "Target"        "hexPosition(%hexa)"
                                }
                            }
                        }
                    }
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"        "hexPosition(hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), %index - 1))"
                        "Radius"        "0"
                        "Teams"         "TEAM_ENEMY"
                        "ExcludedUnits" "objectList(%SOURCE)"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Hit"
                        {
                            "Target"                "%newTarget"
                            "Tags"                  "stringList(#MAGICAL, #TARGETED)"

                            "InitActions"
                            {
                                "Conditional"
                                {
                                    "Condition" "isOnState(%HITTARGET, #IMMOBILIZED)"

                                    "Actions" 
                                    {
                                        "AddDamage"
                                        {
                                            "Type"          "DAMAGE_MAGICAL"
                                            "Damage"        "expr(%epicDamage)"
                                        }  

                                        "MarkHitLegendary"
                                        {
                                        }     
                                    }
                                }
                            }

                            "Actions"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"  "modifier_asleep"
                                    "Target"        "%HITTARGET"
                                    "Duration"      "equal(%index, 1) ? %sleepingDuration : %sleepingDurationAdjacents"
                                    "Refresh"       "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
