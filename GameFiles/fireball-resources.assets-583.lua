






"fireball"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | AOE | NEEDS_VALID_TERRAIN"
    "AbilityAOETeamFilter" "TEAM_ALL"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "FireballCastFXMega"
    "Icon" "Fireball"
   
   
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"

    "AbilityAOERange" "%aoeRadius"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "2"



    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "aoeRadius"            "1"
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"
            "damage"            "ceil(stat(%CASTER,#attackDamage)/2)"
        }

        "03"
        {
            "var_type"          "FIELD_EXPRESSION"
            "extraDamage"            "2"
        }

        "04"
        {
            "var_type"            "FIELD_FLOAT"
            "burnDuration"         "1"
        }

        "05"
        {
            "var_type"            "FIELD_FLOAT"
            "floorDuration"       "3"
        }
    }




    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "%TARGET"
            "Model" "FireballProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%damage)"
                }

                "extraDamage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%extraDamage)"
                }

                 "floorDuration" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "%floorDuration"
                }
            }
        }
    }
    

    "OnProjectileHitUnit"
    {
        "AttachEffect"
        {
            "EffectName" "FireballExplosionFXMega"
            "Target" "%TARGET"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ALL"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "FireballHitFXMega" 
                    "Tags" "stringList(#MAGICAL, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"            "DAMAGE_PHYSICAL"
                            "Damage"        "%damage"
                        }

                        "Conditional"
                        {
                            "Condition" "isOnState(%HITTARGET, #WEAKENED)"
                            

                            "Actions" 
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_PHYSICAL"
                                    "Damage"        "%extraDamage"
                                }

                                "MarkHitLegendary"
                                {
                                }
                            }
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "%TARGET" 
                            "Strength" "1"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"  "modifier_burning"
                            "Target"        "%HITTARGET"
                            "Duration"      "%burnDuration"
                            "Refresh"   "1"
                        }
                    }
                }
            }
        }

        
        
        "SpawnUnit"
        {
            "UnitName" "#DummyUnit"
            "Position" "%TARGET"
            "UnitGroup" "unitGroup(%CASTER)"
            "IsAI" "0"
            "Nick" "#FireballFloorController"
            "InheritsInitiative" "1"
            "OnSpawn"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "remove_another_unit_modifier"
                    "Target"         "%UNIT"
                    "Duration"  "%floorDuration"
                    "Params"
                    {
                        "UNIT" {
                            "type" "FIELD_OBJECT"
                            "value" "%UNIT"
                        }
                    }
                }

                "SetToContext"
                {
                    "Context" "projectileContext(%projectile)"
                    "Key" "#controllerUnit"
                    "Value" "%UNIT"
                    "Type" "FIELD_OBJECT"
                }
            }
        }

        "ActOnHexas"
        {
            "Center" "positionHex(%TARGET)"
            "Range" "%aoeRadius"
            "IteratorName" "#hexa"
        
            "Actions"    
            {
                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"    "hexPosition(%hexa)"
                        "Radius"    "0"
                        "Teams"     "TEAM_ALL"
                        "Flags"     "INCLUDE_NON_TARGETABLE"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "RemoveModifier"
                        {
                            "ModifierTag"    "floor_effect"
                            "Target"         "%newTarget"
                        }
                    }
                }

                "SpawnUnit"
                {
                    "UnitName" "#DummyUnit"
                    "Position" "hexPosition(%hexa)"
                    "UnitGroup" "unitGroup(%CASTER)"
                    "IsAI" "0"
                    "Nick" "#FireballFloor"
                    "InheritsInitiative" "1"
                    "OnSpawn"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"    "fire_floor_tile_modifier"
                            "Target"         "%UNIT"
                        }

                        "ApplyModifier"
                        {
                            "ModifierName"    "remove_another_unit_modifier"
                            "Target"         "wrapContext(projectileContext(%projectile), %controllerUnit)"
                            "Params"
                            {

                                "UNIT" {
                                    "type" "FIELD_OBJECT"
                                    "value" "%UNIT"
                                }
                            }
                        }

                    }
                }
            }
        }
    }


}
