"mbf_harbinger_teleport"
{
    
    
    "AbilityBehavior"   ""
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "TeleportOut"
    "CastFXId" "MBFHarbingerCastFXMega"

    "AbilityCastRange" "0"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "0"
    "Icon" "TeleportHarbinger"


   
    "AbilitySpecial" 
    {
       
    }

    "OnAbilityStart"
    {
        "StartLogicTick"
        {
            "Time" "1.1"
            "TickType" "PriorityCenter"
            "Position" "unitPosition(%SOURCE)"
        }
    }

    "OnAbilityAction"
    { 
        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.MBFHarbingerTeleportTarget"

            "HeroFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "MainHexa" "unitHex(%SOURCE)"

            "TargetHexaName" "#hexa"

            "Actions"
            {

                "AttachEffect"
                {
                    "EffectName" "MBFTeleportFXMega" 
                    "Target" "unitPosition(%SOURCE)"
                }

                "SetToContext"
                {
                    "Context" "currentContext()"
                    "Key" "#sourcePosition"
                    "Value" "unitPosition(%SOURCE)"
                    "Type" "FIELD_OBJECT"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"         "%SOURCE"
                }

                "MoveUnit"
                {
                    "Target"        "%SOURCE"
                    "Position"    "newPoint(1000, 1000, 0)"
                }

                "StartLogicTick"
                {
                    "Time" "3.5"
                    "TickType" "PriorityCenter"
                    "Position" "hexPosition(%hexa)"
                }

                "Delay"
                {
                    "Time" "2"
                    "Actions"
                    {
                        "AttachEffect"
                        {
                            "EffectName" "MBFTeleportLandFXMega" 
                            "Target" "hexPosition(%hexa)"
                        }

                        "MoveUnit"
                        {
                            "Target"      "%SOURCE"
                            "Position"    "hexPosition(%hexa)"
                        }

                        "PlayActivityAnimation"
                        {
                            "Target" "%SOURCE"
                            "Animation" "TeleportIn"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "disable_unit_modifier"
                            "Target"         "%SOURCE"
                        }

                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"      "%CASTER"
                                "Radius"      "1000"
                                "Teams"       "TEAM_ENEMY"
                            }

                            "IteratorName" "#targetToLookAt"
                        
                            "Actions"
                            {
                                "Conditional"
                                {
                                    "Condition" "isOnState(%targetToLookAt, #HERO)"

                                    "Actions"
                                    {
                                        "LookAt"
                                        {
                                            "Target" "%CASTER"
                                            "LookAt" "unitPosition(%targetToLookAt)"
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
            "Weight" "10"
            "Considerations"
            {
                "is first action"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "0"
                        "Stat" "#actionsTaken"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}


  
