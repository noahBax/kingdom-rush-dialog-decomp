"gerald_martyrs_prayer"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityCustomTargetFilter" "not(equal(%UNIT, %SOURCE))"

    "AnimationID"   "SpellCastB"
    "CastFXId" "GeraldMartyrsPrayerCastFXMega"
    "Icon" "HealingLight"

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"     "2"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "heal" "5"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "healthSpent" "2"
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierTag"    "dot"
            "Target"         "%TARGET"
        }

        "Heal"
        {
            "Target"        "%TARGET"
            "HealAmount"    "expr(%heal)"
        }

        "AttachEffect"
        {
            "EffectName" "GeraldMartyrsPrayerHealingFXMega"
            "Target" "%TARGET"
        }

        "AttachEffect"
        {
            "EffectName" "GeraldMartyrsPrayerHitFXMega"
            "Target" "%CASTER"
        }

        "RemoveHealth"
        {
            "Target" "%CASTER"
            "HealthToRemove" "expr(%healthSpent)"
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
                        "Value" "expr(%heal) * 0.3"  
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
