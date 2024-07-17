






"axe_toss"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "BullRushCastFXMega"
    "Icon" "AxeToss"

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"   
    "AbilityCooldown"  "3"
    "AbilityAPCost"    "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_EXPRESSION"
            "cantAxes"    "stat(%CASTER, #level)" 
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"
            "damage"            "stat(%CASTER, #attackDamage)-2"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "otherUnitsCheckRange"   "1"
        }

        "04"
        {
            "var_type"          "FIELD_FLOAT"
            "maxTimeDelayProjectile"   "0.1"
        }

        "05"
        {
            "var_type"          "FIELD_FLOAT"
            "guaranteedMainTargetHits"   "1"
        }
        "06" 
        {
           "var_type" "FIELD_EXPRESSION"
            "minDamage" "expr(%damage) -1"
        }

        "07" 
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage" "expr(%damage) +1"
        }
    }

    "OnAbilityAction"
    {

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "AxeProjectile"
            "MissPosition" "unitPosition(%TARGET)"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "randomBetween(expr(%minDamage), expr(%maxDamage))"
                }
            }
        }

         "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "1"
                "Teams"     "TEAM_ENEMY"
                "ExcludedUnits" "objectList(%TARGET)"
                "MaxTargets" "%cantAxes"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                 "TrackingProjectile"
                {
                    "Target"               "%newTarget"
                    "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
                    "TargetPos"             "unitPosition(%newTarget, #Chest)"
                    "Model" "AxeProjectile"
                    "MissPosition" "unitPosition(%newTarget)"

                    "Params" 
                    {
                        "damage" 
                        {
                            "type" "FIELD_FLOAT"
                            "value" "randomBetween(expr(%minDamage), expr(%maxDamage))"
                        }
                    }
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
       "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "GenericHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
            }
        }
    }
}
