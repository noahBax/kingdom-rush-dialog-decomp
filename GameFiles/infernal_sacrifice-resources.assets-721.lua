"infernal_sacrifice"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCast"
    "CastFXId" "DemonsInfernalSacrificeCastFXMega"
    "Icon" "AbominableSacrifice"

    "AbilityCastRange" "0"
    "AbilityCooldown"     "2"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "aoe"  "1"
        }

        "02"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "stat(%CASTER, #infernalSacrificeDamage)"
        }

        "03"
        {
            "var_type" "FIELD_FLOAT"
            "healthValue"  "1"
        }
    }

    "OnAbilityAction"
    {
        "SetToContext"
        {
            "Context" "currentContext()"
            "Key" "#damageToDo"
            "Value" "expr(%damage)"
            "Type" "FIELD_FLOAT"
        }

        "KillUnit"
        {
            "Target"        "%TARGET"
            "InstaKill" "1"
        }

       "ActOnTargets"
        {
            "Target"
            {
                "Center"      "%TARGET"
                "Radius"     "expr(%aoe)"
                "Teams"     "TEAM_ALL"
                "ReferenceTeam" "unitGroup(%TARGET)"
            }

            "IteratorName" "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target" "%newTarget"
                    "EffectName" "FireballHitFXMega" 
                    "Tags" "stringList(#AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "%damageToDo"
                        }
                    }

                    "Actions"
                    {
                        "Knockback" 
                        {
                            "Target" "%HITTARGET"
                            "Center" "unitPosition(%HITSOURCE)"
                            "Strength" "1"
                        }

                    }
                }
            }
        }

        "AttachEffect"
        {
            "EffectName" "FireballExplosionFXMega" 
            "Target" "unitPosition(%TARGET)"
        }
    }


    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "300"
            "Considerations"
            {
                "Has 1 remaining health"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "CurrentHealth"
                    "Params"
                    {
                        "Health" "%healthValue" 
                    }
                }

                "next to an enemy"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitsSurrounding"
                    "Params"
                    {
                        "Max" "1"  
                        "TeamFilter" "TEAM_ENEMY"
                        "Range" "1"
                    }
                }

            }
        }
    }
}
