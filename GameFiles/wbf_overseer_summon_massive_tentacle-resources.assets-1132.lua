"wbf_overseer_summon_massive_tentacle"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    
    "AnimationID"   "Attack"
    "Icon" "summon_massive_tentacles" 
    "AbilityShowDetailFilter" "stat(%CASTER, #tentacles) > 0"

    "AbilityCastRange" "0"
    "AbilityCooldown"   "1"
    "AbilityAPCost"     "1"

   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "tentacles"  "stat(%SOURCE, #tentacles)"
        }
    }


    "OnAbilityAction" 
    {

        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.WBFOverseerSelectTentacleSpawn"
            "Tentacles" "expr(%tentacles)"

            "TargetMarkerFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_FRIENDLY"
                "Flags"     "INCLUDE_NON_TARGETABLE"
                "CustomFilter"  "customUnitFilter(#theUnit, isOnState(%theUnit, #MassiveTentacleSpawnPos))"
            }

            "HeroFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName" "#unitTarget"

            "Actions"
            {
                "SpawnUnit"
                {
                    "UnitName" "#WBFMassiveTentacle"
                    "Position" "unitPosition(%unitTarget)"
                    "UnitGroup" "@UnitGroup(BadSide)"

                    "IsAI" "1"
                    "Nick" "#MassiveTentacle"
                    "AddToInitiativeOrder" "1"

                    "IsFlipped" "unitIsFlipped(%unitTarget)"
                    
                    "OnSpawn"
                    {
                        "PlayActivityAnimation"
                        {
                            "Target" "%UNIT"
                            "Animation" "Spawn"
                        }

                        "PlaySound"
                        {
                            "Sound" "#krl_sfx_combatWBF_tentacleSpawn"
                        }
                    }
                } 

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%unitTarget"
                        "Radius"     "0"
                        "Teams"     "TEAM_ALL"
                        "Flags"     "INCLUDE_NON_TARGETABLE"
                        "CustomFilter"  "customUnitFilter(#theUnit, isOnState(%theUnit, #BeamEyeSpawnPos))"
                    }

                    "IteratorName" "#eye"
                
                    "Actions"    
                    {
                        "SetState"
                        {
                            "Target"    "%eye"
                            "State"     "#BEAM_EYE_SPAWN_DISABLED"
                            "Value"     "1"
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
            "Weight" "120"
            "Considerations"
            {
                "shouldTrigger"
                {
                    "Curve" "Linear|1000|1|0|0.99"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "Min" "0"
                        "Max" "1"
                        "Stat" "#tentacles"
                        "Owner" "1"
                    }
                }
            }
        }
    }


}
