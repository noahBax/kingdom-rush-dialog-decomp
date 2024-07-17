"skeleton_knight_shield_bash"
{
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"
    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "2"
    "AbilityAPCost"     "1"

    "AnimationID"   "SpellCastB"
    "CastFXId" "SkeletonChampionShieldBashCastFXMega"
    "Icon" "ShieldBash"

    "AbilitySpecial"
    {
        "01" 
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "max(stat(%CASTER, #attackDamage)-1,1)"
        }

        "02" 
        {
           "var_type" "FIELD_EXPRESSION"
            "stunDurationSimple" "1"
        }

        "03" 
        {
            "var_type" "FIELD_EXPRESSION"
            "stunDurationExtra" "1" 
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "HeavyStrikeHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

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
                "ApplyModifier"
                {
                    "ModifierName"  "modifier_stunned"
                    "Target"        "%HITTARGET"
                    "Duration"      "expr(%stunDurationSimple)"
                    "Refresh"   "1"
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
