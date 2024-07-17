"darkknight_soulstrike" 
{
     
    
    "AbilityBehavior"   "MELEE"
    "AbilityTeamFilter" "TEAM_ENEMY"

    "AnimationID"   "SpellCastD"
    "CastFXId" "DarkKinghtSoulStrikeCastFXMega"
    "Icon" "DarkSmite"

    "AbilityCastRange" "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"   "4"
    "AbilityAPCost"     "2"

   

    "AbilitySpecial"
    {


        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #attackDamage)"
        }


        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "healthGain"                "ceil(stat(%CASTER, #attackDamage)/2)"
        }
    }



    "OnAbilityAction"
    {

        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#toHeal"
            "Value" "expr(%healthGain)"
            "Type" "FIELD_FLOAT"
        }

        "Hit"
        {
            "Target" "%TARGET"
            "EffectName" "SoulStrikeHitFXMega" 
            "Tags" "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "Conditional"
                {
                    
                    "Condition" "isOnState(%HITTARGET, #WEAKENED)"

                    "Actions" 
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_TRUE"
                            "Damage"        "expr(%damage)"
                        }

                        "MarkHitLegendary"
                        {
                        }
                    }

                    "ElseActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%damage)"
                        }
                    }
                }
            }

            "Actions"
            {
                "Heal"
                {
                    "Target"        "%HITSOURCE"
                    "HealAmount"    "%toHeal"
                }

                "AttachEffect"
                {
                    "EffectName" "HealingFXMega"
                    "Target" "%HITSOURCE"
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
