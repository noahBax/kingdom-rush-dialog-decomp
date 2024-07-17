"wbf_massive_tentacle_attack"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET "
    "AbilityTeamFilter" "TEAM_FRIENDLY"
    "AbilityTargetFilterFlags" "INCLUDE_NON_TARGETABLE"
    "AnimationID"   "Attack"
    "CastFXId"      "WBFMassiveTentacleAttackFXMega"
    "Icon" "massive_whip"

    "AbilityCastRange" "0"
    "AbilityCooldown"      "1"
    "AbilityAPCost"       "1"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "3"
        }
        "02"
        {
            "var_type"            "FIELD_FLOAT"
            "attackLength"            "3" 
        }
    }


    "OnAbilityAction"
    {
    	"CreateObjectList"
        {
            "Name" "#hexCandidates"
        }
        
        
        "AddObjectToList" 
        {
            "List" "%hexCandidates"
            "Value" "hexInLine(unitHex(%CASTER), hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), 0), 1)"
        }

        "AddObjectToList" 
        {
            "List" "%hexCandidates"
            "Value" "hexInLine(unitHex(%CASTER), hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), 0), 2)"
        }

        "AddObjectToList" 
        {
            "List" "%hexCandidates"
            "Value" "hexInLine(unitHex(%CASTER), hexNeighbour(unitHex(%CASTER), unitHexSide(%CASTER), 0), 3)"
        }

        "EachInList"
        {
            "List" "%hexCandidates"
            "IteratorName" "#hexa"
            "IteratorIndexName" "#hexaIndex"
            "Actions"
            {
                "AttachEffect"
                {
                    "EffectName" "BigBadaboomLandFXMega"
                    "Target" "hexPosition(%hexa)"
                }

                "ActOnTargets"
                {
                    "Target"
                    {
                        "Center"      "hexPosition(%hexa)"
                        "Radius"      "0"
                        "Teams"       "TEAM_ALL"
                    }

                    "IteratorName" "#newTarget"
                
                    "Actions"    
                    {
                        "Hit"
                        {
                            "Target" "%newTarget"
                            "EffectName" "BarbarianWhirlwindHitFXMega" 
                            "Tags" "stringList(#AOE)"
                  
		                    "InitActions"
		                    {
		                        "AddDamage"
		                        {
		                            "Type"          "DAMAGE_PHYSICAL"
		                            "Damage"        "expr(%damage)"
		                        }
		                        
		                    }
                        }
                    }
                }
            }
        }
        
    }


    "OnAbilityCustomEvent"
    {
        "Conditional"
        {
            "Condition" "equal(%customEvent, #AbilityGone)"

            "Actions" 
            {   
                "KillUnit"
                {
                    "Target"        "%CASTER"
                    "InstaKill" "1"
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
                "Priorizacion Por Distance mas cercano"
                {
                    "Curve" "Linear|-0.1|1|1|0"
                    "Consideration" "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange" "10"  
                    }
                }
            }
        }
    }
}
