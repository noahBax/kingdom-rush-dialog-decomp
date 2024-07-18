"vinepaw_antlers_trait"
{
    "AbilityBehavior"               "POSITIVE_EFFECT | PASSIVE"
    
    "Icon"                          "Antlers"

    "AbilitySpecial" 
    {
        "01"
        {
            "var_type"              "FIELD_EXPRESSION"
            "antlersDamage"         "stat(%CASTER, #antlersDamage)"
        }
    }

    "Modifiers"
    {
        "vinepaw_antlers_trait_modifier"
        {
            "Passive"       "1"
            "StayOnDeath"   "1"

            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && hasTags(hitTags(%HIT), #MELEE) && not(hasTags(hitTags(%HIT), #REFLECTED)) && not(hasTags(hitTags(%HIT), #SOURCE_IS_BACK))"
                    "Actions" 
                    {
                        "QueueHit"
                        {
                            "Target"    "%ATTACKER"
                            "Source"    "%TARGET"
                            "Tags"      "stringList(#REFLECTED)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "stat(%HITSOURCE, #antlersDamage)"
                                }
                            }

                            "Actions"
                            {
                                "AttachEffect"
                                {
                                    "EffectName"    "ArmorOfThornsHitFXMega"
                                    "Target"        "%HITTARGET"
                                }

                                "AttachEffect"
                                {
                                    "EffectName"    "ArmorOfThornsTriggeredFXMega"
                                    "Target"        "%HITSOURCE"
                                }
                            }
                        }
                    }
                }
            }
           
        }
    }
}
