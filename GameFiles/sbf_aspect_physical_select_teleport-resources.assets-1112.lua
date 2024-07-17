"sbf_aspect_physical_select_teleport"
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


        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.SBFAspectPhysicalTeleportTarget"

            "HeroFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "MainHexa" "unitHex(%SOURCE)"
            "MinDistance" "3"

            "TargetHexaName" "#hexa"

            "MagicAspectFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_FRIENDLY"
                "CustomFilter" "customUnitFilter(#theUnit, isOnState(%theUnit, #SBF_ASPECT_MAGIC))"
            }

            "Actions"
            {
                "SpawnUnit"
                {
                    "UnitName" "#DummyUnit"
                    "Position" "hexPosition(%hexa)"
                    "UnitGroup" "@UnitGroup(BadSide)"

                    "IsAI" "1"
                    "Nick" "#TeleportTarget"
                    "AddToInitiativeOrder" "1"
                    "IsFlipped" "randomBetween(0, 1) > 0.5"
                    
                    "OnSpawn"
                    {
                        "SetState"
                        {
                            "Target"    "%UNIT"
                            "State"     "#SBF_TELEPORT_TARGET"
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
            "Weight" "1"
            "Considerations"
            {
                "canTeleport"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "1"
                        "Stat" "#canTeleport"
                        "Owner" "1"
                    }
                }
            }
        }
    }


}
