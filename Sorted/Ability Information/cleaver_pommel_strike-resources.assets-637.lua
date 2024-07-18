






"cleaver_pommel_strike"
{
    
    
    "AbilityBehavior"       "MELEE | HAS_CHANCE_TO_HIT"
    "AbilityTeamFilter" "TEAM_ENEMY"

    "AnimationID"   "SpellCastB"
    "CastFXId"  "StunCastFXMega"
    "Icon" "PommelStrike"

    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"      "2"
    "AbilityAPCost"        "1"


     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage" "stat(%CASTER,#attackDamage)"
        }

        "02"
        {
            "var_type" "FIELD_INTEGER"
            "duration" "1"
        }
    }


    "OnAbilityAction"
    {
        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "StunHitFXMega" 
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
                "RemoveModifier"
                {
                    "ModifierName"    "modifier_stunned"
                    "Target"         "%HITTARGET"
                }

                "ApplyModifier"
                {
                    "ModifierName"  "modifier_stunned"
                    "Target"        "%HITTARGET"
                    "Duration"      "%duration"
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

                "Ignores targets already stunned"
                {
                    "Curve" "Linear|-1|1|1|0"
                    "Consideration" "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName" "modifier_stunned"  
                    }
                }
            }
        }
    }



}
