"stormcloud_sorcerer_hex_blast"
{
    "AbilityBehavior"               "UNIT_TARGET"
    "AbilityTeamFilter"             "TEAM_ENEMY"
    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"           "stat(%CASTER, #rangedAttackMinRange)"
    "AbilityCooldown"               "0"
    "AbilityAPCost"                 "1"
    "AnimationID"                   "Attack"
    "Icon"                          "HexBlast"
    "CastFXId"                      "HighSorcererSummonHexBlastCastFXMega"

   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "MinRangedDmg"          "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"        
            "MaxRangedDmg"          "ceil(stat(%CASTER, #attackDamage)/2)+1"
        }

        "03"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"              "2"
        }

        "04"
        {
            "var_type"              "FIELD_INTEGER"
            "extraDamagePerHit"              "1"
        }
    }


    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "SorceressCursedBlastProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "randomI(expr(%MinRangedDmg), expr(%MaxRangedDmg))"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "SorceressHexBlastHitFXMega" 
            "Tags"                  "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
                }

                "Conditional"
                {
                    "Condition" "isOnState(%HITTARGET, #STUNNED)"

                    "Actions" 
                    {
                        "MarkHitLegendary"
                        {
                        }
                    }
                }
            }

            "Actions"
            {
                "Conditional"
                {
                    "Condition" "not(hasModifier(%TARGET, #modifier_hex_blast))"
                    "Actions" 
                    {
                        "AddHitTag"
                        {
                            "Tag" "#HEX_BLAST_FIRST_TIME"
                        }
                    }
                }

                "Conditional"
                {
                    "Condition" "not(isOnState(%TARGET, #PROP))"
                    "Actions" 
                    {
                        "Conditional"
                        {
                            "Condition" "hitIsLegendary(%HIT)"
                            "Actions" 
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"  "modifier_hex_blast"
                                    "Target"        "%TARGET"
                                    "Duration"      "%duration * 2"
                                    "Refresh"       "1"
                                }
                            }

                            "ElseActions" 
                            {
                                "ApplyModifier"
                                {
                                    "ModifierName"  "modifier_hex_blast"
                                    "Target"        "%TARGET"
                                    "Duration"      "%duration"
                                    "Refresh"       "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    "Modifiers"
    {
        "modifier_hex_blast"
        {
            "EffectName"                    "SorceressDebuffFXMega"
            "Icon"                          "Hexed"
            "IconPriority"                  "60"

            "IncompatibleStates" "CANT_BE_HEXED"

            "OnAdded"
            {
                "SetStat"
                {
                    "Target"                "%TARGET"
                    "Stat"                  "#hexBlastDamage"
                    "Value"                 "0"
                }
            }

            "OnHitEnd"
            {
                "Conditional"
                {
                    "Condition"                     "hitConnected(%HIT) && not(hasTags(hitTags(%HIT), #INTERNAL)) && not(hasTags(hitTags(%HIT), #HEX_BLAST_FIRST_TIME)) && not(hasModifier(%TARGET, #modifier_new_freeze))"
                    "Actions"
                    {
                        "SetStat"
                        {
                            "Target"                "%TARGET"
                            "Stat"                  "#hexBlastDamage"
                            "Value"                 "stat(%TARGET, #hexBlastDamage) + %extraDamagePerHit"
                        }

                        "QueueHit"
                        {
                            "Target"                "%TARGET"
                            "EffectName"            "SorceressHexedHitFXMega" 
                            "Tags"                  "stringList(#MODIFIER, #INTERNAL)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"           "DAMAGE_MAGICAL"
                                    "Damage"         "stat(%TARGET, #hexBlastDamage)"
                                }
                            }
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
            "Weight" "2.4"
            "Considerations"
            {
                "Priorizacion Por Distance mas cercano"
                {
                    "Curve"             "Linear|-0.1|1|1|0"
                    "Consideration"     "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange"      "expr(%AbilityCastRange)"  
                    }
                }

                "surrounded by several units"
                {
                    "Curve"             "Linear|2|1|0.2|0"
                    "Consideration"     "UnitsSurrounding"
                    "Params"
                    {
                        "Max"           "5"
                        "TeamFilter"    "TEAM_FRIENDLY"
                        "Range"         "1"
                    }
                }

                "Ignores targets already hexed"
                {
                    "Curve"             "Linear|-1|1|1|0.2"
                    "Consideration"     "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName"  "modifier_hex_blast"  
                    }
                }
            }
        }
    }
}
