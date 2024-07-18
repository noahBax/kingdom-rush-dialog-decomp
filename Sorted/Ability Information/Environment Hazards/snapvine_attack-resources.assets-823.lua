"snapvine_attack"
{
    
    
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCastMinRange" "1"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "stat(%CASTER, #attackCostAP)"
    "AnimationID"   "Attack"
    "Icon" "SnapvineAttack"
    "CastFXId" "SnapVineAttackFXMega"

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
            "MaxDamage"  "stat(%CASTER, #attackDamage)+1"
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
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "randomI(expr(%MinDamage), expr(%MaxDamage))"
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

                "Priorizacion Random"
                {
                    "Curve" "Linear|0.01|1|0.99|0"
                    "Consideration" "Random"
                }

                "Disabled when sleeping"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "snapvine_sleeping_modifier"
                        "Owner" "1"
                    }
                }
            }
        }
    }
}
