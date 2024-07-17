






"icicle_rain"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | AOE"
    "AbilityCastRange" "5"
    "AbilityAOETeamFilter" "TEAM_ALL"
    "AbilityAOERange" "expr(%affectedRadius)"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "1"
    "AbilityCooldown"      "2"
    "AbilityAPCost"       "2"
    "AnimationID"   "SpecialAttack"
    "CastFXId" "IcelanceCastFXMega"
    "Icon" "IcicleRain" 

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"            "FIELD_FLOAT"
            "aoeRadius"            "1.2"
        }

        "02"
        {
            "var_type"          "FIELD_EXPRESSION"
            "damage"            "stat(%CASTER,#attackDamage)-1"
        }

        "03"
        {
            "var_type"          "FIELD_FLOAT"
            "duration"            "3"
        }

        "04"
        {
            "var_type"            "FIELD_FLOAT"
            "spawnIceRadius"            "0.5"
        }

         "05"
        {
            "var_type"            "FIELD_FLOAT"
            "fallRadius"            "2"
        }

        "06"
        {
            "var_type"            "FIELD_EXPRESSION"
            "affectedRadius"            "%fallRadius + %aoeRadius"
        }
    }




    "OnAbilityAction"
    {
        "CallFunction"
        {
            "Function" "Ironhide.Legends.Content.Abilities.IcicleRainScriptSpawnProjectiles"
            "Target"        "%TARGET"
            "CantProjectiles" "6"
            "AOERadius" "%fallRadius"
            "MinDistance" "%fallRadius * 0.5"
        }
    }
    

    "OnProjectileHitUnit"
    {
        "#DebugRange" 
        {
            "Center" "%TARGET"
            "Radius" "%aoeRadius"
        }


        "AttachEffect"
        {
            "EffectName" "IcicleExplosionFXMega" 
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
                "Damage"
                {
                    "Target"        "%newTarget"
                    "Type"            "DAMAGE_PHYSICAL"
                    "Damage"        "20"
                }


                "AttachEffect"
                {
                    "EffectName" "IceLanceHitFXMega" 
                    "Target" "%newTarget"
                }

                "Knockback" 
                {
                    "Target" "%newTarget"
                    "Center" "%TARGET"
                    "Strength" "0.2"
                }

            }
        }

        "#DebugRange"
        {
            "Center" "%TARGET"
            "Radius" "%spawnIceRadius"
        }

        "Conditional"
        {
            "Condition" "isGridClear(%TARGET, 1)"
            "Actions" 
            {
                "SpawnUnit"
                {
                    "UnitName" "#IcicleRainDummyUnit"
                    "Position" "%TARGET"
                    "UnitGroup" "unitGroup(%CASTER)"
                    "IsAI" "0"
                    "OnSpawn"
                    {
                         "ApplyModifier"
                        {
                            "ModifierName"    "modifier_icicle_rain_shard"
                            "Target"         "%UNIT"
                            "Duration"  "%duration"
                        }
                    }
                }
            }
        }
    }


    "Modifiers"
    {
        "modifier_icicle_rain_shard"
        {
            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"        "%TARGET"
                }
            }
        }
    }


}
