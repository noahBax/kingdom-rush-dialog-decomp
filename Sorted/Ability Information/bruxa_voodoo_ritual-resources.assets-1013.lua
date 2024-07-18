"bruxa_voodoo_ritual"
{
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter"     "TEAM_FRIENDLY"
    "AnimationID"           "VoodooRitual"
    "Icon"                  "VoodooRitual"
    "CastFXId"              "BruxaVoodooRitualCastFXMega"

    "AbilityCastRange"      "0"
    "AbilityCooldown"       "3"
    "AbilityAPCost"         "1"
    "AbilityCanExecute"     "stat(%SOURCE, #skulls) < stat(%SOURCE, #skulls_max)"

     "AbilitySpecial"
    {
        "01"
        {
            "var_type"              "FIELD_FLOAT"
            "healingPerSkull"       "1"
        }
    }

    "OnAbilityAction"
    {
        "Times"
        {   
            "Times"                     "stat(%TARGET, #skulls_max) - stat(%TARGET, #skulls)"
            "IteratorName"              "#index"
            "Actions"
            {
                "ApplyModifier"
                {
                    "ModifierName"      "bruxa_laughing_skulls_trait_modifier"
                    "Target"            "%TARGET"
                    "Duration"          "0"
                }

                "SetToContext"
                {
                    "Context"                   "currentContext()"
                    "Type"                      "FIELD_INTEGER"
                    "Key"                       "#skullId"
                    "Value"                     "stat(%TARGET, #skulls)"
                }

                "Delay"
                {
                    "Time"      "%index * 0.5"
                    "Actions"
                    {
                        "ApplyModifier"
                        {
                            "ModifierName"      "bruxa_laughing_skulls_trait_fx_modifier"
                            "Target"            "%TARGET"
                            "Duration"          "0"
                            "Params"
                            {
                                "skullId" 
                                { 
                                    "type"      "FIELD_INTEGER"
                                    "value"     "%skullId"
                                }
                            }
                        }

                        "AttachEffect"
                        {
                            "EffectName"            "BruxaVoodooRitualSummonSkullFXMega" 
                            "Target"                "%TARGET"
                            "ReplaceAttach"         "stringList(#SKULL, stringWithIndex(#skull, %skullId)"
                            "Modifier" "%MODIFIERINSTANCE"
                        }

                        "Heal"
                        {
                            "Target"            "%TARGET"
                            "HealAmount"        "%healingPerSkull"
                        }
                        
                        "AttachEffect"
                        {
                            "EffectName"        "BruxaVoodooRitualHealingFXMega"
                            "Target"            "%TARGET"
                        } 
                    }
                }
            }
        }        
    }
}
