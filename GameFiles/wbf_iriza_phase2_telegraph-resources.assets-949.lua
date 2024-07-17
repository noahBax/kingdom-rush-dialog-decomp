"wbf_iriza_phase2_telegraph"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    
    "AnimationID"   "NOANIMATION"

    "AbilityCastRange" "0"
    "AbilityCooldown"   "1"
    "AbilityAPCost"     "1"

   
    "AbilitySpecial" 
    {
    }

    "OnAbilityAction"
    { 
        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.WBFIrizaTeleportTarget"

            "HeroFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "MainHexa" "unitHex(%SOURCE)"
            "MinDistance" "3"

            "TargetHexaName" "#hexa"

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

                "SpawnUnit"
                {
                    "UnitName" "#IrizaTeleportTargetWithVisual"
                    "Position" "hexPosition(%hexa)"
                    "UnitGroup" "@UnitGroup(BadSide)"

                    "IsAI" "1"
                    "Nick" "#TeleportTarget"
                    "AddToInitiativeOrder" "1"
                    "IsFlipped" "randomBetween(0, 1) > 0.5"
                    
                    "OnSpawn"
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%SOURCE, #PHASE3)"
                            "Actions" 
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"  "wbf_iriza_phase3_telegraph_fxmodifier"
                                    "Target"        "%UNIT"
                                }
                            }

                            "ElseActions"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"  "wbf_iriza_phase2_telegraph_fxmodifier"
                                    "Target"        "%UNIT"
                                }
                            }
                        }
                    }
                }
            }
        }

        "Conditional"
        {
            "Condition" "isOnState(%TARGET, #PHASE3)"
            "Actions" 
            {
                "ApplyModifier"
                {
                    "ModifierName"  "wbf_iriza_phase3_attack_charging_modifier"
                    "Target"        "%CASTER"
                }
            }

            "ElseActions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "wbf_iriza_phase2_attack_charging_modifier"
                    "Target"        "%CASTER"
                }
            }
        }
    }

    "Modifiers"
    {
        "wbf_iriza_phase2_telegraph_fxmodifier"
        {
            "EffectName" "WBFIrizaTelegraphPhase2FXMega"
        }

         "wbf_iriza_phase3_telegraph_fxmodifier"
        {
            "EffectName" "WBFIrizaTelegraphPhase3FXMega"
        }
    }


    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "500"
            "Considerations"
            {
                "#isnotcharging"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#CHARGING_PHASE2_ATTACK"
                        "Owner" "1"
                    }
                }

                "enabled"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#WITHTELEGRAPH"
                        "Owner" "1"
                    }
                }
            }
        }
    }


}
