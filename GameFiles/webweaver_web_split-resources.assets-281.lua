"webweaver_web_split"
{
    "AbilityBehavior"       "UNIT_TARGET"
    "AbilityTeamFilter"     "TEAM_ENEMY"
    
    "AnimationID"           "SpecialAttack"
    "CastFXId"              "WebweaverWebSplitCastFXMega"
    "Icon"                  "WebSpit" 

    "AbilityCastRange"      "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"       "2"
    "AbilityAPCost"         "2"
   
    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"          "FIELD_FLOAT"
            "rootDuration"      "1"
        }

        "02"
        {
            "var_type"          "FIELD_FLOAT"
            "poisonDuration"    "1"
        }

        "03"
        {
            "var_type"          "FIELD_EXPRESSION"
            "damage"            "ceil(stat(%CASTER, #attackDamage)/2)"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damageTrue"
        }

    }

    "OnAbilityAction" 
    {
        "TrackingProjectile"
        {
            "Target"               "%TARGET"
            "SourcePos"            "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"            "unitPosition(%TARGET, #Chest)"
            "Model"                "WebweaverWebSplitProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type"              "FIELD_FLOAT" 
                    "value"             "expr(%damage)"
                }

                "rootDuration" 
                {
                    "type"              "FIELD_FLOAT" 
                    "value"             "%rootDuration"
                }

                "poisonDuration" 
                {
                    "type"              "FIELD_FLOAT" 
                    "value"             "%poisonDuration"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "WebweaverWebSplitHitFXMega" 
            "Tags"                  "stringList(#PROJECTILE, #TARGETED, #CANTBEBLOCKED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_TRUE"
                    "Damage"            "%damage"
                }
            }

            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_new_poison"
                    "Target"            "%HITTARGET"
                    "Duration"          "%poisonDuration"
                    "Refresh"           "1"
                }

                "ApplyModifier"
                {
                    "ModifierName"      "modifier_rooted"
                    "Target"            "%HITTARGET"
                    "Duration"          "%rootDuration"
                    "Refresh"           "1"
                }
            }
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight"            "2.5"
            "Considerations"
            {

                "Priorizacion Por Distance mas cercano"
                {
                    "Curve"                 "Linear|-0.1|1|1|0"
                    "Consideration"         "DistanceToTarget"
                    "Params"
                    {
                        "MaxRange"              "expr(%AbilityCastRange)"  
                    }
                }

                "Ignores targets already poisoned"
                {
                    "Curve"                 "Linear|-1|1|1|0"
                    "Consideration"         "TargetHasModifier"
                    "Params"
                    {
                        "ModifierName"          "modifier_new_poison"  
                    }
                }
            }
        }
    }
}
