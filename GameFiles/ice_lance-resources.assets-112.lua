






"ice_lance"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "IcelanceCastFXMega"
    "Icon" "IceLance" 

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)+1"
    "AbilityCastMinRange" "stat(%CASTER, #rangedAttackMinRange)"     
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"

"AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "2"
        }
        "03"
        {
            "var_type" "FIELD_FLOAT"
            "damageReductionPercent" "100"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "freezeChance" "0.75"
        }

    }




    "OnAbilityAction" 
    {
        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "IcelanceProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%damage)"
                }
            }
        }
    }


"OnProjectileHitUnit" 
    {
        "Damage"
        {
            "Target"        "%TARGET"
            "Type"          "DAMAGE_MAGICAL" 
            "Damage"        "%damage"
        }

        "AttachEffect"
        {
            "EffectName" "IceLanceHitFXMega" 
            "Target" "%TARGET"
        }

        "Conditional" 
        {
            "Condition" "stat(%TARGET, #health) > 0"
            "Actions"
            {
                 "Conditional" 
                {
                    "Condition" "randomBetween(0, 1) < %freezeChance"
                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_freeze"
                            "Target"        "%TARGET"
                            "Duration"      "%duration"
                        }
                    }
                }
            }
        }
    }


 "Modifiers"
    {
        "modifier_freeze"
        {

            "EffectName" "IceLanceStatusFXMega"
            "AnimationOverride" "IdleStatic"

           
            "States"
            {
                "STUNNED" "1"
            }

            "OnAdded"
            {
               "RemoveModifier"
                {
                    "ModifierTag"    "dot"
                    "Target"         "%TARGET"
                }
            }


            "OnDamaged"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "modifier_freeze"
                    "Target"         "%TARGET"
                }
            }

            "PropertiesAdd"
            {
                "damageReduction" "%damageReductionPercent"
            }
        }
    }


}
