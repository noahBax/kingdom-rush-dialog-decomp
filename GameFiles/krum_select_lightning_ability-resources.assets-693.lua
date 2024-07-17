"krum_select_lightning_ability"
{
    "AbilityBehavior"   ""
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    "AbilityCastRange" "0"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID" "Attack"

    "AbilitySpecial" 
    {
    }

    "OnAbilityAction"
    {
        "SetStat"
        {
            "Target" "%SOURCE"
            "Stat" "#startedTurn"
            "Value" "0"
        }

        "SetStat"
        {
            "Target" "%SOURCE"
            "Stat" "#assignedTargets"
            "Value" "1"
        }

        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.KrumSelectTargets"
            "Rays" "stat(%SOURCE, #cantRays)"

            "UnitFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName" "#hexa"
            "IteratorCountName" "#hexaCount"

            "Actions"
            {
                "SetStat"
                {
                    "Target" "%SOURCE"
                    "Stat" "#cantTargets"
                    "Value" "%hexaCount"
                }

                "SpawnUnit"
                {
                    "UnitName" "#DummyUnit"
                    "Position" "hexPosition(%hexa)"
                    "UnitGroup" "unitGroup(%SOURCE)"
                    "IsAI" "0"
                    "AddToInitiativeOrder" "1"
                    "OnSpawn"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"    "krum_targets_modifier"
                            "Target"         "%UNIT"
                            "Duration"  "0"
                        }
                    }
                }
            }
            
        }
    }

    "Modifiers"
    {
        "krum_targets_modifier"
        {
            "EffectName" "KrumLightningStrikeTelegrafFXMega"

            "OnUnitEnteredNode"
            {
               "AreaControl"
               {

                    "Center" "unitHex(%TARGET)"
                    "Range" "0"
                    "From" "%from"
                    "To" "%to"
                    "EnterActions"
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatKrum_telegraphStatic"
                        }
                    }
               }
            }

            "OnTurnStartedGlobal"
            {
               "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%TARGET"
                        "Radius"     "0"
                        "Teams"     "TEAM_ALL"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatKrum_telegraphStatic"
                        }
                    }
                }
            }

            "States"
            {
                "krumTarget" "1"
                "NO_LIFEBAR" "1"
                "NO_SKULL" "1"
            }
        }
    }




    "OnThink"
    {
        "RunThisSkillAI"
        {
            "BrainId" "#Custom"
            "Target" "%UNIT"
        }
    }

    "AIBrainCustom"
    {
        "Selection" 
        {
            "Weight" "10"
            "Considerations"
            {
                "is second or third"
                {
                    "Curve" "Linear|0.5|1|0.5|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "Min" "1"
                        "Max" "2"
                        "Stat" "#actionsTaken"
                        "Owner" "1"
                    }
                }

                "shouldSelect"
                {
                    "Curve" "Linear|20|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "0"
                        "Stat" "#assignedTargets"
                        "Owner" "1"
                    }
                }

                "cantTeleport"
                {
                    "Curve" "Linear|20|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "0"
                        "Stat" "#canTeleport"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
