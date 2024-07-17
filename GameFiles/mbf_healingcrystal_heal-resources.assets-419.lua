"mbf_healingcrystal_heal"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityCastRange" "1000"
    "AbilityCastMinRange" "0" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "Attack"
    "Icon" "BasicMagic" 

   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "heal"  "3"
        }
        "02"
        {
            "var_type"            "FIELD_FLOAT"
            "crystalDamage"       "5" 
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "ArcaneMageRayProjectile"

            "Params" 
            {
                "heal" 
                { 
                    "type" "FIELD_FLOAT"
                    "value" "expr(%heal)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Heal"
        {
            "Target"        "%TARGET"
            "HealAmount"    "%heal"
        }

        "AttachEffect"
        {
            "EffectName" "MBFGreenCrystalHealFXMega"
            "Target" "%TARGET"
        }

        "RemoveModifier"
        {
            "ModifierName"    "mbf_healingcrystal_detroyed_link"
            "Target"         "%SOURCE"
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
            "Weight" "10"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }

                "isboss"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#ulgukhai"
                        "Owner" "0"
                    }
                }
            }
        }
    }
}
