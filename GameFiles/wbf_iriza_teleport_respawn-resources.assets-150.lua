"wbf_iriza_teleport_respawn"
{
    "AbilityBehavior"       "UNIT_TARGET | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    "AnimationID" "Teleport"

    "AbilityCastRange" "999"
    "AbilityCooldown"     "1"
    "AbilityAPCost"       "1"
    


    "AbilitySpecial"
    {
        
    }

    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"    "unitPosition(%TARGET)"
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

        "LookAt"
        {
            "Target" "%CASTER"
            "IsFlipped" "unitIsFlipped(%TARGET)"
        } 

        "KillUnit"
        {
            "Target"        "%TARGET"
            "InstaKill" "1"
        }

        "RemoveModifier"
        {
            "ModifierName"    "wbf_iriza_gone_modidfier"
            "Target"         "%CASTER"
        } 

        "MoveUnit"
        {
            "Target"        "%CASTER"
            "Position"    "unitPosition(%TARGET)"
        }  

        "AttachEffect"
        {
            "EffectName" "WBFTeleportLandFXMega" 
            "Target" "unitPosition(%TARGET)"
        }
    }

    "Modifiers"
    {
        "wbf_iriza_gone_modidfier"
        {
            "OnAdded"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"         "%TARGET"
                }

                
                "AttachEffect"
                {
                    "EffectName" "WBFTeleportFXMega" 
                    "Target" "unitPosition(%TARGET)"
                }

                "MoveUnit"
                {
                    "Target"        "%TARGET"
                    "Position"    "newPoint(1000, 1000, 0)"
                }  
            }

            "States"
            {
                "IRIZA_GONE" "1"
                "DISABLED" "1"
            }
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
                        "State" "#IrizaTeleportTarget"
                        "Owner" "0"
                    }
                }
            }
        }
    }
}

