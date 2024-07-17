






"summon_barrel"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET"
    "AbilityTeamFilter" "TEAM_ENEMY"
    
    "AnimationID"   "SpecialAttack"
    "CastFXId" "FireballCastFXMega"

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"   "1"
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
                    "UnitName" "#ExplosiveBarrel"
                    "Position" "hexPosition(%hexa)"
                    "UnitGroup" "@UnitGroup(OwnSide)"

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
                        "ApplyModifier"
                        {
                            "ModifierName"    "damage_on_remove_modifier"
                            "Target"         "%UNIT"
                            "Duration"  "1"
                            "Params"
                            {

                                "damage" {
                                    "type" "FIELD_FLOAT"
                                    "value" "1"
                                }
                            }
                        }

                        "AttachEffect"
                        {
                            "EffectName" "GenericReviveFXMega"
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
