"wbf_iriza_main_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "wbf_iriza_phase1_modidfier"
        {
           "Passive" "1"
           "Tags" "wbf_phase"

            "States"
            {
                "PHASE1" "1"
            }

        }

        "wbf_iriza_phase2_modidfier"
        {
            "Tags" "wbf_phase"
            "AutoRemoveTags" "wbf_phase"

            "OnAdded"
            {
                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Idle"
                    "NewAnimation"      "Idle2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "TakeDamage"
                    "NewAnimation"      "TakeDamage2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Victory"
                    "NewAnimation"      "Victory2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Angry"
                    "NewAnimation"      "Angry2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Speak"
                    "NewAnimation"      "Speak2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "SpeakPossessed"
                    "NewAnimation"      "SpeakPossessed2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }


                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Teleport"
                    "NewAnimation"      "Teleport2"
                    "OverrideId"        "novalue"
                    "Priority"          "20"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "wbf_iriza_gone_modidfier"
                    "Target"         "%TARGET"
                } 

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#health_max"
                    "Value" "stat(%TARGET, #health_max_phase2)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#health"
                    "Value" "stat(%TARGET, #health_max_phase2)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#armor_max"
                    "Value" "stat(%TARGET, #armor_max_phase2)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#armor"
                    "Value" "stat(%TARGET, #armor_max_phase2)"
                }

                "Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.SetConfirmButtonSocketHeight(1.42) end"
                }

                "Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverridePortraitImage('Portrait02') end"
                }
            }

            "States"
            {
                "PHASE2" "1"
                "WITHTELEGRAPH" "1"
            }
        }

        "wbf_iriza_phase3_modidfier"
        {
            "Tags" "wbf_phase"
            "AutoRemoveTags" "wbf_phase"

            "OnAdded"
            {
                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Idle"
                    "NewAnimation"      "Idle3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "TakeDamage"
                    "NewAnimation"      "TakeDamage3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Victory"
                    "NewAnimation"      "Victory3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Angry"
                    "NewAnimation"      "Angry3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Speak"
                    "NewAnimation"      "Speak3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "SpeakPossessed"
                    "NewAnimation"      "SpeakPossessed3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }


                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Teleport"
                    "NewAnimation"      "Teleport3"
                    "OverrideId"        "novalue"
                    "Priority"          "30"
                }

                "RemoveModifier"
                {
                    "ModifierName"    "wbf_iriza_gone_modidfier"
                    "Target"         "%TARGET"
                } 

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#health_max"
                    "Value" "stat(%TARGET, #health_max_phase3)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#health"
                    "Value" "stat(%TARGET, #health_max_phase3)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#armor_max"
                    "Value" "stat(%TARGET, #armor_max_phase3)"
                }

                "SetStat"
                {
                    "Target" "%TARGET"
                    "Stat" "#armor"
                    "Value" "stat(%TARGET, #armor_max_phase3)"
                }

                "Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.SetConfirmButtonSocketHeight(1.72) end"
                }

                "Lua"
                {
                    "Action" "return function(ctx)  ctx.GetObject('TARGET').unitView.OverridePortraitImage('Portrait03') end"
                }
            }

            "States"
            {
                "PHASE3" "1"
                "WITHTELEGRAPH" "1"
            }
        }

        "wbf_iriza_phase3Cry_modidfier"
        {
            "Tags" "wbf_phase"
            "AutoRemoveTags" "wbf_phase"

            "OnAdded"
            {
                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Idle"
                    "NewAnimation"      "Idle3Cry"
                    "OverrideId"        "novalue"
                    "Priority"          "35"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Speak"
                    "NewAnimation"      "Speak3Cry"
                    "OverrideId"        "novalue"
                    "Priority"          "35"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "SpeakPossessed"
                    "NewAnimation"      "SpeakPossessed3Cry"
                    "OverrideId"        "novalue"
                    "Priority"          "35"
                }
            }

            "States"
            {
                "PHASE4" "1"
            }
        }

        "wbf_iriza_phase4_modidfier"
        {
            "Tags" "wbf_phase"
            "AutoRemoveTags" "wbf_phase"

            "OnAdded"
            {
                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Idle"
                    "NewAnimation"      "Idle4"
                    "OverrideId"        "novalue"
                    "Priority"          "40"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "Speak"
                    "NewAnimation"      "Speak4"
                    "OverrideId"        "novalue"
                    "Priority"          "40"
                }

                "OverrideAnimation"
                {
                    "Target"            "%TARGET"
                    "BaseAnimationId"   "SpeakPossessed"
                    "NewAnimation"      "SpeakPossessed4"
                    "OverrideId"        "novalue"
                    "Priority"          "40"
                }
            }

            "States"
            {
                "PHASE4" "1"
            }
        }
    }
}

