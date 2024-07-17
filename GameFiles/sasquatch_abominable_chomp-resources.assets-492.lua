"sasquatch_abominable_chomp"
{
    "AbilityBehavior"       "MELEE"
    "AbilityTeamFilter"     "TEAM_ENEMY"
    "AbilityCastRange"      "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"       "3"
    "AbilityAPCost"         "1"

    "CastFXId"              "SasquatchAbominableChompCastFXMega"
    "AnimationID"           "SpellCastD"
    "Icon"                  "AbominableChomp" 

    "AbilitySpecial"
    {
        "01" 
        {
            "var_type"      "FIELD_EXPRESSION"
            "damage"        "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "02" 
        {
            "var_type"      "FIELD_EXPRESSION"
            "damage"        "ceil(stat(%CASTER, #attackDamage)/2)"
        }
    }

    "OnAbilityAction"
    {
        "Hit"
        {
            "Target"            "%TARGET"
            "EffectName"        "WulfRuptureHitFXMega"
            "Tags"              "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_TRUE"
                    "Damage"        "expr(%damage)"
                }
            }

            "Actions"
            {
                "Heal"
                {
                    "Target"        "%SOURCE"
                    "HealAmount"    "hitEffectiveDamage(%HIT)"
                }

                "AttachEffect"
                {
                    "EffectName"    "HealingFXMega"
                    "Target"        "%SOURCE"
                }

                "#Conditional"
                {
                    "Condition"     "isOnState(%TARGET, #DEAD)"

                    "Actions"
                    {
                        "MarkHitLegendary"
                        {
                        }

                        "OffsetCooldown"
                        {
                            "Target"                "%TARGET"
                            "ConcreteAbility"       "%ABILITY"
                            "Offset"                "-999"
                        }
                    }
                }
            }
        }
    }
}
