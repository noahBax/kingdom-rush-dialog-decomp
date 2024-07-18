"regson_eldritch_heal_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"
    "Icon" "EldritchHeal"

    "AbilitySpecial"
    {

         "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "level"                     "stat(%CASTER, #level)"
        }
    }

    "Modifiers"
    {
        "regson_eldritch_heal_trait_modifier"
        {
            "Passive" "1"

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition" "equal(%INSTIGATOR, %TARGET) && matchesGroup(unitGroup(%DEAD), @UnitGroup(BadSide)) && not(isOnState(%DEAD, #NO_SKULL)) && not(isOnState(%DEAD, #IS_CINEMATIC))"

                    "Actions"
                    {
                        "Heal"
                        {
                            "Target"        "%TARGET"
                            "HealAmount"    "stat(%TARGET, #level)"
                        }

                        "AttachEffect"
                        {
                            "EffectName"    "RegsonHealingFXMega"
                            "Target"        "%TARGET"
                        } 
                    }
                }
            }
        }
    }
}
