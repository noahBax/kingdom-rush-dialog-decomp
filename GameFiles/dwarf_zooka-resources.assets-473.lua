"dwarf_zooka"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | AOE"
    "AbilityTeamFilter" "TEAM_ENEMY"

    "AnimationID"   "SpecialAttack"
    "Icon" "Dwarfzooka"
    "CastFXId" "DwarfzookaCastFXMega"
   
   
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"
    "AbilityAOETeamFilter" "TEAM_ENEMY"

    "AbilityAOERange" "%aoeRadius"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange) +2"
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
            "directDamage"            "stat(%CASTER,#attackDamage)"
        }

         "03"
        {
            "var_type"          "FIELD_EXPRESSION"
            "splashDamage"            "1"
        }

         "04"
        {
            "var_type"          "FIELD_EXPRESSION"
            "backBlastDamage"            "1"
        }

        "05"
        {
            "var_type" "FIELD_INTEGER"
            "duration" "1"
        }
    }

    "OnCustomTargeting"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "hexPosition(hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), 3))"
                "Radius"     "0"
                "Teams"     "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit" "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center" "hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), 3)"
            "Range" "0"
            "IteratorName" "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa" "%hexa"
                }
            }
        }
    }


    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatBombardier_dwarfzookaProjectile"
        }

        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model" "BombardierDwarfZookaProjectile"

            "Params" 
            {
                "directDamage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%directDamage)"
                }

                "splashDamage" 
                {
                    "type" "FIELD_FLOAT"
                    "value" "expr(%splashDamage)"
                }

                "startPosition"
                {
                    "type" "FIELD_OBJECT"
                    "value" "unitPosition(%SOURCE)"
                }

                "duration"
                {
                    "type" "FIELD_INTEGER"
                    "value" "%duration"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "hexPosition(hexNeighbour(unitHex(%SOURCE), unitHex(%TARGET), 3))"
                "Radius"     "0"
                "Teams"     "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
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
                            "Type"            "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%backBlastDamage)"
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%HITSOURCE)"
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
            "Sound"         "#krl_sfx_combatBombardier_dwarfzookaProjectile"
        }
        
        "AttachEffect"
        {
            "EffectName" "DwarfzookaExplosionFXMega"
            "Target" "unitPosition(%TARGET, #Base)"
        }

        "Hit"
        {
            "Target" "%TARGET"
            "Tags" "stringList(#PROJECTILE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"            "DAMAGE_PHYSICAL"
                    "Damage"        "%directDamage"
                }
            }

            "Actions"
            {
                "Knockback" 
                {
                    "Target" "%HITTARGET"
                    "Center" "%startPosition"
                    "Strength" "1"
                }

                "ApplyModifier"
                {
                    "ModifierName"  "modifier_burning"
                    "Target"        "%HITTARGET"
                    "Duration"      "%duration"
                    "Refresh"   "1"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "unitPosition(%TARGET)"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ENEMY"
                "ExcludedUnits" "objectList(%TARGET)"
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
                            "Type"            "DAMAGE_PHYSICAL"
                            "Damage"        "%splashDamage"
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%TARGET)"
                            "Strength" "1"
                        }
                    }
                }
            }
        }
    }
}
