"mbf_glare_tower_main_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "mbf_glare_tower_main_trait_modifier"
        {
            "Passive" "1"

            "OnTurnStarted"
            {
            	"CameraControl"
            	{
            		"TakeOver" "1"
            	}

                "QueueCinematic"
		        {
		            "Cinematic" "#GlareTowerFocus"
		        }
            }
        }
    }
}

