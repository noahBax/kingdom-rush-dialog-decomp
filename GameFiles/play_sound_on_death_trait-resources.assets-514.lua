"play_sound_on_death_trait"
{
    "AbilityBehavior"       "PASSIVE"

    "AbilitySpecial"
    {
    }

    "Modifiers"
    {
        "play_sound_on_death_modifier"
        {
            "Passive" "1"

            "OnRemoved"
            {
                "PlaySound"
                {
                    "Unit"          "%TARGET"
                    "Sound"         "#deathSound"
                }
            }
        }
    }
}
