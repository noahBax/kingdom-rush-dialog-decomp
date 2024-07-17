






"summon_next_to_enemy"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "PoisonShotCastFXMega"

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "2"
    "AbilityAPCost"     "2"

    

   
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
        

    }


    "OnAbilityAction" 
    {
        "ActOnHexas"
        {
            "Center" "unitHex(%TARGET)"
            "Range" "%aoeRadius"
            "IteratorName" "#hexa"
            "RequireEmpty" "1"
            "Max" "1"
            "Random" "1"
            
            "Actions"    
            {
                "SpawnUnit"
                {
                    "UnitName" "#CultistAbomination"
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
                       

                        "AttachEffect"
                        {
                            "EffectName" "SummonCultistSmokeFXMega"
                            "Target" "%UNIT"
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
