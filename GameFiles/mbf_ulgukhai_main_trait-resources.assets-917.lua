"mbf_ulgukhai_main_trait"
{
    "AbilityBehavior"       "POSITIVE_EFFECT | PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "mbf_ulgukhai_main_trait_modifier"
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
		            "Cinematic" "#UlgukHaiFocus"
		        }
            }
        }
    }
}

