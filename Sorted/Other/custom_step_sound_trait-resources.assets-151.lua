






"custom_step_sound_trait"
{
    
    
   "AbilityBehavior"       "UNIT_TARGET| PASSIVE"

    "AbilitySpecial"
    {
    } 

    "Modifiers"
    {
        "custom_step_sound_trait_modifier"
        {
        	"Passive" "1"

            "OnAdded"
            {
                "AttachEffect"
                {
                    "EffectName" "CustomStepFXMega"
                    "Target" "%TARGET"
                    "Dependant" "1"
                }
            }
        }
    }
}
