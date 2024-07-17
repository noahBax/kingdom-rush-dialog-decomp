"wbf_beameye_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    "AbilityCastRange" "0"
    "AbilityCastMinRange" "0" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "Attack"
    "CastFXId" "WBFBeamEyeAttackFXMega"
    "Icon" "ocular_beam" 

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #rayDamage)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "rayRange"  "stat(%CASTER, #rayRange)"
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, #Chest)"
            "TargetPos"             "hexPosition(hexInLine(unitHex(%CASTER), hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), (unitIsFlipped(%TARGET) ? 1 : -1)), expr(%rayRange)))"
            "Model" "BeamEyesRayProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type" "FIELD_FLOAT"
                    "value" "expr(%damage)"
                }

                "sourceHex"
                {
                    "type" "FIELD_OBJECT"
                    "value" "unitHex(%CASTER)"
                }

                "targetHex"
                {
                    "type" "FIELD_OBJECT"
                    "value" "hexInLine(unitHex(%CASTER), hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), (unitIsFlipped(%TARGET) ? 1 : -1)), expr(%rayRange))"
                }
            }
        }
    }

    "OnProjectileDestinationReached" 
    {
        "ActOnTargets"
        {
            "Target"
            {
                "SourcePos" "hexPosition(%sourceHex)"
                "Center"      "hexPosition(%targetHex)"
                "Radius"     "0"
                "Teams"     "TEAM_ALL"
                "ReferenceTeam" "unitGroup(%SOURCE)"
                "ExcludedUnits"     "objectList(%SOURCE)"
                "Width"             "1"
                "Kind"              "RANGE_TUNNEL"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "ArcaneTowerSuperBeamHitFXMega" 
                    "Tags" "stringList(#AOE, #MAGICAL)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_MAGICAL"
                            "Damage"        "%damage"
                        }
                    }
                }
            }
        }

        "KillUnit"
        {
            "Target"        "%SOURCE"
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "100"
            "Considerations"
            {
                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }
}
