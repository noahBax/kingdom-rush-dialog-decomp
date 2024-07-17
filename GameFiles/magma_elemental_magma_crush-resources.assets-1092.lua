"magma_elemental_magma_crush"
{
    "AbilityBehavior"       "MELEE"
    "AbilityTeamFilter"     "TEAM_ENEMY"
    "AbilityCastRange"      "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"       "0"
    "AbilityAPCost"         "1"
    "AnimationID"           "Attack"
    "Icon"                  "MagmaCrush"
    "CastFXId"              "MagmaElementalCrushCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"            "FIELD_EXPRESSION"
            "damage"              "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type"            "FIELD_EXPRESSION"
            "splashDamage"        "floor(stat(%CASTER, #attackDamage)/2)"
        }
    }

    "OnCustomTargeting"
    {
        "EachInList"
        {
            "List" "objectList(hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, -2),
                               hexNeighbour(unitHex(%TARGET), %DESTINATIONHEXA, 2))"
            "IteratorName" "#hexIterator"
            "Actions"
            {   
                "AddAsAffected"
                {
                    "Hexa" "%hexIterator"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"            "hexPosition(%hexIterator)"
                        "Radius"            "0"
                        "Teams"             "TEAM_ENEMY"
                        "ExcludedUnits"     "objectList(%SOURCE)"
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
            }
        }
    }


    "OnAbilityAction"
    {   
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatOloch_burningClawFlame"
        }

        "EachInList"
        {
            "List"                  "objectList(hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), 0),
                                                hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), -2),
                                                hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), 2))"
            "IteratorName"          "#hexIterator"
            "IteratorIndexName"     "#index"
            "Actions"
            {
                "AttachEffect"
                {
                    "EffectName"    "MagmaElementalCrushHitFXMega"
                    "Target"        "hexPosition(%hexIterator)"
                }
     
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"        "hexPosition(%hexIterator)"
                        "Radius"        "0"
                        "Teams"         "TEAM_ENEMY"
                    }
                    "IteratorName" "#newTarget"
                    "Actions"    
                    {
                        "Hit"
                        {
                            "Target"                "%newTarget"
                            "Tags"                  "stringList(#MELEE)"
                            "InitActions"
                            {
                                "Conditional"
                                {
                                    "Condition"     "%index == 0"

                                    "Actions" 
                                    {
                                        "AddDamage"
                                        {
                                            "Type"          "DAMAGE_PHYSICAL"
                                            "Damage"        "expr(%damage)"
                                        }
                                    }

                                    "ElseActions" 
                                    {
                                        "AddDamage"
                                        {
                                            "Type"          "DAMAGE_PHYSICAL"
                                            "Damage"        "expr(%splashDamage)"
                                        }
                                    }
                                }
                            }
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

                "surrounded by several units"
                {
                    "Curve" "Logistic|500|5|-4|-0.1"
                    "Consideration" "UnitsSurrounding"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_ENEMY"
                        "Range" "1"
                    }
                }
            }
        }
    }
}
