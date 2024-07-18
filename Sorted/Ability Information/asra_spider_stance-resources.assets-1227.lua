"asra_spider_stance"
{
    "AbilityBehavior"       "UNIT_TARGET"
    "AbilityTeamFilter"     "TEAM_FRIENDLY"

    "AnimationID"           "SpellCastB"
    "CastFXId"              "ShadowStrikeCastFXMega"
    "Icon"                  "Spiderstance"

    "AbilityCastRange"      "0"
    "AbilityCooldown"       "3"
    "AbilityAPCost"         "1"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"      "FIELD_FLOAT"
            "duration"      "2"
        }

        "02"
        {
            "var_type"      "FIELD_FLOAT"
            "dodgeChance"      "100"
        }
        "03"
        {
            "var_type"      "FIELD_FLOAT"
            "minHPRequirement"      "1" 
        }
    }


    "OnAbilityAction"
    {
        "Conditional"
        {
            "Condition" "safeEquals(stat(%TARGET, #health), 1)"
            
            "Actions" 
            {
                "ApplyModifier"
                {
                    "ModifierName"      "asra_spider_stance_epic_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "%duration"
                    "Refresh"           "1"
                }

                "HitLegendaryTriggered"
                {
                    "Unit"              "%TARGET"
                }
            }

            "ElseActions"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "asra_spider_stance_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "%duration"
                    "Refresh"           "1"
                }
            }
        }
    }

    "Modifiers"
    {
        "asra_spider_stance_modifier"
        {
            "Tags"              "shield"
            "EffectName"        "AsraSpiderStanceStatusFXMega"
            "Icon"              "SpiderStance"
            "IconPriority"      "50"

            "PropertiesAdd"
            {
                "evasion"       "(%dodgeChance)/100"
            }
        }

        "asra_spider_stance_epic_modifier"
        {
            "Tags"              "shield"
            "EffectName"        "AsraSpiderStanceStatusEpicFXMega"
            "Icon"              "ShieldOfShadows"
            "IconPriority"      "50"

            "PropertiesAdd"
            {
                "evasion"       "(%dodgeChance)/100"
            }

            "OnPreHit"
            {
                "Conditional"
                {
                    "Condition" "hitConnected(%HIT) && hasTags(hitTags(%HIT), #PROJECTILE, #TARGETED)"
                    
                    "Actions" 
                    {
                        "CancelHit"
                        {
                        }

                        "LookAt"
                        {
                            "Target"        "%TARGET"
                            "LookAt"        "unitPosition(%ATTACKER)"
                        }

                        "PlayActivityAnimation"
                        {
                            "Target"        "%TARGET"
                            "Animation"     "Dodge"
                        }

                        "UnitRaiseMessage"
                        {
                            "Unit" "%TARGET"
                            
                            "Icon" "Dodge"
                        }
                    }
                }
            }
        }
    }
}

