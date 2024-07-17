






"avenging_shield"
{
    
    
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastB"
    "CastFXId" "AvengingShieldCastFXMega"
    "Icon" "AvengingShield"


    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCooldown"      "3"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {


        "01"
        {
            "var_type" "FIELD_FLOAT"
            "damageReturned" "2"
        }

        "02"
        {
            "var_type" "FIELD_FLOAT"
            "duration" "3"
        }
    }


    "OnAbilityAction"
    {
        "RemoveModifier"
        {
            "ModifierTag"    "shield"
            "Target"         "%TARGET"
        }

        "ApplyModifier"
        {
            "ModifierName"    "modifier_avenging_shield"
            "Target"         "%TARGET"
            "Duration"      "%duration"
        }
    }

     "Modifiers"
    {
        "modifier_avenging_shield"
        {
            "Tags" "shield"

            "EffectName" "AvengingShieldStatusFXMega"

           
            "OnPostHit"
            {
                "Conditional"
                {
                    "Condition" "not(hasTags(hitTags(%HIT), #REFLECTED) || hasTags(hitTags(%HIT), #INTERNAL) || hasTags(hitTags(%HIT), #ENVIRONMENTAL))"
                    "Actions" 
                    {
                        "QueueHit"
                        {
                            "Target" "%ATTACKER"
                            "Source" "%TARGET"

                            "EffectName" "AvengingShieldHitFXMega" 
                            "Tags" "stringList(#MAGICAL, #REFLECTED)"

                            "InitActions"
                            {
                                "AddDamage"
                                {
                                    "Type"          "DAMAGE_TRUE"
                                    "Damage"        "%damageReturned"
                                }
                            }

                            "Actions"
                            {
                                "AttachEffect"
                                {
                                    "EffectName" "AvengingShieldHittedFXMega"
                                    "Target" "%HITSOURCE"
                                }
                            }
                        }
                    }
                }
            }

        }
    }



}
