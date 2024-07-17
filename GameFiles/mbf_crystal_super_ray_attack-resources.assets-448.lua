"mbf_crystal_super_ray_attack"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityCastRange" "0"
    "AbilityCastMinRange" "0" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "Attack"
    "CastFXId" "MBFCrystalSuperAttackCastFXMega"
    "Icon" "GlareBeam" 

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "3"
        }
        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "spread"  "3" 
        }
    }


    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatMBF_redCrystalSuperRay"
        }

        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, #Chest)"
            "TargetPos"             "pointAdd(unitPosition(%SOURCE, #Chest), newPoint(3.5, 0, 0))"
            "Model" "ArcaneTowerSuperBeamRayProjectile"

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
                    "value" "positionHex(pointAdd(unitPosition(%SOURCE), newPoint(3.5, 0, 0)))"
                }
            }
        }

        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, #Chest)"
            "TargetPos"             "pointAdd(unitPosition(%SOURCE, #Chest), newPoint(-3.5, 0, 0))"
            "Model" "ArcaneTowerSuperBeamRayProjectile"

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
                    "value" "unitHex(%SOURCE)"
                }

                "targetHex"
                {
                    "type" "FIELD_OBJECT"
                    "value" "positionHex(pointAdd(unitPosition(%SOURCE), newPoint(-3.5, 0, 0)))"
                }
            }
        }
    }

    "OnProjectileDestinationReached" 
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatMBF_redCrystalSuperRayHit"
        }

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
                    "Tags" "stringList(#AOE, #MAGICAL, #GLARE_SUPER_RAY, #GLARE_TOWER_OR_CRYSTAL)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_TRUE"
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
            "Weight" "0"
            "Considerations"
            {
                "AlwaysTrue"
                {
                    "Curve"             "Linear|1|0|0|0"
                    "Consideration"     "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName"  "modifier_hex_blast"  
                    }
                }
            }
        }
    }
}
