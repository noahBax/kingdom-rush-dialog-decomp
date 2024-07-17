"bruxa_voodoo_bomb"
{
    "AbilityBehavior"                   "UNIT_TARGET | AOE"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "stat(%CASTER, #rangedAttackRange)-1"
    "AbilityCastMinRange"               "stat(%CASTER, #rangedAttackMinRange)"   
    "AbilityCooldown"                   "2"
    "AbilityAPCost"                     "1"
    "AbilityCanExecute"                 "stat(%SOURCE, #skulls) > 0"
    "AbilityAOETeamFilter"              "TEAM_ENEMY"
    "AbilityAOERange"                   "%aoeRadius"
    "AbilityAOEKind"                    "RANGE_CIRCLE"
    "AbilityAOECenterOnCaster"          "0"
    "AbilityAOEAffectsCaster"           "0"

    "AnimationID"                       "VoodooRitual"
    "Icon"                              "VoodooBomb"
    "CastFXId"                          "BruxaVoodooBombCastFXMega"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "damage"                    "ceil(stat(%CASTER, #attackDamage)/2)"
        }

        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "aoeRadius"                  "1"
        }

        "03"
        {
            "var_type"                  "FIELD_FLOAT"
            "skullsConsumed"                  "1" 
        }
    }

    "OnAbilityStart"
    {
        "AttachEffect"
        {
            "EffectName"                "BruxaVoodooBombReleaseFXMega"
            "Target"                    "%SOURCE"
            "ReplaceAttach"             "stringList(#SKULL, stringWithIndex(#skull, stat(%SOURCE, #skulls))"
        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, stringWithIndex(#skull, stat(%SOURCE, #skulls)))"
            "Target"                "%TARGET"
            "TargetPos"             "unitPosition(%TARGET)"
            "InitialVelocity"       "pointMult(newPoint(0, 0, 5), randomBetween(6, 10))"
            "Model"                 "BruxaVoodooBombProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }

                "aoeRadius" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "%aoeRadius"
                }
            }
        }

        "RemoveModifier"
        {
            "ModifierName"    "bruxa_laughing_skulls_trait_modifier"
            "Target"          "%SOURCE"
            "Last"            "1"
        }

        "RemoveModifier"
        {
            "ModifierName"    "bruxa_laughing_skulls_trait_fx_modifier"
            "Target"          "%SOURCE"
            "Last"            "1"
        }
    }

    "OnProjectileHitUnit"
    {   
        "AttachEffect"
        {
            "EffectName"        "BruxaVoodooBombExplosionFXMega"
            "Target"            "unitPosition(%TARGET)"
        } 

        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "%TARGET"
                "ExcludedUnits"     "objectList(%SOURCE)"
                "Radius"            "%aoeRadius"
                "Teams"             "TEAM_ENEMY"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"                "%newTarget"
                    "Tags"                  "stringList(#PROJECTILE, #MAGICAL)"

                    "InitActions"
                    {
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_MAGICAL"
                            "Damage"        "%damage"
                        }
                    }
                }
            }
        }
    }


}
