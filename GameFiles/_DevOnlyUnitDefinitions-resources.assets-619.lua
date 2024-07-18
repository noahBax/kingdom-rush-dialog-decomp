"units"
{

	"TURNMARKER" 
	{
		"Name" "TURNMARKER"
		"InheritsFrom" "Base"
		"Model" "TurnMarker"

		"cinematicTags" "TURNMARKER"

		"stats"
		{
			"health_max" "80"
			"initiative" "9999999"
		}

		"skills"
		{ 
			"1" "turn_marker_trait"
			"2" "kill_count_achievement_trait"
			"3" "zapper_unlock_achievement_trait"
			"4" "witch_doctor_unlock_achievement_trait"
			"5" "epic_count_achievement_trait"
			"6" "damage_dealt_count_achievement_trait"
			"7" "clear_progress_turn_based_achievements_trait"
			"8" "unharmed_combat_spree_achievement_trait"
			"9" "heal_count_achievement_trait"
			"50" "arenaDiversifier_main_trait"
			"51" "arenaDiversifier_sols_guidance_trait"
			"52" "arenaDiversifier_burning_desire_trait"
			"53" "arenaDiversifier_drowsy_enemies_trait"
			"54" "arenaDiversifier_orcish_forge_trait"
			"55" "arenaDiversifier_bashed_heroes_trait"
			"56" "arenaDiversifier_thorns_army_trait"
			"57" "arenaDiversifier_faster_than_light_trait"
			"58" "arenaDiversifier_ultra_ultras_trait"
			"59" "arenaDiversifier_encouraging_audience_trait"
			"61" "arenaDiversifier_ready_for_action_trait"
			"62" "arenaDiversifier_fans_favourite_trait"
			"63" "arenaDiversifier_divine_intervention_trait"
			"64" "arenaDiversifier_fireworks_rain_trait"
			"70" "quick_play_arena_summary_trait"
 			"100" "disable_default_walk_ai"
  		}

  		"states"
  		{
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_LIFEBAR" "1"
  			"NO_CHECK_END_FIGHT" "1"
  			"TURNMARKER" "1"
  			"CONSTROLSCAMERA" "1"
  			"NO_PROP_TRANSPARENCY" "1"
  		}

  		"defaultSkill" "no_attack_ability"
	}



	"DummyUnit" 
	{
		"Name" "DummyUnitTest"
		"InheritsFrom" "Base"
		"Model" "DummyUnit"

		"stats"
		{
			"health_max" "80"
			"skipsInitiative" "1"
			"initiative" "-99"
		}

		"skills"
		{ 
 			
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}
}
