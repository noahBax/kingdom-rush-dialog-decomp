"rocket_jump"
{
    
    
   "AbilityBehavior"   "POINT_TARGET | AOE | NEEDS_CLEAR_TERRAIN"

    "AnimationID"   "JumpStart"
    "CastFXId" "GenericShortFuseCastFXMega"
    "Icon" "RocketJump" 

    "AbilityAOETeamFilter" "TEAM_ALL"
    "AbilityAOERange" "expr(%aoe)"

    "AbilityAOEKind" "RANGE_CIRCLE"

    "AbilityAOECenterOnCaster" "1"

    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "expr(%range)"
    "AbilityCooldown"   "3"
 
    "AbilityAPCost"     "1"


   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "minDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage"  "stat(%CASTER, #attackDamage)+1"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "range"  "6"
        }

        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "aoe"  "1"
        }

        "05" 
        {
           "var_type" "FIELD_EXPRESSION"
            "burnDuration" "2"
        }
    }

    "OnAbilityAction"
    { 
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatBarbarian_leapTravel"
        }

        "AttachEffect"
        {
            "EffectName" "FireballExplosionFXMega" 
            "Target" "unitPosition(%SOURCE)"
        }

        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#sourcePosition"
            "Value" "unitPosition(%SOURCE)"
            "Type" "FIELD_OBJECT"
        }

        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, #Chest)"
            "TargetPos"             "%TARGET"
            "Model"                 "BombardierRocketJumpProjectile"
        }  

        "ApplyModifier"
        {
            "ModifierName"    "disable_unit_modifier"
            "Target"         "%SOURCE"
        }

        "MoveUnit"
        {
            "Target"        "%SOURCE"
            "Position"    "newPoint(1000, 1000, 0)"
        }

        "ModifyHexPassable"
        {
            "Hex" "positionHex(%TARGET)"
            "Passable" "0"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%sourcePosition"
                "Radius"     "expr(%aoe)"
                "Teams"     "TEAM_ALL"
                "ReferenceTeam" "unitGroup(%SOURCE)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {

                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "FireballHitFXMega" 
                    "Tags" "stringList(#AOE)"

                    "InitActions"
                    {
                        "Conditional"
                        {
                            "Condition" "isOnState(%HITTARGET, #WEAKENED)"

                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "randomI(expr(%minDamage), expr(%maxDamage))"
                                }

                                "MarkHitLegendary"
                                {
                                }
                            }

                            "ElseActions"
                            {
                                "AddDamage"
                                {
                                    "Type"            "DAMAGE_PHYSICAL"
                                    "Damage"        "randomI(expr(%minDamage), expr(%maxDamage))"
                                }
                            }
                        }
                    }

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_burning"
                            "Target"        "%HITTARGET"
                            "Duration"      "expr(%burnDuration)"
                            "Refresh"   "1"
                        }

                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "%sourcePosition"
                            "Strength" "1"
                        }
                    }
                }
            }
        }
    }


    "OnProjectileHitUnit"
    { 
        "StopSound"
        {
            "Sound"         "#krl_sfx_combatBarbarian_leapTravel"
        }

        "PlaySound"
        {
            "Sound"         "#krl_sfx_combatBarbarian_leapLand"
        }

        "AttachEffect"
        {
            "EffectName" "WoodBreakFXMega" 
            "Target" "%TARGET"
        } 

        "MoveUnit"
        {
            "Target"      "%SOURCE"
            "Position"    "%TARGET"
        }

        "RemoveModifier"
        {
            "ModifierName"    "disable_unit_modifier"
            "Target"         "%SOURCE"
        }

        "PlayActivityAnimation"
        {
            "Target" "%SOURCE"
            "Animation" "Land"
        }
    }
}


"rocket_jumpOLD"
{
    
    
    "AbilityBehavior"   "POINT_TARGET | AOE | NEEDS_CLEAR_TERRAIN"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "GenericHolyCastFXMega"
    "Icon" "RocketJump" 

    "AbilityAOETeamFilter" "TEAM_ALL"
    "AbilityAOERange" "expr(%aoe)"

    "AbilityAOEKind" "RANGE_CIRCLE"

    "AbilityAOECenterOnCaster" "1"

    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "expr(%range)"
    "AbilityCooldown"   "3"
 
    "AbilityAPCost"     "2"


   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "minDamage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "maxDamage"  "stat(%CASTER, #attackDamage)+1"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "range"  "6"
        }

        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "aoe"  "1"
        }
    }


    "OnAbilityAction" 
    {
        "AttachEffect"
        {
            "EffectName" "FireballExplosionFXMega" 
            "Target" "unitPosition(%SOURCE)"
        }

        "StartLogicTick"
        {
            "Time" "0.11"
            "TickType" "ActiveUnit "
            "Position" "unitPosition(%SOURCE)"
        }

        "ApplyModifier"
        {
            "ModifierName"    "disable_unit_modifier"
            "Target"         "%SOURCE"
        }

        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#sourcePosition"
            "Value" "unitPosition(%SOURCE)"
            "Type" "FIELD_OBJECT"
        }

        "Delay"
        {
            "Time" "0.1"
            "Actions"
            {
                "MoveUnit"
                {
                    "Target"        "%SOURCE"
                    "Position"    "newPoint(1000, 1000, 0)"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "%sourcePosition"
                        "Radius"     "expr(%aoe)"
                        "Teams"     "TEAM_ALL"
                        "ReferenceTeam" "unitGroup(%SOURCE)"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {

                        "Hit"
                        {
                            "Target" "%newTarget"
                            "EffectName" "FireballHitFXMega" 
                            "Tags" "stringList(#AOE)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "randomI(%minDamage, %maxDamage)"
                                }
                            }

                            "Actions"
                            {
                                "Knockback" 
                                {
                                    "Target" "%HITTARGET"
                                    "Center" "%sourcePosition"
                                    "Strength" "1"
                                }
                            }
                        }
                    }
                }

                "StartLogicTick"
                {
                    "Time" "1"
                    "TickType" "ActiveUnit"
                    "Position" "%TARGET"
                }
            }
        }

        "Delay"
        {
            "Time" "1"
            "Actions"
            {        
                "AttachEffect"
                {
                    "EffectName" "FireballExplosionFXMega" 
                    "Target" "%TARGET"
                }

                "MoveUnit"
                {
                    "Target"      "%SOURCE"
                    "Position"    "%TARGET"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"         "%SOURCE"
                }
            }
        }

    }
}



  
