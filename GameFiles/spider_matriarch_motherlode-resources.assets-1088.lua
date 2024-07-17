






"spider_matriarch_motherlode"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpellCastA"
    "CastFXId" "MatriarchMotherlodeCastFXMega"
    "Icon" "Motherlode" 

    "AbilityCastMinRange" "2"
    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"

   
    "AbilitySpecial" 
    {

        "01"
        {
            "var_type" "FIELD_FLOAT"
            "duration"  "1"
        }


        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius"  "1"
        }
        
        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "totalDamage"  "stat(%CASTER, #attackDamage)"
        }

        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "hitDamage"  "expr(%totalDamage)"
        }
        "05"
        {
            "var_type" "FIELD_FLOAT"
            "minRandom"  "1"
        }
        "06"
        {
            "var_type" "FIELD_FLOAT"
            "maxRandom"  "2"
        }

    }


    "OnAbilityAction" 
    {
        "ActOnHexas"
        {
            "Center" "unitHex(%TARGET)"
            "Range" "%aoeRadius"
            "IteratorName" "#hexa"
            "Max" "1"
            "Random" "1"
            
            "Actions"
            {
                "TrackingProjectile"
                {
                    "Target"               "%TARGET"
                    "SourcePos"            "unitPosition(%SOURCE, #Chest)"
                    "TargetPos"            "unitPosition(%TARGET, #Chest)"
                    "Model"                "SpiderMatriarchMotherlodeProjectile"
                    
                    "WillHit" "hitChanceCalc(%TARGET)"
                    "MissPosition" "unitPosition(%TARGET)"

                    "Params" 
                    {
                        "damage" 
                        {
                            "type" "FIELD_FLOAT" 
                            "value" "expr(%hitDamage)"
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
            "Target" "%TARGET"
            "EffectName" "MatriarchMotherlodeHitFXMega" 
            "Tags" "stringList(#PROJECTILE, #TARGETED, #CANTBEBLOCKED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"            "DAMAGE_PHYSICAL" 
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {
                "ActOnHexas"
                {
                    "Center" "unitHex(%TARGET)"
                    "Range" "1"
                    "IteratorName" "#hexa"
                    "RequireEmpty" "1"
                    "Max" "randomI(%minRandom, %maxRandom)"
                    "Random" "1"

                    "Actions"
                    {
                        "SpawnUnit"
                        {
                            "UnitName" "#Spiderling"
                            "Position" "hexPosition(%hexa)"
                            "UnitGroup" "@UnitGroup(BadSide)"

                            "IsAI" "1"
                            "Nick" "#NextToEnemeyExample"
                            "AddToInitiativeOrder" "1"
                            "OnSpawn"
                            {
                                "#PlayActivityAnimation"
                                {
                                    "Target" "%UNIT"
                                    "Animation" "Spawn"
                                }
                               

                                "#AttachEffect"
                                {
                                    "EffectName" "SummonCultistSmokeFXMega"
                                    "Target" "%UNIT"
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
            "Weight" "2.5"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "expr(%AbilityCastRange)"  
                    }
                }


            }
        }
    }


}
