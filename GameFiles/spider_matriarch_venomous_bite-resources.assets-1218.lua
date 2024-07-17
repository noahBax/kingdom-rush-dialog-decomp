"spider_matriarch_venomous_bite"
{
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "Attack"
    "Icon" "PoisonStrike"
    "CastFXId" "PoisonShotCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "MinDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"        
            "MaxDamage"  "stat(%CASTER, #attackDamage)"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"        
            "poisonDuration"  "1"
        }

    }



    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_TRUE"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
                }

                
            }
            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_new_poison"
                    "Target"        "%HITTARGET"
                    "Duration"      "%poisonDuration"
                    "Refresh"   "1"
                }
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

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }

                "Ignores targets already poisoned"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "modifier_new_poison"  
                    }
                }
            }
        }
    }
}
