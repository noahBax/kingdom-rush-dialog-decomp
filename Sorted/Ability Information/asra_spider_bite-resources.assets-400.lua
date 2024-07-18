"asra_spider_bite"
{
    
    
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "2"
    "AbilityAPCost"     "1"
    "AnimationID"   "AttackMelee"
    "CastFXId" "SpiderBiteCastFXMega"
    "Icon" "ViperStrike"

    "AbilitySpecial" 
    {
       "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"   "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "damagePerTurn"  "1"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "duration"  "3"
        }

        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "extraDamage"  "ceil(stat(%CASTER, #attackDamage)/2)"
        }
    }

    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "AsraSpiderBiteHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"            "DAMAGE_TRUE"
                    "Damage"        "expr(%damage)"
                }

                "Conditional"
                {
                    "Condition" "isOnState(%HITTARGET, #WEAKENED)"
                    

                    "Actions" 
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_TRUE"
                            "Damage"        "expr(%extraDamage)"
                        }

                        "MarkHitLegendary"
                        {
                        }
                    }
                }
            }

            "Actions"
            {
                "RemoveModifier"
                {
                    "ModifierName"    "modifier_new_poison"
                    "Target"         "%HITTARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"  "modifier_new_poison"
                    "Target"        "%HITTARGET"
                    "Duration"      "%duration"
                    "Params"
                    {
                        "dot" {
                            "type" "FIELD_FLOAT"
                            "value" "expr(%damagePerTurn)"
                        }
                    }
                }
            }
        } 
    }
}


