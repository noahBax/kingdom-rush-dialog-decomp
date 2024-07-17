"mbf_healingcrystal_detroyed_link"
{
    "AbilityBehavior"       "UNIT_TARGET | PASSIVE"
    "Icon" "ShieldOfShadows"

    "AbilitySpecial"
    {
        "01"
        {
            "var_type" "FIELD_EXPRESSION"
            "damage"  "3"
        }
    }

    "Modifiers"
    {
        "mbf_healingcrystal_detroyed_link"
        {
            "OnRemoved"
            {
                "Conditional"
                {
                    "Condition" "isOnState(%TARGET, #DEAD)"
                    "Actions"
                    {
                        "QueueHit"
                        {
                            "Target" "%linkedTarget"
                            "EffectName" "BarbarianWhirlwindHitFXMega" 
                            "Tags" "stringList(#INTERNAL)"

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
    }
}

