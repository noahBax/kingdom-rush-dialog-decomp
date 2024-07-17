






"troll_breaker_battering_ram"
{
    
    
    "AbilityBehavior"   "POINT_TARGET | AOE | NEEDS_CLEAR_TERRAIN | NEEDS_CLEAR_LINE_OF_SIGHT_EXCEPT_UNITS"

    "AnimationID"   "SpellCastB"
    "CastFXId" "TrollBreakerBatteringRamCastFXMega"
    "Icon" "BatteringRam" 

    "AbilityAOETeamFilter" "TEAM_ALL"
    "AbilityAOERange" "0"

    "AbilityAOEKind" "RANGE_TUNNEL"
    "AbilityAOEWidth" "expr(%width)"

    "AbilityAOECenterOnCaster" "1"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "expr(%distanceToTravel)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "2"


   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
           
            "distanceToTravel"  "4"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "width"  "1"
        }

        "04"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"                "3"
        }
    }

    "OnAbilityAction" 
    {
        "CreateObjectList"
        {
            "Name" "#hitUnits"
        }

        "TrackingProjectile"
        {
            "MoveSpeed"             "%projectile_speed"
            "Model"                 "TrollBreakerBatterinRamProjectile"
            "TargetPos"             "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE)"

            "TargetFilter"
            {
                "Radius"     "0"
                "Teams"     "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
                "Width" "expr(%width)"
                "Kind" "RANGE_TUNNEL"
            }

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%damage)"
                }
            }

            
        }

        "AttachEffect"
        {
            "EffectName" "TrollBreakerBatterinRamPuffFXMega"
            "Target" "unitPosition(%SOURCE)"
            "Flipped" "unitIsFlipped(%SOURCE)"
        }

        "ActOnHexas"
        {
            "Kind"              "RANGE_TUNNEL"
            "Origin"            "unitHex(%SOURCE)"
            "End"               "positionHex(%TARGET)"
            "MinRange"          "1"
            "Range"             "hexDistance(unitHex(%SOURCE), positionHex(%TARGET))"
            "Random"            "0"
            "IteratorName"      "#hexa"
            "IteratorIndexName" "#hexaIndex"

            "Actions"
            {
                "Delay"
                {
                    "Time"          "0 + (%hexaIndex * 0.05)"

                    "Actions"
                    {
                        "AttachEffect"
                        {
                            "EffectName" "TrollBreakerBatterinRamPuffFXMega"
                            "Target" "hexPosition(%hexa)"
                            "Flipped" "unitIsFlipped(%SOURCE)"
                        }
                    }
                }
            }
        }

        "ApplyModifier"
        {
            "ModifierName"    "disable_unit_modifier"
            "Target"         "%SOURCE"
        }

        "MoveUnit"
        {
            "Target"        "%SOURCE"
            "Position"      "%TARGET"
        }

    }

    "OnProjectileHitUnit" 
    {

        "Hit"
        {
            "Target" "%TARGET"
            "Tags" "stringList(#MELEE, #AOE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {

                "Conditional"
                {
                    "Condition" "not(isOnState(%TARGET, #FIXED_POSITION)) && not(isOnState(%HITTARGET, #DEAD))"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"    "disable_unit_modifier"
                            "Target"         "%TARGET"
                        }

                        "MoveUnit"
                        {
                            "Target"        "%TARGET"
                            "Position"    "newPoint(1000, 1000, 0)"
                        }

                        "AddObjectToList" 
                        {
                            "List" "%hitUnits"
                            "Value" "%TARGET"
                        }
                    }
                }
            }
        }

        "KeepProjectileGoing"
        {

        }
    }

    "OnProjectileDestinationReached" 
    {
        "RemoveModifier"
        {
            "ModifierName"    "disable_unit_modifier"
            "Target"         "%SOURCE"
        }

        "EachInList"
        {
            "List" "%hitUnits"
            "IteratorName" "#unit"
            "IteratorIndexName" "#unitIndex"
            "Actions"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"          "%unit"
                }

                "ActOnHexas"
                {
                    "Center" "positionHex(%TARGET)"
                    "Range" "1"
                    "IteratorName" "#hexa"
                    "Max" "1"
                    "Random" "1"
                    "RequireEmpty" "1"
                    
                    "Actions"
                    {
                        "MoveUnit"
                        {
                            "Target"        "%unit"
                            "Position"      "hexPosition(%hexa)"
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
                "affects several units"
                {
                    "Curve" "Logistic|500|5|-4|0.05"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_ENEMY"
                    }
                }

                "there are enought free hexes arround the end point to move the affected units"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "NumberOfFreeHexesAroundHex"
                    "Params"
                    {
                        "Max" "numberOfUnitsAffected(%SOURCE, #TEAM_ENEMY)"
                    }
                }

                "Is not rooted"
                {
                    "Curve" "Linear|-1|1000|1|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#IMMOBILIZED"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
