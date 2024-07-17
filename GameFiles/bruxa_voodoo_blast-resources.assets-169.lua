"bruxa_voodoo_blast"
{
    "AbilityBehavior"               "UNIT_TARGET"
    "AbilityTeamFilter"             "TEAM_ENEMY"
    "AbilityCastRange"              "stat(%CASTER, #rangedAttackRange) -1 "
    "AbilityCastMinRange"           "stat(%CASTER, #rangedAttackMinRange)" 
    "AbilityCooldown"               "0"
    "AbilityAPCost"                 "stat(%CASTER, #attackCostAP)"

    "AnimationID"                   "VoodooRitual"
    "Icon"                          "VoodooBlast"
    "CastFXId"                      "BruxaVoodooBlastCastFXMega"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "stat(%CASTER, #attackDamage) + ceil(stat(%CASTER, #skulls)/2) - 1"
        }
    }

    "OnAbilityAction"
    {
        "TrackingProjectile"
        {
            "Target"                "%TARGET"
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "Model"                 "BruxaVoodooBlastProjectile"

            "Params" 
            {
                "damage" 
                { 
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }
            }
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "BruxaVoodooBlastHitFXMega" 
            "Tags"                  "stringList(#PROJECTILE, #TARGETED, #MAGICAL)"

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
