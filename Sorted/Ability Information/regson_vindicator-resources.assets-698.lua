"regson_vindicator"
{
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange"  "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"

    "AnimationID"       "Vindicator"
    "CastFXId"          "RegsonVindicatorCastFXMega"
    "Icon"              "Vindicator"

    "AbilityCanExecute" "stat(%SOURCE, #health_missing) > 0"

    "AbilitySpecial"
    {
        "01" 
        {
            "var_type"  "FIELD_EXPRESSION"
            "damage"    "(stat(%CASTER, #health_missing))*2"
        }

        "02" 
        {
            "var_type"  "FIELD_FLOAT"
            "heal"      "3"
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target"        "%TARGET"
            "EffectName"    "GeraldDivineBladeHitFXMega" 
            "Tags"          "stringList(#MELEE, #TARGETED)"

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
                "Heal"
                {
                    "Target"          "%SOURCE"
                    "HealAmount"      "%heal"
                }

                "AttachEffect"
                {
                    "EffectName"      "RegsonHealingFXMega"
                    "Target"          "%SOURCE"
                }
            }
        }
    }
}
