"regson_eldritch_syphon_trait"
{
    "AbilityBehavior"       "PASSIVE"
    "Icon" "EldritchSyphon"

    
     "AbilitySpecial"
    {
        "01"
        {
            "var_type"               "FIELD_INTEGER"
            "duration"               "1"
        }
        "02"
        {
            "var_type"               "FIELD_FLOAT"
            "reduction"               "-1"
        }
    }

    "Modifiers"
    {
        "regson_eldritch_syphon_trait_provider"
        {
            "Passive" "1"

            "OnHitPreProcessDamages"
            {
                "Conditional" 
                {
                    "Condition" "hitConnected(%HIT) && hitDamageOfType(%HIT, @DamageType(DAMAGE_MAGICAL)) > 0"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"    "regson_eldritch_state_modifier"
                            "Target"          "%TARGET"
                            "Duration"        "%duration"
                            "Refresh"         "1"
                        }

                        "AddDamage"
                        {
                            "Type"            "DAMAGE_MAGICAL"
                            "Damage"          "%reduction"
                        }
                    }
                }
            }
        }

        "regson_eldritch_state_modifier"
        {
            "EffectName"    "RegsonEldritchStateStatusFXMega"

            "Icon"          "Eldritch Syphon"
            "IconPriority"  "50"

            "OnAdded"
            {
                "AttachEffect"
                {
                    "EffectName"      "RegsonEldritchSyphonActivateFXMega" 
                    "Target"          "%TARGET"
                }
            }
        }
    }
}
