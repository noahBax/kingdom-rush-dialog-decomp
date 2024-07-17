






"thorn_trap"
{
    
    
    "AbilityBehavior"       "POINT_TARGET | NEGATIVE_EFFECT | AOE"
    "AbilityCastRange" "4"
    "AbilityCooldown"      "4"
    "AbilityAPCost"       "2"
    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "%rootRange"
    "AbilityAOEKind" "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster" "0"
	"AbilityAOEAffectsCaster" "1"


    "AnimationID"   "SpellCastB"
    "CastFXId" "ThornCastFXMega"
    "Icon" "BearTrap"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_FLOAT"
            "trapDuration" "3"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "rootDuration" "1"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "rootRange" "1"
        }

        "04"
        {
            "var_type" "FIELD_FLOAT"
            "activationTime" "1"  
        }



    }

    "OnAbilityAction"
    { 

        "SpawnUnit"
        {
           "UnitName" "#DummyUnitThornTrap"
           "Position" "%TARGET"
           "UnitGroup" "unitGroup(%CASTER)"
           "IsAI" "1"
           "InheritsInitiative" "1"
           "OnSpawn"
            {
                "ApplyModifier"
                {
                    "ModifierName"    "modifier_thorn_trap_monitor"
                    "Target"         "%UNIT"
                    "Duration"  "%trapDuration"
                }
           }
        }

        "DebugRange" 
        {
            "Center" "%TARGET"
            "Radius" "%rootRange"
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Source"        "%SOURCE"
                "Center"      "%TARGET"
                "Radius"     "%rootRange"
                "Teams"     "TEAM_ENEMY"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "InterruptUnit"
                {
                    "Target" "%newTarget"
                }


                "RemoveModifier"
                {
                    "ModifierName"    "modifier_thorn_trap"
                    "Target"         "%newTarget"
                }
                
                "ApplyModifier"
                {
                    "ModifierName"    "modifier_thorn_trap"
                    "Target"         "%newTarget"
                    "Duration"  "%rootDuration"
                }

               
            }
        }
    }

    "Modifiers"
    {
        "modifier_thorn_trap_monitor"
        {
            "OnRemoved"
            {
                "KillUnit"
                {
                    "Target"    "%TARGET"
                }
            }


            "OnUnitEnteredNode"
            {
               "AreaControl"
               {

                    "Center" "unitHex(%TARGET)"
                    "Range" "%rootRange"
                    "From" "%from"
                    "To" "%to"
                    "InRangeActionsEntered"
                    {

                        "Conditional" 
                        {
                            "Condition" "matchesTeam(unitGroup(%SOURCE), unitGroup(%UNIT), @TeamFilter(TEAM_ENEMY))"
                            "Actions"
                            {
                                "InterruptUnit"
                                {
                                    "Target" "%UNIT"
                                }

                                "RemoveModifier"
                                {
                                    "ModifierName"    "modifier_thorn_trap"
                                    "Target"         "%UNIT"
                                }
                                
                                "ApplyModifier"
                                {
                                    "ModifierName"    "modifier_thorn_trap"
                                    "Target"         "%UNIT"
                                    "Duration"  "%rootDuration"
                                }

                            }
                        }
                    }
               }
            }
        }

        "modifier_thorn_trap"
        {
            "EffectName" "ThornsStatusFXMega"

             "States"
            {
                "ROOTED" "1"
            }
        }
    }
}
