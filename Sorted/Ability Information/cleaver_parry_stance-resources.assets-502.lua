"cleaver_parry_stance"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_FRIENDLY"
    "AnimationID"                       "SpellCastC"
    "CastFXId"                          "OrcCleaverParryStanceCastFXMega"
    "Icon"                              "ParryStance"
    "AbilityCastRange"                  "0"
    "AbilityCooldown"                   "3"
    "AbilityAPCost"                     "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_FLOAT"
            "extraArmor"                "2"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "duration"                  "3"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "damageReduction"   "-1"
        }
    }

    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierTag"               "dot"
            "Target"                    "%TARGET"
        }

        "ApplyModifier"
        {
            "ModifierName"              "cleaver_parry_stance_modifier"
            "Target"                    "%TARGET"
            "Duration"                  "%duration"
            "Refresh"                   "1"
        }

        "GiveArmor"
        {
            "Target"                    "%TARGET"
            "ArmorAmount"               "%extraArmor"
        }
    }

    "Modifiers"
    {
        "cleaver_parry_stance_modifier"
        {
            "Icon"                       "ParryStance"
            "IconPriority"               "50"
            "EffectName"                 "CleaverParryStanceStatusFXMega"

            "OnAdded"
            {
               "RemoveModifier"
                {
                    "ModifierName"      "modifier_counter_stance_provider"
                    "Target"            "%TARGET"
                }

                "RemoveModifier"
                {
                    "ModifierName"      "modifier_counter_stance"
                    "Target"            "%TARGET"
                }
            }

            "OnRemoved" 
            {
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_counter_stance_provider"
                    "Target"            "%TARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"      "modifier_counter_stance"
                    "Target"            "%TARGET"
                }
            }

            "OnTurnStarted"
            {
                "GiveArmor"
                {
                    "Target"             "%TARGET"
                    "ArmorAmount"        "%extraArmor"
                }
            }

            "OnHitPreProcessDamages"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_PHYSICAL"
                    "Damage"            "%damageReduction"
                }

                "AddDamage"
                {
                    "Type"              "DAMAGE_TRUE"
                    "Damage"            "%damageReduction"
                }

                "AddDamage"
                {
                    "Type"              "DAMAGE_ARMOR"
                    "Damage"            "%damageReduction"
                }

                "AttachEffect"
                {
                    "EffectName"        "MartyrsInspirationShieldFXMega"
                    "Target"            "%ATTACKED"
                }
            }

            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "hasTags(hitTags(%HIT), #MELEE, #TARGETED)"
                    "Actions" 
                    {
                        "QueueAttackUnit"
                        {
                            "Target"                "%TARGET"
                            "AttackTarget"          "%ATTACKER"
                        }
                    }
                }
            }
        }
    }
}
