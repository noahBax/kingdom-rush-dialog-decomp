"sbf_aspect_teleport_with_target"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    
    "AbilityCastRange" "999"
    "AbilityCooldown"     "1"
    "AbilityAPCost"       "1"

    "AnimationID"   "TeleportOut"
    
    


   
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

        "PlaySound"
        {
            "Unit" "%SOURCE"
            "Sound" "#teleportOut"
        }
    }

    "OnAbilityAction"
    { 
        "SetStat"
        {
            "Target" "%CASTER"
            "Stat" "#canTeleport"
            "Value" "0"
        }

        "SetStat" 
        {
            "Target" "%CASTER"
            "Stat" "#already_attacked"
            "Value" "1"
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
            "Position" "unitPosition(%TARGET)"
        }

        "Delay"
        {
            "Time" "2"
            "Actions"
            {
                "MoveUnit"
                {
                    "Target"      "%SOURCE"
                    "Position"    "unitPosition(%TARGET)"
                }

                "PlayActivityAnimation"
                {
                    "Target" "%SOURCE"
                    "Animation" "TeleportIn"
                }

                "PlaySound"
                {
                    "Unit" "%SOURCE"
                    "Sound" "#teleportIn"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"         "%SOURCE"
                }

                "LookAt"
                {
                    "Target" "%CASTER"
                    "IsFlipped" "unitIsFlipped(%TARGET)"
                }

                "Conditional"
                {
                    "Condition" "isOnState(%CASTER, #SBF_ASPECT_MAGIC)"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "sbf_aspect_magic_telegraph_fx_modifier"
                            "Target"        "%CASTER"
                        }
                    }
                }

                "KillUnit"
                {
                    "Target"        "%TARGET"
                    "InstaKill" "1"
                }
            }
        }
    }

    "Modifiers"
    {
        "sbf_aspect_magic_telegraph_fx_modifier"
        {
            "EffectName" "SBFMagicTelegraphFXMega"
        }
    }




    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "999"
            "Considerations"
            {
                "isTarget"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#SBF_TELEPORT_TARGET"
                        "Owner" "0"
                    }
                }
            }
        }
    }
}


  
