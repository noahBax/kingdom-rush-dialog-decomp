"arcane_mage_disintegrate"
{
    "AbilityBehavior"               "UNIT_TARGET"
    "AbilityTeamFilter"             "TEAM_ENEMY"

    "AnimationID"                   "SpellCastA"
    "CastFXId"                      "ArcaneMageDesintegrateCastFXMega"
    "Icon"                          "Disintegrate"

    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"               "3"
    "AbilityAPCost"                 "2"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_INTEGER"
            "duration"              "2"
        }
        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "ceil(stat(%CASTER, #health_max) * 2.5)"

        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #RayPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "ArcaneDesintegrateRayProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }

                "duration" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "%duration"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "StopSound"
        {
            "Sound" "#krl_sfx_combatArcaneMage_arcaneRay_loop"
        }
        
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "ArcaneMageDesintegrateHitFXMega"
            "Tags"                  "stringList(#RAY, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_MAGICAL"
                    "Damage"        "%damage"
                }
            }
        }

        "ApplyModifier"
        {
            "ModifierName"          "modifier_stunned"
            "Target"                "%CASTER"
            "Duration"              "%duration"
        }

        "AttachEffect"
        {
            "EffectName" "StunHitFXMega"
            "Target" "%CASTER"
        }
    }
}
