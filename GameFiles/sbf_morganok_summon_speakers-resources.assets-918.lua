"sbf_morganok_summon_speakers"
{
  "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "sbf_morganok_summon_speakers_controller"
        {
            "Passive" "1"

            "OnAdded"
            {
                "Delay"
                {
                    "Time" "0"
                    "Actions"
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#SBFSpeakerMor"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#SBFSpeakerGa"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#SBFSpeakerNok"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#SBFEyesMor"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#SBFEyesGa"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                            }
                        }

                        "SpawnUnit"
                        {
                            "UnitName" "#SBFEyesNok"
                            "Position" "unitPosition(%TARGET)"
                            "UnitGroup" "unitGroup(%TARGET)"
                            "IsAI" "1"
                            "OnSpawn"
                            {
                            }
                        }
                    }
                }
            }
        }
    }
}
