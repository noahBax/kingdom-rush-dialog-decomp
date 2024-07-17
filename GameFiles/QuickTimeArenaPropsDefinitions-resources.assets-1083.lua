"units"
{
	"SpikedFloor"
	{
		"Name" 			"PROP_SPIKEDFLOOR"
		"InheritsFrom" 	"Base"
		"Model" 		"SpikedFloor"

		"stats"
		{
			"health_max" 		"1000000"
			"baseDamage" 		"2"

			"initiativeModifier" "1000"
		}

		"skills"
		{ 
			"1"		"spiked_floor_generic_buff_skill"
 			"100" 	"disable_default_walk_ai"
  		}

  		"states"
  		{
  			"START_ENABLED" "0"
  			"NO_COLLISION" "1"
  			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"
			"FIXED_POSITION" "1"
			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  			"NON_TARGETABLE" "1"
  			"NOT_IN_INITIATIVE_BAR" "1"
  		}

  		"defaultSkill" "no_attack_ability"

  		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSpikedFloorSounds"
			"sounds"
			{
			}
		}
	}

	"PutridVent"
	{
		"Name" 			"PROP_PUTRID_VENT"
		"InheritsFrom" 	"Base"
		"Model" 		"PutridVent"

		"stats"
		{
			"health_max" 		"1000000"
			"baseDamage" 		"2"
		}

		"skills"
		{ 
			"1"		"putrid_vent_generic_buff_skill"
 			"100" 	"disable_default_walk_ai"
  		}

  		"defaultSkill" "no_attack_ability"

  		"states"
  		{
  			"START_ENABLED" "0"
  			"NO_COLLISION" "1"
  			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"
			"FIXED_POSITION" "1"
			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  			"NON_TARGETABLE" "1"
  			"NOT_IN_INITIATIVE_BAR" "1"
  		}

  		"soundConfig"
		{
			"assetId" "DynamicSoundGroupPutridVentSounds"
			"sounds"
			{
			}
		}
	}
}
