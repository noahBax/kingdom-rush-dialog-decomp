"sylvan_elf_spear_rush"
{
    "AbilityBehavior"           "MELEE"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"           "3"
    "AbilityAPCost"             "stat(%CASTER, #attackCostAP)"
    "AnimationID"               "SpecialAttack"
    "Icon"                      "SpearRush"
    "CastFXId"                  "SylvanElfSpearRushCastFXMega"
    "AbilityCanExecute"         "stat(%CASTER, #walkSpeedUsed) > 0"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "damage"                "stat(%CASTER, #attackDamage) * 1.5"
        }
        "20"
        {
            "var_type" "FIELD_STRING"
            "iconDamageType"  "damagePhysical"
        }
    }

    "OnCustomTargeting"
    {
        "ActOnTargets"
        {
            "Target"
            {
                "Center"            "hexPosition(hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), 3))"
                "Radius"            "0"
                "Teams"             "TEAM_ENEMY"
                "ExcludedUnits"     "objectList(%SOURCE)"
            }

            "IteratorName"          "#newTarget"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Unit"          "%newTarget"
                }
            }
        }

        "ActOnHexas"
        {
            "Center"                "hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), 3)"
            "Range"                 "0"
            "IteratorName"          "#hexa"
        
            "Actions"    
            {
                "AddAsAffected"
                {
                    "Hexa"          "%hexa"
                }
            }
        }
    }

    "OnAbilityAction"
    {
        "Hit"
        {
            "Target"                "%TARGET"
            "EffectName"            "SylvanElfSpearRushHitFXMega" 
            "Tags"                  "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"              "DAMAGE_PHYSICAL"
                    "Damage"            "expr(%damage)"
                }
            }
        }

        "ActOnTargets"
        {
            "Target"
            {
                "Center"                "hexPosition(hexNeighbour(unitHex(%TARGET), unitHex(%SOURCE), 3))"
                "Radius"                "0"
                "Teams"                 "TEAM_ENEMY"
                "ExcludedUnits"         "objectList(%SOURCE)"
            }

            "IteratorName"              "#newTarget"
        
            "Actions"    
            {
                "Hit"
                {
                    "Target"            "%newTarget"
                    "EffectName"        "SylvanElfSpearRushHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%damage)"
                        }
                    }
                }
            }
        }
    }
}
