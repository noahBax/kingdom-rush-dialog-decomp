"demon_lord_sacrifice"
{
    "AbilityBehavior"       "UNIT_TARGET | POSITIVE_EFFECT"
    "AbilityTeamFilter" "TEAM_FRIENDLY"

    "AnimationID"   "SpellCastB"
    "CastFXId" "DemonLordSacrificeCastFXMega"
    "Icon" "CommandSacrifice"

    "AbilityCastRange" "stat(%CASTER, #rangedAttackRange)"
    "AbilityCastMinRange" "2" 
    "AbilityCooldown"     "2"
    "AbilityAPCost"       "1"


     "AbilitySpecial"
    {
    }


    "OnAbilityAction"
    {
        "#AttachEffect"
        {
            "EffectName" "HealingFXMega"
            "Target" "%TARGET"
        }

        "TriggerSkill" 
        {
            "Target" "%TARGET"
            "AttackTarget" "%TARGET"
            "Skill" "#infernal_sacrifice"
        }
    }

    "AIConfigB"
    {
        "Selection" 
        {
            "Weight" "20"
            "Considerations"
            {
               "isTarget"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitStateOn"
                    "Params"
                    {
                        "State" "#demonlordsacrificecandidate"
                        "Owner" "0"
                    }
                }

                "near at least enemies"
                {
                    "Curve" "Linear|1|1|0|0"
                    "Consideration" "UnitsSurrounding"
                    "Params"
                    {
                        "Max" "2"  
                        "Min" "1" 
                        "TeamFilter" "TEAM_ENEMY"
                        "Range" "1"
                        "Owner" "0"
                    }
                }

                "priorize next to more enemies"
                {
                    "Curve" "Linear|0.5|1|0.5|0"
                    "Consideration" "UnitsSurrounding"
                    "Params"
                    {
                        "Max" "6"  
                        "Min" "2"
                        "TeamFilter" "TEAM_ENEMY"
                        "Range" "1"
                        "Owner" "0"
                    }
                }

                "Priorizacion Random"
                {
                    "Curve" "Linear|0.01|1|0.99|0"
                    "Consideration" "Random"
                }
            }
        }
    }
}
