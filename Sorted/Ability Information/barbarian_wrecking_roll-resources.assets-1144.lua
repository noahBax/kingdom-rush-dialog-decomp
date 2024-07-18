"barbarian_wrecking_roll"
{
    "AbilityBehavior"                       "POINT_TARGET | AOE | NEEDS_CLEAR_TERRAIN | NEEDS_CLEAR_LINE_OF_SIGHT_EXCEPT_UNITS"
    "AnimationID"                           "Attack"
    "CastFXId"                              "BarbarianWreckingRollCastFXMega"
    "Icon"                                  "WreckingRoll" 

    "AbilityAOETeamFilter"                  "TEAM_ENEMY"
    "AbilityAOERange"                       "0"
    "AbilityAOEKind"                        "RANGE_TUNNEL"
    "AbilityAOEWidth"                       "1"
    "AbilityAOECenterOnCaster"              "1"
    "AbilityAOEAffectsCaster"               "0"
    "AbilityCastRange"                      "%distanceToTravel"
    "AbilityCooldown"                       "3"
    "AbilityAPCost"                         "1"
   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"                      "FIELD_FLOAT"
            "damage"                        "3"
        }

        "02"
        {
            "var_type"                      "FIELD_FLOAT"
            "distanceToTravel"              "4"
        }

        "04"
        {
            "var_type"                      "FIELD_INTEGER"
            "stunDuration"                 "1"
        }
    }

    "OnAbilityStart"
    {
        "StartLogicTick"
        {
            "Time"                          "2"
            "TickType"                      "PriorityCenter"
            "Position"                      "%TARGET"
        }
    }

    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_combatBarbarian_wreckingRollProjectile"
        }

        "TrackingProjectile"
        {
            "Model"                 "BarbarianWreckingRollProjectile"
            "TargetPos"             "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE)"

            "TargetFilter"
            {
                "Radius"            "0"
                "Teams"             "TEAM_ALL"
                "ExcludedUnits"     "objectList(%SOURCE)"
                "Width"             "1"
                "Kind"              "RANGE_TUNNEL"
            }

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT" 
                    "value"         "%damage"
                }

                "stunDuration" 
                {
                    "type"          "FIELD_FLOAT" 
                    "value"         "%stunDuration"
                }
            }
        }

        "MoveUnit"
        {
            "Target"                "%SOURCE"
            "Position"              "newPoint(1000, 1000, 0)"
        }

    }

    "OnProjectileHitUnit" 
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "BullRushHitFXMega" 
            "Tags"                  "stringList(#MELEE, #AOE)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
            }

            "Actions"
            {
                "Conditional"
                {
                    "Condition" "not(isOnState(%HITTARGET, #DEAD))"

                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "modifier_stunned"
                            "Target"            "%TARGET"
                            "Duration"          "%stunDuration"
                        }
                    }
                }
            }
        }

        "KeepProjectileGoing"
        {
        }
    }

    "OnProjectileDestinationReached" 
    {
        "MoveUnit"
        {
            "Target"        "%SOURCE"
            "Position"      "%TARGET"
        }

        "StopSound"
        {
            "Sound"         "#krl_sfx_combatBarbarian_wreckingRollProjectile"
        }

        "PlaySound"
        {
            "Sound"         "#krl_sfx_combatBarbarian_wreckingRollProjectile_end"
        }
    }
}
