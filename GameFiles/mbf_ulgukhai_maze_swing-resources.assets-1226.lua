"mbf_ulgukhai_maze_swing"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | NEGATIVE_EFFECT | AOE"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "Attack"
    "CastFXId" "UlgukMazeSwingCastFXMega"
    "Icon" "MaceSwing"

   
    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%aoeRadius"
    "AbilityAOEKind" "RANGE_CIRCLE"

    "AbilityAOECenterOnCaster" "0"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "2"
    "AbilityAPCost"       "2"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER, #attackDamage)"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "aoeRadius" "1"
        }
    }


    "OnAbilityAction"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "%aoeRadius"
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "ArcaneTowerSuperBeamHitFXMega" 
                    "Tags" "stringList(#MELEE, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%damage)"
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

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "4"
            "Considerations"
            {

                "surrounded by several units"
                {
                    "Curve" "Logistic|500|5|-4|0.05"
                    "Consideration" "UnitsAffected"
                    "Params"
                    {
                        "Max" "5"  
                        "TeamFilter" "TEAM_ENEMY"
                    }
                }
            }
        }
    }
}
