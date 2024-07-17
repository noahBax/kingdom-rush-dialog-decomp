"wbf_iriza_glare_bolt"
{
    "AbilityBehavior"   "UNIT_TARGET | DOESNT_CONSUME_MOVE | FAKE_ACTION"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack1"
    "CastFXId" "WBFIrizaGlareBoltCastFXMega"
    "Icon" "hypnobeam" 
    "AbilityShowDetailFilter" "isOnState(%CASTER, #PHASE1)"
   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #glare_bolt_damage)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "sleep_duration"  "stat(%CASTER, #glare_bolt_asleep_duration)"
        }
    }

    "OnAbilityStart"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "999"
                "Teams"     "TEAM_ALL"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "RemoveModifier"
                {
                    "ModifierName"    "wbf_iriza_clone_hithandler_trait_modifier"
                    "Target"         "%newTarget"
                } 
            }
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierName"    "wbf_iriza_glare_bolt_charging_modifier"
            "Target"         "%SOURCE"
        }

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "CultistProjectilecBoltProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type" "FIELD_FLOAT"
                    "value" "expr(%damage)"
                }

                "sleep_duration"
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%sleep_duration)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "WBFIrizaGlareBoltHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_asleep"
                    "Target"        "%HITTARGET"
                    "Duration"      "%sleep_duration"
                    "Refresh"   "1"
                }
            }
        }
    }

    "Modifiers"
    {
        "wbf_iriza_glare_bolt_charging_modifier"
        {
            
            "AnimationOverride" "SummonCasting"
            "Tags" "iriza_charging"
            
            "States"
            {
                "CHARGING_BOLT" "1"
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "2.3"
            "Considerations"
            {
                "ischarging"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#CHARGING_BOLT"
                        "Owner" "1"
                    }
                }

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }

                "Tries to ignore targets already asleep"
                {
                    "Curve" "Linear|-0.5|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "modifier_asleep"  
                    }
                }
            }
        }
    }
}
