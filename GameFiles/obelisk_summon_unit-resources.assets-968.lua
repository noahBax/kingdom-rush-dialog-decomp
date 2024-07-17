






"obelisk_summon_unit"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "MagicBoltCastFXMega"
    "Icon" "DarkSacrifice" 

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)*1.5"
    "AbilityCooldown"   "2"
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
            "Weight"                    "4"
            "Considerations"
            {
                "Close to enemies"
                {
                    "Curve" "Linear|100|1|100|1"
                    "Consideration" "InfluenceMap"
                    "Params"
                    {
                        "MapId" "#CloseToEnemies"  
                        "Max" "3"
                        "Min" "0"
                    }
                }

            }
        }
    }


}
