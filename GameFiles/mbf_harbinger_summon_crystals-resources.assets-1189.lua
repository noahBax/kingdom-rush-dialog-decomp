"mbf_harbinger_summon_crystals"
{
    "AbilityBehavior"   ""
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityCastRange" "0"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID" "SpellCastA"
    "CastFXId" "MBFHarbingerCastFXMega"
    "Icon" "RaiseGlareCrystals"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "crystals"            "3" 
        }
    }

    "OnAbilityAction"
    {
        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.MBFHarbingerCrystalSummonTargets"

            "HeroFilter" 
            {
                "Center"      "%SOURCE"
                "Radius"     "1000"
                "Teams"     "TEAM_ENEMY"
            }

            "MainHexa" "unitHex(%SOURCE)"
            "MainHexaPrioDistance" "3"
            "MaxDistance" "5"

            "IteratorName" "#hexa"
            "IteratorCountName" "#hexaCount"
            "IteratorIndexName" "#index"

            "Actions"
            {
                "Delay"
                {
                    "Time" "0.3 * %index"
                    "Actions"
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#MBFCrystalMinion"
                            "Position" "hexPosition(%hexa)"
                            "UnitGroup" "unitGroup(%SOURCE)"
                            "IsAI" "1"
                            "AddToInitiativeOrder" "1"

                            "OnSpawn"
                            {
                                "PlayActivityAnimation"
                                {
                                    "Target" "%UNIT"
                                    "Animation" "Spawn"
                                }

                                "AttachEffect"
                                {
                                    "EffectName" "MBFCrystalSummonFXMega"
                                    "Target" "%UNIT"
                                }
                            }
                        }
                    }
                }
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
                "is second action"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "1"
                        "Stat" "#actionsTaken"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
