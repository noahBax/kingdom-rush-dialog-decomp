"tesla_lightning_ball"
{
    "AbilityBehavior"               "UNIT_TARGET | AOE"
    "AbilityTeamFilter"             "TEAM_ENEMY"
    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"               "3"
    "AbilityAPCost"                 "2" 
   
    "AbilityAOEKind"                "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"      "0"
    "AbilityAOEAffectsCaster"       "1"
    "AbilityAOERange"               "%aoeRadius"

    "AnimationID"                   "Attack"
    "Icon"                          "LightningBall"
    "CastFXId"                      "TeslaSpellChargeFXMega"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_FLOAT"
            "aoeRadius"             "1"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "stat(%CASTER, #attackDamage)"
        }

        "03"
        {
            "var_type"              "FIELD_EXPRESSION"
            "sideDamage"            "1"
        }

        "04"
        {
            "var_type"              "FIELD_FLOAT"
            "stunDuration"          "1"
        }
    }

    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound" "#krl_sfx_teslaCombat_lightningBallProjectile"
        }
        
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "LightningBallProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type"              "FIELD_FLOAT"
                    "value"             "expr(%damage)"
                }

                "sideDamage" 
                {
                    "type"              "FIELD_FLOAT"
                    "value"             "expr(%sideDamage)"
                }

                 "stunDuration" 
                {
                    "type"              "FIELD_FLOAT"
                    "value"             "%stunDuration"
                }
            }
        }
    }
    
    "OnProjectileHitUnit"
    {
        "AttachEffect"
        {
            "EffectName"        "TeslaLightningBallExplosionFXMega" 
            "Target"            "%TARGET"
        }

        "Hit"
        {
            "Target"            "%TARGET"
            "EffectName"        "ShockingPresenceShockFXMega" 
            "Tags"              "stringList(#MAGICAL, #AOE)"

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
                "ApplyModifier"
                {
                    "ModifierName"      "modifier_stunned"
                    "Target"            "%TARGET"
                    "Duration"          "%stunDuration"
                    "Refresh"           "1"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "%TARGET"
                "Radius"                "%aoeRadius"
                "Teams"                 "TEAM_ENEMY"
                "ExcludedUnits"         "objectList(%TARGET)"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "ShockingPresenceShockFXMega" 
                    "Tags"              "stringList(#MAGICAL, #AOE)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "%sideDamage"
                        }
                    }
                }
            }
        }
    }
}
