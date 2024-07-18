"units"
{
	"OrcHunter"
	{
		"Model" 			"OrcHunter"
		"Name" 				"ORC_HUNTER"
		"InheritsFrom" 		"Base"
		"cinematicTags" 	"Orc"

		"stats"
		{
			"level" 				"1"
				
			"health_max" 			"6"
			"armor_max" 			"4"
			"armor_regen_per_turn" 	"1"
			"armor_gain_passTurn" 	"0"

			"baseDamage"  			"3"

			"rangedAttackRange" 	"5"
			"rangedAttackMinRange" 	"2"

			"walkSpeed" 			"2"
		}

		"skills"
		{
			"100" 		"orc_hunter_sleeping_arrow"

			"200" 		"keepDistance_ai"
			"300" 		"get_in_range_ai"
			"400" 		"walk_to_closest_ranged_ai"
			"500" 		"attach_effect_on_death_trait"
			"600"		"quick_play_arena_elite_trait"
 		}

 		"defaultSkill" 	"common_ranged_attack"

 		"soundConfig"
		{
			"assetId" 				"DynamicSoundGroupOrcHunterSounds"
			"sounds"
			{
				"receiveDamage" 		"krl_va_combatOrcArcher_hit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_va_combatOrcArcher_death"
			}
		}
	}

	"Blasteon" 
	{
		"Model" 			"Blasteon"
		"Name" 				"BLASTEON"
		"InheritsFrom" 		"Base"
		"cinematicTags" 	"Demon"

		"stats"
		{
			"level" 					"1"
				
			"health_max" 				"6"
			"armor_max" 				"0"
			"armor_regen_per_turn" 		"0"
			"armor_gain_passTurn" 		"0"

			"baseDamage"  				"3"

			"rangedAttackRange" 		"4"
			"rangedAttackMinRange" 		"2"

			"walkSpeed" 				"2"

			"infernalSacrificeDamage" 	"5"
		}

		"skills"
		{
			"1" 			"infernal_sacrifice"
			"2" 			"wasteland_forged_by_fire_trait"

			"100" 			"keepDistance_ai"
			"101" 			"get_in_range_ai"
			"102" 			"walk_to_closest_ranged_ai"

			"500" 			"blasteon_engulfed_in_flames_trait"
			"600"			"quick_play_arena_elite_trait"
 		}

 		"defaultSkill" 		"blasteon_fire_bomb"

 		"states"
 		{
 			"demonlordsacrificecandidate" 	"1"
 		}

 		"soundConfig"
		{	
			"assetId" 				"DynamicSoundGroupDemonFlareonSounds"
			"sounds"
			{
				"receiveDamage" 		"krl_va_combatDemonFlareon_hit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_va_combatDemonFlareon_death"
			}
		}
	}

	"ExaltedLord" 
	{
		"Model" 				"ExaltedLord"
		"Name" 					"EXALTED_LORD"
		"InheritsFrom" 			"Base"
		"cinematicTags" 		"Cultist"

		"stats"
		{
			"level" 				"1"
				
			"health_max" 			"8"
			"armor_max" 			"2"
			"armor_regen_per_turn" 	"0"
			"armor_gain_passTurn" 	"0"

			"baseDamage"  			"5"
			
			"rangedAttackRange" 	"4"
			"rangedAttackMinRange" 	"2"
			
			"walkSpeed" 			"2"
		}

		"skills"
		{
			"1"  					"summon_multiple_tentacles"
			"2"  					"exalted_lord_beckoning"
			"600"					"quick_play_arena_elite_trait"
 		}

 		"defaultSkill" 				"cultist_ranged_spell_attack"

 		"soundConfig"
		{	
			"assetId" 				"DynamicSoundGroupExaltedLordSounds"
			"sounds"
			{
				"receiveDamage" 		"krl_va_combatCultistExhalted_hit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_va_combatCultistExhalted_death"
			}
		}
	}

	"Togre" 
	{
		"Model" 				"Togre"
		"Name" 					"TOGRE"
		"InheritsFrom" 			"Base"

		"stats"
		{

			"level" 					"1"
				
			"health_max" 				"14"
			"armor_max" 				"0"
			"armor_regen_per_turn" 		"0"
			"armor_gain_passTurn" 		"2"
			"evasion" 					"0.2"
			"visualMoveSpeed" 			"3" 
			"visualRunSpeed" 			"3"

			"baseDamage"  				"6"

			"walkSpeed" 				"3"
			"rangedAttackRange" 		"0"

			"initiativeModifier" 		"0"
		}

		"skills"
		{
			"1" 		"wulf_rupture"
			"2" 		"togre_pounce"
			"10" 		"dodge_trait"
			
			"500" 		"attach_effect_on_death_trait"
			"600"		"quick_play_arena_elite_trait"
 		}


 		"defaultSkill" 	"common_bite_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTogreSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_genericCombat_togreHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_genericCombat_togreDeath"
				"walk" "krl_sfx_genericCombat_bigWulfWalk"
			}
		}
	}

	"Trollzerker" 
	{
		"Model" 			"Trollzerker"
		"Name" 				"TROLLZERKER"
		"InheritsFrom" 		"Base"
		"cinematicTags" 	"Troll"

		"stats"
		{
			"level" 				"1"
				
			"health_max" 			"12"
			"armor_max" 			"3"
			"armor_regen_per_turn"	"1"
			"armor_gain_passTurn" 	"0"
			"troll_retreat_health_missing_min_percent" "0.65"

			"rangedAttackRange" 	"3"
			"rangedAttackMinRange" 	"2"
		
			"baseDamage"  			"5"
			"walkSpeed" 			"3"

			"troll_regeneration" 	"1"
		}

		"skills"
		{
			"1" 		"troll_champion_axe_throw"
			"2" 		"troll_champion_double_strike"
			"11" 		"troll_regeneration_trait"
			"12" 		"trollzerker_rage_trait"
			"13" 		"troll_look_closest_hero_trait"
			"14"		"troll_enrage_trait"
			"101" 		"retreat_if_weak_troll_ai"
			"103" 		"walk_to_closest_melee_ai"
			"600"		"quick_play_arena_elite_trait"
 		}

 		"states"
  		{
  			"TROLL" 	"1"
  		}

 		"defaultSkill" 	"common_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTrollzerkerSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatTrollChampion_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatTrollChampion_death"
			}
		}
	}

	"HighEnchantress"
	{
		"Model" 			"HighEnchantress"
		"Name" 				"HIGH_ENCHANTRESS"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"10"
			"armor_max" 				"0"	
			"armor_regen_per_turn" 		"0"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"3"
			"rangedAttackMinRange"		"0"
			"baseDamage"  				"5"
			"walkSpeed" 				"2"
		}

		"skills"
		{
			"01" "enchantress_spore_shower"
			"02" "high_enchantress_leeching_chain"

			"100" "silveroak_forest_step_trait"
			"101" "silveroak_sylvan_awareness"
			"102" "get_in_range_ai"
			"103" "walk_to_closest_ranged_ai"
			"600" "quick_play_arena_elite_trait"
  		}

 		"defaultSkill" "enchantress_sylvan_bolt"

 		"soundConfig"
		{	
			"assetId" "DynamicSoundGroupSilveroakEnchantressSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatEnchantress_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatEnchantress_death"
			}
		}
	}

	"DiversifierControlUnitBase" 
	{
		"InheritsFrom" "Base"

		"stats"
		{
			"level" "1"		
			"health_max" "1"
			"armor_max" "0"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "0"
			"baseDamage"  "3"
			"rangedAttackRange" "6"
			"rangedAttackMinRange" "0"
			"walkSpeed" "0"
			"initiativeModifier" "-1000"
		}

		"skills"
		{
		}

 		"states"
		{
			"NON_TARGETABLE" "1"
			"FIXED_POSITION" "1"
			"ROOTED" "1"
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  			"LEAVE_CORPSE_VISIBLE" "1"
  			"NO_CHECK_END_FIGHT" "1"
  			"NO_SKULL" "1"
  			"NO_LIFEBAR" "1"
			"CANT_SELECT_IN_INITIATIVE_BAR" "1"
			"CONSTROLSCAMERA" "1"
			"NOT_IN_INITIATIVE_BAR_VISUAL_ONLY" "1"
 		}

 		"defaultSkill" "no_attack_ability"
	}


	"DiversifierEncouragingAudienceControlUnit" 
	{
		"Model" "HumansFans"
		"Name" "HUMANSFANS"
		"InheritsFrom" "DiversifierControlUnitBase"
	}

	"DiversifierUltraUltrasControlUnit" 
	{
		"Model" "OrcsFans"
		"Name" "ORCSFANS"
		"InheritsFrom" "DiversifierControlUnitBase"

		"skills"
		{
			"1" "arenaDiversifier_ultra_ultras_summon_exploding_props"
 		}
	}

	"DiversifierDivineInterventionControlUnit" 
	{
		"Model" "WBFOverseer"
		"Name" "WBF_OVERSEER"
		"InheritsFrom" "Base"
		"cinematicTags" 	"DIVINEINTERVENTIONCONTROL"

		"stats"
		{

			"level" "1"
				
			"health_max" "1"
			"armor_max" "0"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "0"

			"baseDamage"  "3"
			
			"rangedAttackRange" "6"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"

			"initiativeModifier" "-1000"
		}

		"skills"
		{
			"1" "arenaDiversifier_divine_intervention_telegraph"
			"2" "arenaDiversifier_divine_intervention_hit"
 		}

 		"defaultSkill" "no_attack_ability"

 		"states"
		{
			"NON_TARGETABLE" "1"
			"FIXED_POSITION" "1"
			"ROOTED" "1"
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  			"LEAVE_CORPSE_VISIBLE" "1"
  			"NO_CHECK_END_FIGHT" "1"
  			"NO_SKULL" "1"
			"CANT_SELECT_IN_INITIATIVE_BAR" "1"
			"CONSTROLSCAMERA" "1"
			"NOT_IN_INITIATIVE_BAR_VISUAL_ONLY" "1"
			"DIVINEINTERVENTIONCONTROL" "1"
 		}
	}

	"DiversifierDivineInterventionTarget" 
	{
		"Name" 				"DiversifierDivineInterventionTarget"
		"InheritsFrom" 		"Base"
		"Model" 			"DummyUnit"

		"stats"
		{
			"health_max" 		"80"
			"skipsInitiative" 	"1"
			"initiative" 		"-99"
		}

		"skills"
		{
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" 		"1"
  			"NON_TARGETABLE" 				"1"
  			"NO_COLLISION" 					"1"
  			"NO_SKULL" 						"1"
  			"DIVINEINTERVENTIONTARGET" 		"1"
  		}

  		"defaultSkill" 			"no_attack_ability"
	}

	"DiversifierFireworksRainControlUnit" 
	{
		"Model" "WBFOverseer"
		"Name" "WBF_OVERSEER"
		"InheritsFrom" "Base"
		"cinematicTags" 	"FIREWORKSRAINCONTROL"

		"stats"
		{

			"level" "1"
				
			"health_max" "1"
			"armor_max" "0"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "0"

			"baseDamage"  "3"
			
			"rangedAttackRange" "6"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"

			"initiativeModifier" "-1000"
		}

		"skills"
		{
			"1" "arenaDiversifier_fireworks_rain_telegraph"
			"2" "arenaDiversifier_fireworks_rain_hit"
 		}

 		"defaultSkill" "no_attack_ability"

 		"states"
		{
			"NON_TARGETABLE" "1"
			"FIXED_POSITION" "1"
			"ROOTED" "1"
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  			"LEAVE_CORPSE_VISIBLE" "1"
  			"NO_CHECK_END_FIGHT" "1"
  			"NO_SKULL" "1"
			"CANT_SELECT_IN_INITIATIVE_BAR" "1"
			"CONSTROLSCAMERA" "1"
			"NOT_IN_INITIATIVE_BAR_VISUAL_ONLY" "1"
			"FIREWORKSRAINCONTROL" "1"
 		}
	}

	"DiversifierFireworksRainTarget" 
	{
		"Name" 				"DiversifierFireworksRainTarget"
		"InheritsFrom" 		"Base"
		"Model" 			"DummyUnit"

		"stats"
		{
			"health_max" 		"80"
			"skipsInitiative" 	"1"
			"initiative" 		"-99"
		}

		"skills"
		{
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" 		"1"
  			"NON_TARGETABLE" 				"1"
  			"NO_COLLISION" 					"1"
  			"NO_SKULL" 						"1"
  			"FIREWORKSRAINTARGET" 		"1"
  		}

  		"defaultSkill" 			"no_attack_ability"
	}

	"DiversifierEncouragingAudienceTribute" 
	{
		"Name" 				"DiversifierEncouragingAudienceTribute"
		"InheritsFrom" 		"Base"
		"Model" 			"Tribute"

		"stats"
		{
			"health_max" 		"100000"
			"skipsInitiative" 	"1"
			"initiative" 		"-99"
			"explodeRadius" 	"1"
			"explodeDamage" 	"6"
			"baseDamage" 		"0"
		}

		"skills"
		{ 
  		}

  		"states"
  		{
  			"NO_COLLISION" "1"
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  			"PROP" "1"
  			"NON_TARGETABLE" "1"
			"FIXED_POSITION" "1"
			"ROOTED" "1"
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_CHECK_END_FIGHT" "1"
			"ENCOURAGINGAUDIENCETRIBUTE" "1"
			"SKIP_TURN" "1"
  		}

  		"defaultSkill" "no_attack_ability"
	}
}
