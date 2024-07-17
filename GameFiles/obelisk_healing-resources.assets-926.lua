






"obelisk_healing"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityCustomTargetFilter" "not(equal(%UNIT, %SOURCE))"

    "AnimationID"   "SpellCastB"
    "Icon" "OrcHealing"
    "CastFXId" "ObeliskHealingCastFXMega"

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"     "0"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "heal" "stat(%CASTER,#attackDamage)*1.5"
        }
    }


    "OnAbilityAction"
    {

        "Heal"
        {
            "Target"        "%TARGET"
            "HealAmount"    "expr(%heal)"
        }

        "AttachEffect"
        {
            "EffectName" "HealingFXMega"
            "Target" "%TARGET"
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "3"
            "Considerations"
            {
                "Has a minimum of health missing"
                {
                    "Curve" "Linear|10|1|0|0.9"
                    "Consideration" "HealthMissingRelativeToValue"
                    "Params"
                    {
                        "Value" "expr(%heal) * 0.1"  
                    }
                }

                "Priorizes target with more missing health percent"
                {
                    "Curve" "Logistic|10|0.7|0.3|0.5"
                    "Consideration" "HealthMissingRelativeToValue"
                }
            }
        }
    }
}
