"wbf_iriza_phase2_telegraph_cinematic"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    
    "AnimationID"   "Teleport"

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
                        "ApplyModifier"
                        {
                            "ModifierName"    "wbf_iriza_phase2_telegraph_fxmodifier"
                            "Target"         "%UNIT"
                            "Duration"  "0"
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
}
