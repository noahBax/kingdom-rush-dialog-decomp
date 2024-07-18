"bruxa_skull_sacrifice"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"               "stat(%CASTER, #rangedAttackMinRange)"   
    "AbilityCooldown"                   "2"
    "AbilityAPCost"                     "2"
    "AbilityCanExecute"                 "stat(%SOURCE, #skulls) > 0"

    "AnimationID"                       "VoodooBlow"
    "Icon"                              "SkullSacrifice"
    "CastFXId"                          "BruxaVoodooSpellCastFXMega"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "MinDamage"                 "ceil(stat(%CASTER, #attackDamage)/2)"

        }

        "02"
        {
            "var_type"                  "FIELD_EXPRESSION"        
            "MaxDamage"                 "ceil(stat(%CASTER, #attackDamage)/2)+1"
        }
    }

    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound"         "#krl_sfx_combatBruxa_skullSacrificeRelease_whoosh"
        }
                        
        "Times"
        {
            "Times"                     "stat(%SOURCE, #skulls)"
            "IteratorName"              "#index"
            "Actions"
            {
                "Delay"
                {
                    "Time" "0.2 * %index"
                    "Actions"
                    {
                        "ActOnTargets"
                        {
                            "Target"
                            {
                                "Center"            "unitPosition(%TARGET)"
                                "Radius"            "equal(%index, 0) ? 0 : 1"
                                "Teams"             "TEAM_ENEMY"
                                "MaxTargets"        "1"
                                "ReferenceTeam"     "unitGroup(%SOURCE)"
                                "Random"            "1"
                            }

                            "IteratorName"          "#newTarget"
                        
                            "Actions"    
                            {
                                "PlaySound"
                                {
                                    "Sound"         "#krl_sfx_combatBruxa_skullSacrificeRelease_skull"
                                }

                                "TrackingProjectile"
                                {
                                    "SourcePos"             "unitPosition(%SOURCE, stringWithIndex(#skull, %index + 1))"
                                    "Target"                "%newTarget"
                                    "TargetPos"             "unitPosition(%newTarget, #Chest)"
                                    "InitialVelocity"       "newPoint(0, 0, 5)"
                                    "Model"                 "BruxaSkullSacrificeProjectile"

                                    "Params" 
                                    {
                                        "damage" 
                                        {
                                            "type"          "FIELD_FLOAT"
                                            "value"         "randomI(expr(%MinDamage), expr(%MaxDamage))"
                                        }
                                    }
                                }
                            }
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "bruxa_laughing_skulls_trait_modifier"
                            "Target"          "%SOURCE"
                            "Last"            "1"
                        }

                        "RemoveModifier"
                        {
                            "ModifierName"    "bruxa_laughing_skulls_trait_fx_modifier"
                            "Target"          "%SOURCE"
                            "Last"            "1"
                        }
                    }
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "BruxaSkullSacrificeHitFXMega" 
            "Tags"                  "stringList(#PROJECTILE, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
                }
            }
        }
    }


}
