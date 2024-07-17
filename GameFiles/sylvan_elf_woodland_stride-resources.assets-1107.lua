"sylvan_elf_woodland_stride"
{
    "AbilityBehavior"           "POINT_TARGET |  NEEDS_CLEAR_TERRAIN | AOE"
    "AbilityCastRange"          "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"           "2"
    "AbilityAPCost"             "2"
    "AnimationID"               "SpecialAttack"
    "Icon"                      "Woodlandstride"
    "CastFXId"                  "SylvanElfWoodlandStrideCastFXMega"

    "AbilityAOETeamFilter"      "TEAM_ENEMY"
    "AbilityAOERange"           "1"
    "AbilityAOEKind"            "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"  "0"
    "AbilityAOEAffectsCaster"   "0"
   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_EXPRESSION"        
            "damage"            "ceil(stat(%CASTER, #attackDamage)/2)"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damageMagical"
        }
    }

    "OnAbilityAction"
    {
        "SetToContext"
        {
            "Context"           "currentContext()"
            "Key"               "#sourcePosition"
            "Value"             "unitPosition(%SOURCE)"
            "Type"              "FIELD_OBJECT"
        }

        "SetToContext"
        {
            "Context"           "currentContext()"
            "Key"               "#targetPosition"
            "Value"             "%TARGET"
            "Type"              "FIELD_OBJECT"
        }

        "StartLogicTick"
        {
            "Time"              "0.5"
            "TickType"          "PriorityCenter"
            "Position"          "%targetPosition"
        }

        "MoveUnit"
        {
            "Target"            %SOURCE"
            "Position"          "newPoint(1000, 1000, 0)"
        }

        "AttachEffect"
        {
            "EffectName"        "SylvanElfWoodlandStrideFXMega"
            "Target"            "%sourcePosition"
        }

        "Delay"
        {
            "Time" "0.5"
            "Actions"
            {
                "MoveUnit"
                {
                    "Target"            "%SOURCE"
                    "Position"          "%targetPosition"
                }

                "#PlayActivityAnimation"
                {
                    "Target"            "%CASTER"
                    "Animation"         "SpecialAttack"
                }

                "AttachEffect"
                {
                    "EffectName"        "SylvanElfWoodlandStrideOutFXMega"
                    "Target"            "%targetPosition"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"    "%CASTER"
                        "Radius"    "1"
                        "Teams"     "TEAM_ENEMY"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Hit"
                        {
                            "Target"        "%newTarget"
                            "Tags"          "stringList(#TARGETED, #AOE)"
                            "EffectName"    "GenericHitFXMega" 

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_MAGICAL"
                                    "Damage"        "expr(%damage)"
                                }
                            }
                        }
                    }
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"    "%CASTER"
                        "Radius"    "1"
                        "Teams"     "TEAM_FRIENDLY"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "AttachEffect"
                        {
                            "EffectName"    "GeraldMartyrsPrayerHealingFXMega"
                            "Target"        "%newTarget"
                        }

                        "RemoveModifier"
                        {
                            "ModifierTag"    "dot"
                            "Target"         "%newTarget"
                        }

                        "RemoveModifier"
                        {
                            "ModifierTag"    "status_effect"
                            "Target"         "%newTarget"
                        }
                    }
                }
            }
        }
    }
}
