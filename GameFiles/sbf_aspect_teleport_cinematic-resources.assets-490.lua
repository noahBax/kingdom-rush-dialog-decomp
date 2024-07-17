"sbf_aspect_teleport_cinematic"
{
    
    
    "AbilityBehavior"   ""
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "TeleportOut"
    

    "AbilityCastRange" "0"
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "0"
    


   
    "AbilitySpecial" 
    {
       
    }

    "OnAbilityStart"
    {
        "PlaySound"
        {
            "Unit" "%SOURCE"
            "Sound" "#teleportOut"
        }
    }

    "OnAbilityAction"
    { 
        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#hexa"
            "Value" "positionHex(cinematicPosition(stringConcat(#startpos_, unitConfigString(%TARGET, #aspectStat))))"
            "Type" "FIELD_OBJECT"
        }


        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#sourcePosition"
            "Value" "unitPosition(%SOURCE)"
            "Type" "FIELD_OBJECT"
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

        "Delay"
        {
            "Time" "2"
            "Actions"
            {
                "MoveUnit"
                {
                    "Target"      "%SOURCE"
                    "Position"    "hexPosition(%hexa)"
                }

                "PlayActivityAnimation"
                {
                    "Target" "%SOURCE"
                    "Animation" "TeleportIn"
                }

                "PlaySound"
                {
                    "Unit" "%SOURCE"
                    "Sound" "#teleportIn"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "disable_unit_modifier"
                    "Target"         "%SOURCE"
                }

                "Conditional"
                {
                    "Condition" "isOnState(%CASTER, #SBF_ASPECT_MAGIC)"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"  "sbf_aspect_magic_telegraph_fx_modifier"
                            "Target"        "%CASTER"
                        }
                    }
                }
            }
        }
    }
}


  
