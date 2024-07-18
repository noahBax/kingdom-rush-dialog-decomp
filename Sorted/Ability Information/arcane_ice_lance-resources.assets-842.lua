"arcane_ice_lance"
{
    
    
    "AbilityBehavior"   "POINT_TARGET | AOE"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "IcelanceCastFXMega"
    "Icon" "IceLance" 

    "AbilityAOETeamFilter" "TEAM_ALL"
    "AbilityAOERange" "expr(%distanceToTravel)"

    "AbilityAOEKind" "RANGE_TUNNEL"
    "AbilityAOEWidth" "expr(%width)"

    "AbilityAOECenterOnCaster" "1"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "expr(%distanceToTravel)"
    "AbilityCooldown"   "3"
    "AbilityAPCost"     "1"


   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "allyDamage"  "0"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "duration"  "2"
        }

        "04"
        {
            "var_type" "FIELD_EXPRESSION"
            "allyDuration"  "1"
        }

        "05"
        {
            "var_type" "FIELD_EXPRESSION"
            "distanceToTravel"  "stat(%CASTER, #rangedAttackRange)"
        }

        "06"
        {
            "var_type" "FIELD_EXPRESSION"
            "width"  "1"
        }
    }


    "OnAbilityAction" 
    {
        "TrackingProjectile"
        {
            "Model" "ArcaneIceLanceProjectile"
            "DistanceToTravel" "expr(%distanceToTravel)"
            "TargetPos"             "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE)"




            "TargetFilter"
            {
                "Radius"     "0"
                "Teams"     "TEAM_ALL"
                "ExcludedUnits" "objectList(%SOURCE)"
                "Width" "expr(%width)"
                "Kind" "RANGE_TUNNEL"
            }

            "Params" 
            {
                "damage" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%damage)"
                }

                "allyDamage" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%allyDamage)"
                }

                "duration" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%duration)"
                }

                "allyDuration" 
                {
                    "type" "FIELD_FLOAT" 
                    "value" "expr(%allyDuration)"
                }
            }
        }

    }

    "OnProjectileHitUnit" 
    {

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "IceLanceHitFXMega" 
            "Tags" "stringList(#MAGICAL, #TARGETED, #PROJECTILE, #FREEZEDAMAGE)"


            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_TRUE" 
                    "Damage"        "matchesTeam(unitGroup(%HITSOURCE), unitGroup(%HITTARGET), @TeamFilter(TEAM_ENEMY)) ? %damage : %heroDamage"
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
                            "ModifierName"  "modifier_new_freeze"
                            "Target"        "%HITTARGET"
                            "Duration"      "matchesTeam(unitGroup(%HITSOURCE), unitGroup(%HITTARGET), @TeamFilter(TEAM_ENEMY)) ? %duration : %allyDuration"
                            "Refresh"   "1"
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
         "AttachEffect"
        {
            "EffectName" "IceLanceProjectileEndFXMega" 
            "Target" "%projectilePosition"
        }
    }
}
