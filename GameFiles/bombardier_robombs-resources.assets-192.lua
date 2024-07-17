"bombardier_robombs"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "20"
    "AbilityCooldown"                   "3"
    "AbilityPrewarmCooldown"            "1"
    "AbilityAPCost"                     "2"
    "AnimationID"                       "SpellCastB"
    "Icon"                              "Robombs"
    "CastFXId"                          "BombardierRobombsCastFXMega"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "explodeDamage"             "stat(%CASTER, #attackDamage)"
        }
    }

    "OnAbilityAction"
    {
        "SpawnUnit"
        {
            "UnitName"                  "#BombardierRobombs"
            "Position"                  "hexPosition(hexNeighbourOrNextFree(unitHex(%CASTER), unitHex(%TARGET), 0))"
            "UnitGroup"                 "unitGroup(%CASTER)"
            "IsAI"                      "1"
            "AddToInitiativeOrder"      "0"

            "OnSpawn"
            {
                "AttachEffect"
                {
                    "EffectName"             "BigBadaboomSpawnFXMega"
                    "Target"                 "%UNIT"
                }

                "SetStat"
                {
                    "Target"                "%UNIT"
                    "Stat"                  "#unitTargetId"
                    "Value"                 "getUnitId(%TARGET)"
                }

                "SetStat"
                {
                    "Target"                "%UNIT"
                    "Stat"                  "#explodeDamage"
                    "Value"                 "expr(%explodeDamage)"
                }

                "ApplyModifier"
                {
                    "ModifierName"          "bombardier_robombs_inactive_state_manager"
                    "Target"                "%UNIT"
                }
            }
        }
    }

     "Modifiers"
    {
        "bombardier_robombs_inactive_state_manager"
        {
            "OnUnitDiedGlobal"
            {
                "Conditional"
                {
                    "Condition"                 "equal(round(getUnitId(%DEAD)), stat(%TARGET, #unitTargetId))"
                    "Actions"
                    {
                        "RemoveModifier"
                        {
                            "ModifierName"      "bombardier_robombs_inactive_state_manager"
                            "Target"            "%TARGET"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"      "bombardier_robombs_inactive_state"
                            "Target"            "%TARGET"
                        }
                    }
                }
            }
        }

        "bombardier_robombs_inactive_state"
        {
            "AnimationOverride"     "InactiveIdle"
            "StayOnDeath"    "1"

            "OnAdded"
            {
                "PlayActivityAnimation"
                {
                    "Target"            "%TARGET"
                    "Animation"         "InactiveTransition"
                }
            }
        }
    }
}

"bombardier_robombs_walk_to_target_ai"
{
    "AbilityBehavior"                   "MELEE"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "999"
    "AbilityCooldown"                   "0"
    "AbilityAPCost"                     "0"
    "AnimationID"                       "NOANIMATION"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "unitTargetID"              "stat(%CASTER, #unitTargetId)"
        }
    }

    "OnThink"
    {
        "GetCloseToUnitAI"
        {
            "BrainId"           "#Custom"
        }
    }

    "AIBrainCustom"
    {
        "Selection" 
        {
            "Weight" "1"
            "Considerations"
            {
                "Is target"
                {
                    "Curve"             "Linear|20|1|0|0"
                    "Consideration"     "UnitID"
                    "Params"
                    {
                        "ID"              "expr(%unitTargetID)"
                    }
                }

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve"             "Linear|-0.1|1|1|0"
                    "Consideration"     "PathDistance"
                    "Params"
                    {
                        "MaxRange"          "20"  
                    }
                }
            }
        }
    }
}

"bombardier_robombs_explode_on_target_ai"
{
    "AbilityBehavior"                   "MELEE"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "1"
    "AbilityCooldown"                   "0"
    "AbilityAPCost"                     "1"
    "AnimationID"                       "Attack"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "unitTargetID"              "stat(%CASTER, #unitTargetId)"
        }

        "02"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "explodeDamage"             "stat(%SOURCE, #attackDamage)"
        }

        "03"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "explodeRadius"             "stat(%SOURCE, #explodeRadius)"
        }
    }
    
    "OnAbilityStart"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatBombardier_robombDetonateCharge"
        }
    }

    "OnAbilityAction"
    {
        "AttachEffect"
        {
            "EffectName"    "FireballExplosionFXMega"
            "Target"        "unitPosition(%SOURCE)"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"    "unitPosition(%SOURCE)"
                "Radius"    "expr(%explodeRadius)"
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName"  "#explosionTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"        "%explosionTarget"
                    "EffectName"    "FireballHitFXMega" 
                    "Tags"          "stringList(#ENVIRONMENTAL, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%explodeDamage)"
                        }
                    }
                }

                "KillUnit"
                {
                    "Target"           "%SOURCE"
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "2"
            "Considerations"
            {
                "Is target"
                {
                    "Curve"             "Linear|20|1|0|0"
                    "Consideration"     "UnitID"
                    "Params"
                    {
                        "ID"            "expr(%unitTargetID)"
                    }
                }
            }
        }
    }
}
