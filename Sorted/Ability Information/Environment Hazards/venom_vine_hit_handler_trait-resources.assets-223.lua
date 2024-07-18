"venom_vine_hit_handler_trait"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
       "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "explodeRadius"  "stat(%TARGET, #explodeRadius)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "posionDuration"  "2"
        }
    }

    "Modifiers"
    {
        "venom_vine_invulnerable_modifier"
        {
            "OnPreHit"
            {
                
                "CancelHit"
                {

                }
            }

            "States"
            {
                "NON_TARGETABLE" "1"
            }
        }

        "venom_vine_spent_modifier"
        {
            "AnimationOverride" "Spent"

            "OnRemoved"
            {
                 "PlayActivityAnimation"
                {
                    "Target" "%TARGET"
                    "Animation" "Activate"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "venom_vine_invulnerable_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"    "venom_vine_monitor_modifier"
                    "Target"         "%TARGET"
                }
            }
        }


        "venom_vine_triggered_modifier"
        {
        }


        "venom_vine_monitor_modifier"
        {
           "Passive" "1"


           "OnHitEnd"
            {
                "RemoveModifier"
                {
                    "ModifierName"   "venom_vine_monitor_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"   "venom_vine_invulnerable_modifier"
                    "Target"         "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"   "venom_vine_triggered_modifier"
                    "Target"         "%TARGET"
                }

                "QueueAttackUnit"
                {
                    "Target"        "%TARGET"
                    "AttackTarget"  "%TARGET"
                }
            }
        }
    }
}
