"bruxa_graveyard_kiss"
{
    "AbilityBehavior"                   "UNIT_TARGET"
    "AbilityTeamFilter"                 "TEAM_ENEMY"
    "AbilityCastRange"                  "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange"               "stat(%CASTER, #rangedAttackMinRange)"   
    "AbilityCooldown"                   "2"
    "AbilityAPCost"                     "2"
    "AbilityCanExecute"                 "stat(%SOURCE, #skulls) > 0"

    "AnimationID"                       "VoodooRitual"
    "Icon"                              "GraveyardKiss"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type"                  "FIELD_EXPRESSION"
            "damage"                    "ceil(stat(%CASTER, #attackDamage)*1.5) + stat(%CASTER, #skulls) -1"
            
        }
        "02"
        {
            "var_type"                  "FIELD_FLOAT"
            "skullRequirement"          "1" 
        }
    }

    "OnAbilityStart"
    {
        "Times"
        {
            "Times"                     "stat(%SOURCE, #skulls)"
            "Actions"
            {
                "AttachEffect"
                {
                    "EffectName"                "BruxaVoodooBombReleaseFXMega"
                    "Target"                    "%SOURCE"
                    "ReplaceAttach"             "stringList(#SKULL, stringWithIndex(#skull, %index + 1))"
                }
            }
        }

        
    }

    "OnAbilityAction"
    {
        "PlaySound"
        {
            "Sound"                 "#krl_sfx_combatBruxa_graveyardKissProjectile"
        }

        "TrackingProjectile"
        {
            "SourcePos"             "unitPosition(%SOURCE, #CastPoint)"
            "Target"                "%TARGET"
            "TargetPos"             "unitPosition(%TARGET, #Chest)"
            "InitialVelocity"       "pointMult(newPoint(0, 0, 5), randomBetween(6, 10))"
            "Model"                 "BruxaGraveyardKissProjectile"

            "Params" 
            {
                "damage" 
                {
                    "type"          "FIELD_FLOAT"
                    "value"         "expr(%damage)"
                }
            }
        }

        "RemoveModifier"
        {
            "ModifierTag"    "bruxa_skull"
            "Target"         "%SOURCE"
        }
    }

    "OnProjectileHitUnit"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "BruxaGraveyardKissHitFXMega" 
            "Tags"                  "stringList(#PROJECTILE, #MAGICAL)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "%damage"
                }
            }
        }
    }
}
