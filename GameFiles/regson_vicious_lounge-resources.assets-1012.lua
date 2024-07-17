"regson_vicious_lounge"
{
    "AbilityBehavior"           "UNIT_TARGET"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "3"
    "AbilityCastMinRange"       "1"
    "AbilityCooldown"           "3"
    "AbilityAPCost"             "1"
    "AbilityCustomTargetFilter" "countFreeHexes(unitHex(%UNIT), 1) > 0"

    "AnimationID"               "TwilightStep"
    "Icon"                      "ViciousLounge" 
   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"
            "MinDamage"         "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"        
            "MaxDamage"         "stat(%CASTER, #attackDamage)+1"
        }

        "03"
        {
            "var_type"          "FIELD_EXPRESSION"
            "range"             "3"
        }

        "04"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "epic_extra_damage"         "ceil(stat(%CASTER,#attackDamage)/2)"
        }
    }

    "OnAbilityAction"
    { 
        "PlaySound"
        {
            "Sound" "#krl_sfx_regsonCombat_viciousLungeCast"
        }

        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #Chest)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "RegsonViciousLoungeProyectile"

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT" 
                    "value"         "randomI(expr(%MinDamage), expr(%MaxDamage))"
                }

                "epicDamage" 
                {
                    "type"          "FIELD_FLOAT" 
                    "value"         "expr(%epic_extra_damage)"
                }

                "firstProjectile" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "1"
                }
            }
        }  

        "ApplyModifier"
        {
            "ModifierName"          "disable_unit_modifier"
            "Target"                "%SOURCE"
        }

        "MoveUnit"
        {
            "Target"        "%SOURCE"
            "Position"      "newPoint(1000, 1000, 0)"
        }
    }

    "OnProjectileDestinationReached"
    { 
        "Conditional"
        {
            "Condition" "%firstProjectile"

            "Actions" 
            {
                "Hit"
                {
                    "Target"                "%TARGET"
                    "EffectName"            "RegsonEldritchFuryHitFXMega" 
                    "Tags"                  "stringList(#PROJECTILE, #AOE)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "hasModifier(%CASTER, #regson_eldritch_state_modifier)"
                            
                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL" 
                                    "Damage"        "%damage + %epicDamage"
                                }

                                "MarkHitLegendary"
                                {
                                }
                            }

                            "ElseActions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL" 
                                    "Damage"        "%damage"
                                }
                            }
                        }
                    }
                }

                "SetToContext"
                {
                    "Context"                   "currentContext()"
                    "Key"                       "#finalPosition"
                    "Value"                     "hexPosition(hexNeighbourOrNextFree(unitHex(%TARGET), unitHex(%CASTER), 6))"
                    "Type"                      "FIELD_OBJECT"
                }

                "TrackingProjectile"
                {
                    "SourcePos"             "unitPosition(%TARGET)"
                    "TargetPos"             "%finalPosition"
                    "Model"                 "RegsonViciousLoungeProyectile"

                    "Params" 
                    {
                        "finalPosition" 
                        {
                            "type"          "FIELD_OBJECT" 
                            "value"         "%finalPosition"
                        }
                    }
                }  
            }

            "ElseActions"
            {
                "MoveUnit"
                {
                    "Target"          "%SOURCE"
                    "Position"        "%finalPosition"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"          "%SOURCE"
                }

                "PlayAnimation"
                {
                    "Target"         "%SOURCE"
                    "Animation"      "LaungeOut"
                }

                "PlaySound"
                {
                    "Sound" "#krl_sfx_regsonCombat_viciousLungeLand"
                }
            }
        }
    }
}

  
