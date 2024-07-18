"oloch_fire_barrier"
{
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter"     "TEAM_FRIENDLY"
    "AnimationID"   "SpellCastA"
    "CastFXId" "OlochFireBarrierCastFXMega"
    "Icon" "FireBarrier"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"          "3"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "damageReduction"   "-1"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "damageRetributed"   "1"
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierTag"    "shield"
            "Target"         "%TARGET"
        }

        "RemoveModifier"
        {
            "ModifierName"     "modifier_burning"
            "Target"           "%TARGET"
        }

        "ApplyModifier"
        {
            "ModifierName"      "modifier_oloch_fire_barrier"
            "Target"            "%TARGET"
            "Duration"          "%duration"
        }
    }

    "Modifiers"
    {
        "modifier_oloch_fire_barrier"
        {
            "Tags" "shield"
            "EffectName" "OlochFireBarrierStatusFXMega"
            "Icon" "FireBarrier"
            "IconPriority" "50"

            "States"
            {
                "CANT_BE_BURNT" "1"
            }

            "OnPreHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && not(hasTags(hitTags(%HIT), #INTERNAL))"
                    
                    "Actions"
                    {
                        "Conditional"
                        {
                            "Condition" "hitDamageOfType(%HIT, @DamageType(DAMAGE_TRUE)) > 0"

                            "Actions"
                            {
                                "AddDamage"
                                {
                                    "Type"              "DAMAGE_TRUE"
                                    "Damage"            "%damageReduction"
                                }
                            }

                            "ElseActions"
                            {
                                "Conditional"
                                {
                                    "Condition" "hitDamageOfType(%HIT, @DamageType(DAMAGE_MAGICAL)) > 0"

                                    "Actions"
                                    {
                                        "AddDamage"
                                        {
                                            "Type"              "DAMAGE_MAGICAL"
                                            "Damage"            "%damageReduction"
                                        }
                                    }

                                    "ElseActions"
                                    {
                                        "Conditional"
                                        {
                                            "Condition" "hitDamageOfType(%HIT, @DamageType(DAMAGE_PHYSICAL)) > 0"

                                            "Actions"
                                            {
                                                "AddDamage"
                                                {
                                                    "Type"              "DAMAGE_PHYSICAL"
                                                    "Damage"            "%damageReduction"
                                                }
                                            }

                                            "ElseActions"
                                            {
                                                "Conditional"
                                                {
                                                    "Condition" "hitDamageOfType(%HIT, @DamageType(DAMAGE_ARMOR)) > 0"

                                                    "Actions"
                                                    {
                                                        "AddDamage"
                                                        {
                                                            "Type"              "DAMAGE_ARMOR"
                                                            "Damage"            "%damageReduction"
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        "AttachEffect"
                        {
                            "EffectName"        "MartyrsInspirationShieldFXMega"
                            "Target"            "%ATTACKED"
                        }
                    }
                }
            }

            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && hasTags(hitTags(%HIT), #MELEE) && not(hasTags(hitTags(%HIT), #REFLECTED))"
                    
                    "Actions" 
                    {
                        "QueueHit"
                        {
                            "Target"        "%ATTACKER"
                            "Source"        "%TARGET"
                            "EffectName"    "AvengingShieldHitFXMega" 
                            "Tags"          "stringList(#MAGICAL, #REFLECTED)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%damageRetributed"
                                }
                            }

                            "Actions"
                            {
                                "AttachEffect"
                                {
                                    "EffectName"    "OlochFireBarrierGetDamageFXMega"
                                    "Target"        "%HITSOURCE"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
