






"shield_of_retribution"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastB"
    "CastFXId" "AvengingShieldCastFXMega"
    "Icon" "AvengingShield"


    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierTag"    "shield"
            "Target"         "%TARGET"
        }

        "ApplyModifier"
        {
            "ModifierName"    "modifier_shield_of_retribution"
            "Target"         "%TARGET"
            "Duration"      "%duration"
        }
    }

    "Modifiers"
    {
        "modifier_shield_of_retribution"
        {
            "Tags" "shield"

            "EffectName" "AvengingShieldStatusFXMega"

            "Icon" "ShieldOfRetribution"
            "IconPriority" "50"


            "OnPreHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && not(hasTags(hitTags(%HIT), #CANTBESHIELDED) || hasTags(hitTags(%HIT), #INTERNAL))"
                    "Actions" 
                    {
                        "CancelHit"
                        {

                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "modifier_shield_of_retribution"
                            "Target"         "%TARGET"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "modifier_shield_of_retribution_damager"
                            "Target"         "%TARGET"
                            "Params"
                            {
                                "physicalDamage" {
                                    "type" "FIELD_FLOAT"
                                    "value" "hitDamageOfType(%HIT, @DamageType(DAMAGE_PHYSICAL))"
                                }

                                "magicalDamage" {
                                    "type" "FIELD_FLOAT"
                                    "value" "hitDamageOfType(%HIT, @DamageType(DAMAGE_MAGICAL))"
                                }

                                "trueDamage" {
                                    "type" "FIELD_FLOAT"
                                    "value" "hitDamageOfType(%HIT, @DamageType(DAMAGE_TRUE))"
                                }

                                "armorDamage" {
                                    "type" "FIELD_FLOAT"
                                    "value" "hitDamageOfType(%HIT, @DamageType(DAMAGE_ARMOR))"
                                }
                            }
                        }
                    }
                }
            }
        }

        "modifier_shield_of_retribution_damager"
        {
            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "not(hasTags(hitTags(%HIT), #REFLECTED) || hasTags(hitTags(%HIT), #INTERNAL)  || hasTags(hitTags(%HIT), #ENVIRONMENTAL))"
                    "Actions" 
                    {
                        "QueueHit"
                        {
                            "Target" "%ATTACKER"
                            "Source" "%TARGET"

                            "EffectName" "AvengingShieldHitFXMega" 
                            "Tags" "stringList(#MAGICAL, #REFLECTED)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%physicalDamage"
                                }

                                 "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%magicalDamage"
                                }

                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%trueDamage"
                                }

                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%armorDamage"
                                }
                            }

                            "Actions"
                            {
                                "AttachEffect"
                                {
                                    "EffectName" "AvengingShieldHittedFXMega"
                                    "Target" "%HITSOURCE"
                                }
                            }
                        }
                    }
                }

                "RemoveModifier"
                {
                    "ModifierName"    "modifier_shield_of_retribution_damager"
                    "Target"         "%TARGET"
                }
            }
        }
    }
}
