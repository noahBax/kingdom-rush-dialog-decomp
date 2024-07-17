"wbf_iriza_summon_clones"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "CastClones"
    "Icon" "mirage"
    "AbilityShowDetailFilter" "isOnState(%CASTER, #PHASE1)"

    "AbilityCastRange" "0"
    "AbilityCooldown"     "1"
    "AbilityAPCost"       "1"


    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "copies"         "stat(%CASTER, #clones)"
        }
    }

    "OnAbilityAction"
    {
        "ActOnHexas"
        {
            
            "Center"  "positionHex(cinematicPosition(#CenterPos))"
            "Range"             "6"
            "IteratorName"      "#hexa"
            "IteratorIndexName" "#hexaIndex"
            "RequireEmpty" "1"
            "Max" "expr(%copies) + 1"
            "Random" "1"

            "Actions"    
            {
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"    "hexPosition(%hexa)"
                        "Radius"    "0"
                        "Teams"     "TEAM_ALL"
                        "Flags"     "INCLUDE_NON_TARGETABLE"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "RemoveModifier"
                        {
                            "ModifierTag"    "floor_effect"
                            "Target"         "%newTarget"
                        }
                    }
                }

               "Conditional"
                {
                    "Condition" "%hexaIndex == 0"

                    "Actions" 
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatWBF_clonesCast"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"  "wbf_iriza_glare_bolt_charging_modifier"
                            "Target"        "%TARGET"
                        }

                        "MoveUnit"
                        {
                            "Target"        "%TARGET"
                            "Position"    "hexPosition(%hexa)"
                        }

                        "LookAt"
                        {
                            "Target" "%TARGET"
                            "IsFlipped" "randomBetween(0, 1) > 0.5"
                        }

                        "Delay"
                        {
                            "Time" "0"
                            "Actions"
                            { 
                                "Lua"
                                {
                                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.HandleAnimationEvent('AbilityEnd') end"
                                }

                                "#Lua"
                                {
                                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.PlayIdleAnimation() end"
                                }

                                "PlayActivityAnimation"
                                {
                                    "Target" "%TARGET"
                                    "Animation" "CloneSpawn"
                                }
                            }
                        }
                    }

                    "ElseActions" 
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#WBFIrizaClone"
                            "Position" "hexPosition(%hexa)"
                            "UnitGroup" "@UnitGroup(BadSide)"

                            "IsAI" "1"
                            "Nick" "#IrizaClone"
                            "AddToInitiativeOrder" "0"
                            "IsFlipped" "randomBetween(0, 1) > 0.5"
                            
                            "OnSpawn"
                            {
                                "SetStat"
                                {
                                    "Target" "%UNIT"
                                    "Stat" "#health_max"
                                    "Value" "stat(%TARGET, #health_max)"
                                }

                                "SetStat"
                                {
                                    "Target" "%UNIT"
                                    "Stat" "#armor_max"
                                    "Value" "stat(%TARGET, #armor_max)"
                                }

                                "SetStat"
                                {
                                    "Target" "%UNIT"
                                    "Stat" "#health"
                                    "Value" "stat(%TARGET, #health)"
                                }

                                "SetStat"
                                {
                                    "Target" "%UNIT"
                                    "Stat" "#armor"
                                    "Value" "stat(%TARGET, #armor)"
                                }

                                "PlayActivityAnimation"
                                {
                                    "Target" "%UNIT"
                                    "Animation" "CloneSpawn"
                                }

                                "AttachEffect"
                                {
                                    "EffectName" "WBFTeleportLandFXMega" 
                                    "Target" "unitPosition(%UNIT)"
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
            "Weight" "300"
            "Considerations"
            {
                "isnotcharging"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#CHARGING_BOLT"
                        "Owner" "1"
                    }
                }

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }

                "phase1"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#PHASE1"
                        "Owner" "0"
                    }
                }
            }
        }
    }
}

