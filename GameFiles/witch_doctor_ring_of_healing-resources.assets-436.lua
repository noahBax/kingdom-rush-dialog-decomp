






"witch_doctor_ring_of_healing"

{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastB"
    "CastFXId" "WitchDoctorRingOfHealingCastFXMega"
    "Icon" "RingOfHealing"

    "AbilityAOETeamFilter" "TEAM_FRIENDLY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "1"
    "AbilityAOEAffectsCaster" "0"


    "AbilityCastRange" "0"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "2"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "heal" "ceil(stat(%CASTER,#attackDamage)/3)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "2"
        }
    }


    "OnAbilityAction"
    {
        "AttachEffect"
        {
            "EffectName" "WitchDoctorRingOfHealingFXMega"
            "Target" "%CASTER"
        }
        
        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%CASTER"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_FRIENDLY"
                "MinRadius" "1"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Heal"
                {
                    "Target"        "%newTarget"
                    "HealAmount"    "expr(%heal)"
                }

                "AttachEffect"
                {
                    "EffectName" "HealingFXMega"
                    "Target" "%newTarget"
                }
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

                "surrounded by several units"
                {
                    "Curve" "Logistic|500|5|-4|0.05"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_FRIENDLY"
                    }
                }
            }
        }
    }
}
