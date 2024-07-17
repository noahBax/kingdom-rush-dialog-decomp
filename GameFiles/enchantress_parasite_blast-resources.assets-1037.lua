"enchantress_parasite_blast"
{
    "AbilityBehavior"           "UNIT_TARGET"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"       "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "1"
    "AnimationID"               "SpellCastB"
    "CastFXId"                  "EnchantressParasiteBlastCastFXMega"
    "Icon"                      "ParasiteBlast"
   
    "AbilitySpecial"
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"
            "damage"            "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "drainedDamage"     "1"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"            "%TARGET"
            "SourcePos"         "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"         "unitPosition(%TARGET, #Chest)"
            "Model"             "EnchantressParasiteBlastProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"      "FIELD_FLOAT"
                    "value"     "expr(%damage)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {   
        "Hit"
        {
            "Target"            "%TARGET"
            "Tags"              "stringList(#MAGICAL)"
            "EffectName"        "EnchantressParasiteBlastHitFXMega" 

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
                
            }

            "Actions"
            {
                "Conditional" 
                {
                    "Condition" "hitConnected(%HIT) && hitEffectiveDamage(%HIT) > 0 && not(isOnState(%TARGET, #DEAD))"
                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "enchantress_drained_modifier"
                            "Target"            "%TARGET"
                            "Params"
                            {
                                "drainSource"
                                {
                                    "type"      "FIELD_OBJECT"
                                    "value"     "%HITSOURCE"
                                }
                            }
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"      "enchantress_drained_used_modifier"
                            "Target"            "%HITSOURCE"
                        }
                    }
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "3"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }

                "Ignores targets already drained"
                {
                    "Curve"                 "Linear|-1|1|1|0"
                    "Consideration"         "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName"      "enchantress_drained_modifier"  
                    }
                }

                "Only can drain one target at the same time"
                {
                    "Curve"                 "Linear|-1|1|1|0"
                    "Consideration"         "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName"      "enchantress_drained_used_modifier"  
                        "Owner"             "1"
                    }
                }
            }
        }
    }

    "Modifiers"
    {
        "enchantress_drained_used_modifier"
        {
            "EffectName"            "EnchantressParasiteBlastDebuffFXMega"
            "Icon"                  "Drained"
            "IconPriority"          "25"
        }

        "enchantress_drained_modifier"
        {
            "Icon"                  "Drained"
            "IconPriority"          "25"
            "EffectName"            "EnchantressParasiteBlastDebuffFXMega"

            "States"
            {
                "DRAINED"           "1"
            }

            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition" "equal(%DEAD, %drainSource)"
                    "Actions" 
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"      "enchantress_drained_modifier"
                            "Target"            "%TARGET"
                        }
                    }
                }
            }

            "OnTurnFinished"
            {
                "Hit"
                {
                    "Target"                    "%TARGET"
                    "EffectName"                "RicochetHitFXMega" 
                    "Tags"                      "stringList(#MODIFIER, #INTERNAL)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"              "DAMAGE_TRUE"
                            "Damage"            "%drainedDamage"
                        }
                    }

                    "Actions"
                    {
                        "Heal"
                        {
                            "Target"        "%drainSource"
                            "HealAmount"    "%drainedDamage"
                        }

                        "AttachEffect"
                        {
                            "EffectName"    "HealingFXMega"
                            "Target"        "%drainSource"
                        }
                    }
                }
            }

            "OnRemoved"
            {
                "Conditional" 
                {
                    "Condition" "hasModifier(%drainSource, #high_enchantress_multiple_drained_manager_modifier)"
                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"      "high_enchantress_multiple_drained_manager_modifier"
                            "Target"            "%drainSource"
                        }
                    }
                    "ElseActions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"      "enchantress_drained_used_modifier"
                            "Target"            "%drainSource"
                        }
                    }
                }
            }
        }
    }
}

