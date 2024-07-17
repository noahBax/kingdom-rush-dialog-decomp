"bravebark_seismic_pound"
{
    "AbilityBehavior"               "POINT_TARGET | AOE | NEEDS_CLEAR_LINE_OF_SIGHT_EXCEPT_UNITS"
    "AnimationID"                   "SpellCastC"
    "Icon"                          "SeismicPound" 
    "CastFXId"                      "BravebarkSeismicPoundCastFXMega"

    "AbilityAOETeamFilter"          "TEAM_ENEMY"
    "AbilityAOERange"               "%distanceToTravel"
    "AbilityAOEKind"                "RANGE_TUNNEL"
    "AbilityAOEWidth"               "1"
    "AbilityAOECenterOnCaster"      "1"
    "AbilityAOEAffectsCaster"       "0"
    "AbilityCastRange"              "%distanceToTravel"
    "AbilityCooldown"               "3"
    "AbilityPreWarm"                "2"
    "AbilityAPCost"                 "2"
   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "03"
        {
            "var_type"              "FIELD_FLOAT"
            "distanceToTravel"      "5"
        }

        "04"
        {
            "var_type"              "FIELD_FLOAT"
            "rootDuration"          "2"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damageTrue"
        }
    }

    "OnAbilityAction"
    {
        "ActOnHexas"
        {
            "Kind"              "RANGE_TUNNEL"
            "Origin"            "unitHex(%SOURCE)"
            "End"               "positionHex(%TARGET)"
            "Range"             "%distanceToTravel"
            "MinRange"          "1"
            "Random"            "0"
            "IteratorName"      "#hexa"
            "IteratorIndexName" "#hexaIndex"

            "Actions"
            {
                "Delay"
                {
                    "Time"          "%hexaIndex * 1/6"

                    "Actions"
                    {
                        "StartLogicTick"
                        {
                            "Time"          "(%hexaIndex + 1) * 1/5"
                            "TickType"      "FX"
                            "Position"      "hexPosition(%hexa)"
                        }

                        "AttachEffect"
                        {
                            "EffectName"    "BravebarkSeismicPoundFXMega"
                            "Target"        "hexPosition(%hexa)"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"       "hexPosition(%hexa)"
                                "Radius"       "0"
                                "Teams"        "TEAM_ENEMY"
                            }

                            "IteratorName" "#newTarget"
                        
                            "Actions"    
                            {
                                "Hit"
                                {
                                    "Target"            "%newTarget"
                                    "EffectName"        "BravebarkSeismicPoundHitFXMega" 
                                    "Tags"              "stringList(#TARGETED, #CANTBEBLOCKED)"

                                    "InitActions"
                                    {
                                        "AddDamage"
                                        {
                                            "Type"          "DAMAGE_TRUE"
                                            "Damage"        "expr(%damage)"
                                        }

                                        "Conditional"
                                        {
                                            "Condition" "isOnState(%HITTARGET, #WEAKENED)"
                                            "Actions" 
                                            {
                                                "MarkHitLegendary"
                                                {
                                                }
                                            }
                                        }
                                    }

                                    "Actions"
                                    {
                                        "Conditional"
                                        {
                                            "Condition" "hitIsLegendary(%HIT)"
                                            "Actions" 
                                            {
                                                "ApplyModifier"
                                                {
                                                    "ModifierName"      "modifier_rooted"
                                                    "Target"            "%HITTARGET"
                                                    "Duration"          "%rootDuration"
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
        }
    }
}
