"mbf_harbinger_glare_barrier_trait"
{
    "AbilityBehavior"       "UNIT_TARGET | PASSIVE"
    "Icon" "GlareBarrier"

     "AbilitySpecial"
    {
       
    }

    "Modifiers"
    {
        "mbf_harbinger_glare_barrier_trait_modifier"
        {
           "Passive" "1"

            "OnHitPreProcessDamages"
            {
                "Conditional"
                {
                    "Condition" "not(hasTags(hitTags(%HIT), #GLARE_SUPER_RAY))"

                    "Actions"
                    {
                        "Conditional"
                        {
                            "Condition" "max(0, hitDamageOfType(%HIT, @DamageType(DAMAGE_TRUE)), hitDamageOfType(%HIT, @DamageType(DAMAGE_MAGICAL)), hitDamageOfType(%HIT, @DamageType(DAMAGE_PHYSICAL))) > 0"

                            "Actions"
                            {
                                "AddDamage"
                                {
                                    "Type"            "DAMAGE_TRUE"
                                    "Damage"        "0 - hitDamageOfType(%HIT, @DamageType(DAMAGE_TRUE))"
                                } 

                                "AddDamage"
                                {
                                    "Type"            "DAMAGE_PHYSICAL"
                                    "Damage"        "0 - hitDamageOfType(%HIT, @DamageType(DAMAGE_PHYSICAL))"
                                } 

                                "AddDamage"
                                {
                                    "Type"            "DAMAGE_MAGICAL"
                                    "Damage"        "0 - hitDamageOfType(%HIT, @DamageType(DAMAGE_MAGICAL))"
                                } 

                                "#AddDamage"
                                {
                                    "Type"            "DAMAGE_TRUE"
                                    "Damage"        "1"
                                } 

                                "AttachEffect"
                                {
                                    "EffectName" "MBFHarbingerShieldHitFXMega" 
                                    "Target" "%TARGET"
                                }
                                "UnitRaiseMessage"
                                {
                                    "Unit" "%TARGET"
                                    
                                    "Icon" "GlareBarrier"
                                }
                            }

                            "ElseActions"
                            {
                                "#UnitRaiseMessage"
                                {
                                    "Unit" "%TARGET"
                                    
                                    "Icon" "GlareBarrier"
                                }
                            }
                        }

                        "AddDamage"
                        {
                            "Type"            "DAMAGE_ARMOR"
                            "Damage"        "0 - hitDamageOfType(%HIT, @DamageType(DAMAGE_ARMOR))"
                        } 
                    }
                }
            }
        }
    }
}

