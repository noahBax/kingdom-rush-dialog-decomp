"bruxa_laughing_skulls_trait"
{
    "AbilityBehavior"               "POSITIVE_EFFECT | PASSIVE"
    
    "Icon"                          "LaughingSkulls"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "level"  "stat(%CASTER, #level)"
        }   
        "02"
        {
            "var_type" "FIELD_FLOAT"
            "skullsToAdd"  "1"
        }  
    }

    "Modifiers"
    {
        "bruxa_laughing_skulls_trait_controller"
        {
            "Passive"   "1"

            "OnAdded"
            {
                "Delay"
                {
                    "Time"      "0.5"
                    "Actions"
                    {
                        "Times"
                        {
                            "Times"                     "stat(%TARGET, #initialSkulls)"
                            "IteratorName"              "#index"
                            "Actions"
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"      "bruxa_laughing_skulls_trait_modifier"
                                    "Target"            "%TARGET"
                                    "Duration"          "0"
                                }

                                "ApplyModifier"
                                {
                                    "ModifierName"      "bruxa_laughing_skulls_trait_fx_modifier"
                                    "Target"            "%TARGET"
                                    "Duration"          "0"
                                    "Params"
                                    {
                                        "skullId" 
                                        { 
                                            "type"      "FIELD_INTEGER"
                                            "value"     "%index + 1"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            "OnUnitDiedGlobal"
            {
                "Delay"
                {
                    "Time"                      "0.5 + randomBetween(0, 0.5)"
                    "Actions"
                    {
                        "Conditional"
                        {
                            "Condition" "matchesTeam(unitGroup(%DEAD), unitGroup(%TARGET), @TeamFilter(TEAM_ENEMY)) && not(isOnState(%DEAD, #NO_SKULL)) && not(isOnState(%DEAD, #IS_CINEMATIC)) && (stat(%TARGET, #skulls) < stat(%TARGET, #skulls_max))"

                            "Actions" 
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"              "bruxa_laughing_skulls_trait_modifier"
                                    "Target"                    "%TARGET"
                                    "Duration"                  "0"
                                }

                                "PlaySound"
                                {
                                    "Sound"                 "#krl_sfx_combatBruxa_laughingSkullAppears"
                                }

                                "TrackingProjectile"
                                {
                                    "SourcePos"             "unitPosition(%DEAD, #Chest)"
                                    "Target"                "%TARGET"
                                    "TargetPos"             "unitPosition(%TARGET, stringWithIndex(#skull, stat(%TARGET, #skulls)))"
                                    "TargetAttach"          "stringWithIndex(#skull, stat(%TARGET, #skulls))"
                                    "InitialVelocity"       "pointMult(newPoint(0, 0, 5), randomBetween(6, 10))"
                                    "Model"                 "BruxaSkullProjectile"

                                    "Params" 
                                    {
                                        "skullId" 
                                        { 
                                            "type"          "FIELD_INTEGER"
                                            "value"         "stat(%TARGET, #skulls)"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            "OnProjectileHitUnit"
            {
                "PlaySound"
                {
                    "Sound"             "#krl_sfx_combatBruxa_laughingSkullArrives"
                }

                "ApplyModifier"
                {
                    "ModifierName"      "bruxa_laughing_skulls_trait_fx_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "0"
                    "Params"
                    {
                        "skullId" 
                        { 
                            "type"      "FIELD_INTEGER"
                            "value"     "%skullId"
                        }
                    }
                }
            }
        }

        "bruxa_laughing_skulls_trait_modifier"
        {
            "Tags" "bruxa_skull,bruxa_skull_data"

            "PropertiesAdd"
            {
                "skulls"             "%skullsToAdd"
            }
        }

        "bruxa_laughing_skulls_trait_fx_modifier"
        {
            "Tags" "bruxa_skull,bruxa_skull_fx"

            "OnAdded" 
            {
                "AttachEffect"
                {
                    "EffectName" "BruxaSkullFXMega" 
                    "Target" "%TARGET"
                    "ReplaceAttach" "stringList(#SKULL, stringWithIndex(#skull, %skullId)"
                    "Modifier" "%MODIFIERINSTANCE"
                }
            }
        }
    }
}
