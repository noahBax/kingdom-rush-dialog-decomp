"wbf_iriza_phase2_attack"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | NEGATIVE_EFFECT | AOE | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "Attack2"
    "CastFXId" "WBFIrizaGlareWaveCastFXMega"
    "Icon" "glare_wave"
    "AbilityShowDetailFilter" "isOnState(%CASTER, #PHASE2)"
   
    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"

    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "1"
    "AbilityAPCost"       "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #phase2_damage)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "2"
        }

         "03"
        {
            "var_type" "FIELD_INTEGER"
            "tentacles"  "5" 
        }
        "04"
        {
            "var_type" "FIELD_FLOAT"
            "timeBetweenSummons"  "0.2" 
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierName"    "wbf_iriza_phase2_attack_charging_modifier"
            "Target"         "%SOURCE"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ENEMY"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "WBFIrizaGlareWaveHitFXMega" 
                    "Tags" "stringList(#AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_MAGICAL"
                            "Damage"        "expr(%damage)"
                        }
                        
                    }
                }
            }
        }
        
        "ActOnHexas"
        {
            "Center" "unitHex(%TARGET)"
            "Range" "%aoeRadius"
            "IteratorName" "#hexa"
            "IteratorIndexName" "#index"
            "RequireEmpty" "1"
            "Max" "%tentacles"
            "Random" "1"
            
            "Actions"    
            {
                "Delay"
                {
                    "Time" "%timeBetweenSummons * %index" 
                    "Actions"
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#CultistDarkTentacle"
                            "Position" "hexPosition(%hexa)"
                            "UnitGroup" "@UnitGroup(BadSide)"

                            "IsAI" "1"
                            "Nick" "#IrizaDarkTentacle"
                            "AddToInitiativeOrder" "1"
                            "OnSpawn"
                            {
                                "PlayActivityAnimation"
                                {
                                    "Target" "%UNIT"
                                    "Animation" "Born"
                                }
                               
                               "LookAt"
                                {
                                    "Target" "%UNIT"
                                    "LookAt" "unitPosition(%TARGET)"
                                }

                                "SetState"
                                {
                                    "Target"    "%UNIT"
                                    "State"     "#DIES_WITH_IRIZA"
                                    "Value"     "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    "Modifiers"
    {
        "wbf_iriza_phase2_attack_charging_modifier"
        {
            
            "Tags" "iriza_charging"
            
            "States"
            {
                "CHARGING_PHASE2_ATTACK" "1"
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "4"
            "Considerations"
            {
                "#ischarging"
                {
                    "Curve" "Linear|1|1|0|0"
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
                        "State" "#PHASE2"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
