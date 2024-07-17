"spike_spinner_attack"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | NEGATIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"

    "AnimationID"   "Attack"
    "CastFXId" "SpikeSpinnerCastFXMega"
    "Icon" "Whirlwind"

   
    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"

    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "0"
    "AbilityAPCost"       "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "1"
        }

        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }


    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ALL"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "BarbarianWhirlwindHitFXMega" 
                    "Tags" "stringList(#MELEE, #ENVIRONMENTAL)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%damage)"
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%HITSOURCE)"
                            "Strength" "1"
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
            "Weight" "100"
            "Considerations"
            {
                "shouldSelect"
                {
                    "Curve" "Linear|1|0|0|0"
                    "Consideration" "UnitStat"
                    "Params"
                    {
                        "ExactValue" "0"
                        "Stat" "#anything"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
