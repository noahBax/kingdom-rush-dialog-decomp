"sylvan_elf_thrust"
{
    "AbilityBehavior"           "MELEE"
    "AbilityTeamFilter"         "TEAM_ENEMY"
    "AbilityCastRange"          "stat(%CASTER, #meleeRange)"
    "AbilityCooldown"           "0"
    "AbilityAPCost"             "1"
    "AnimationID"               "Attack"
    "Icon"                      "Thrust"
    "CastFXId"                  "SylvanElfThrustCastFXMega"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "closeDamage"           "stat(%CASTER, #attackDamage)+1"
        }

        "02"
        {
            "var_type"              "FIELD_EXPRESSION"
            "farDamage"             "ceil(stat(%CASTER, #attackDamage)*0.75)"
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
            "EffectName"            "SylvanElfThrustHitFXMega" 
            "Tags"                  "stringList(#MELEE, #TARGETED)"

            "InitActions"
            {
                "AddDamage"
                {
                    "Type"          "DAMAGE_PHYSICAL"
                    "Damage"        "expr(%closeDamage)"
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
                    "EffectName"        "SylvanElfThrustHitFXMega" 
                    "Tags"              "stringList(#MELEE, #TARGETED)"

                    "InitActions"
                    {
                        
                        "AddDamage"
                        {
                            "Type"          "DAMAGE_PHYSICAL"
                            "Damage"        "expr(%farDamage)"
                        }
                    }
                }
            }
        }
    }
}
