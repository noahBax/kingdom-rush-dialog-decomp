






"charge"
{
    
    
    "AbilityBehavior"   "POINT_TARGET | AOE | NEEDS_CLEAR_TERRAIN"

    "AnimationID"   "SpecialAttack"
    "CastFXId" "BullRushCastFXMega"
    "Icon" "Charge" 

    "AbilityAOETeamFilter" "TEAM_ENEMY"
    "AbilityAOERange" "0"

    "AbilityAOEKind" "RANGE_TUNNEL"
    "AbilityAOEWidth" "expr(%width)"

    "AbilityAOECenterOnCaster" "1"
    "AbilityAOEAffectsCaster" "0"

    "AbilityCastRange" "expr(%distanceToTravel)"
    "AbilityCooldown"   "3"
 
    "AbilityAPCost"     "2"


   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #attackDamage)-1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
           
            "distanceToTravel"  "4"
        }

        "03"
        {
            "var_type" "FIELD_EXPRESSION"
            "width"  "1"
        }

        "04"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"                "2"
        }
    }


    "OnAbilityAction" 
    {
        "TrackingProjectile"
        {
            "MoveSpeed"            "%projectile_speed"
            "Model" "BullRushProjectile"
            "TargetPos"             "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE)"




            "TargetFilter"
            {
                "Radius"     "0"
                "Teams"     "TEAM_ENEMY"
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
            }
        }

        "MoveUnit"
        {
            "Target"        "%SOURCE"
            "Position"    "newPoint(1000, 1000, 0)"
        }

    }

    "OnProjectileHitUnit" 
    {

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "BullRushHitFXMega" 
            "Tags" "stringList(#MELEE, #AOE)"

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
                "Knockback"  
                {
                    "Target" "%HITTARGET"
                    "Center" "%projectileOrigin"
                    "Strength" "0"
                }

                "ApplyModifier"
                {
                    "ModifierName"  "modifier_new_bleeding"
                    "Target"        "%HITTARGET"
                    "Duration"      "%duration"
                    "Refresh"   "1"
                    
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
            "Position"    "%TARGET"
        }
    }
}
