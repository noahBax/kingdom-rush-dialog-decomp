"units"
{
	"TrollWarrior" 
	{
		"Model" "TrollWarrior"
		"Name" "TROLL_WARRIOR"
		"InheritsFrom" "Base"
		"cinematicTags" "Troll"

		"stats"
		{

			"level" "1"
				
			"health_max" "8"
			"armor_max" "0"	
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"rangedAttackRange" "0"
			"troll_retreat_health_missing_min_percent" "0.65"
			
			"baseDamage"  "3"

			"walkSpeed" "3"

			"initiativeModifier" "-1"

			"troll_regeneration" "1"
		}

		"states"
  		{
  			"TROLL" "1"
  		}

		"skills"
		{
			"11" "troll_regeneration_trait"
			"12" "troll_enrage_trait"
			"13" "troll_look_closest_hero_trait"
			"101" "retreat_if_weak_troll_ai"
			"102" "walk_to_closest_melee_ai"
 		}

 		"defaultSkill" "common_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTrollWarriorSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatTrollWarrior_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatTrollWarrior_death"
			}
		}
	}

	"TrollChampion" 
	{
		"Model" "TrollChampion"
		"Name" "TROLL_CHAMPION"
		"InheritsFrom" "Base"
		"cinematicTags" "Troll"

		"stats"
		{

			"level" "1"
				
			"health_max" "10"
			"armor_max" "2"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "0"
			"troll_retreat_health_missing_min_percent" "0.65"

			"rangedAttackRange" "3"
			"rangedAttackMinRange" "2"
		
			"baseDamage"  "4"
			"walkSpeed" "2"

			"troll_regeneration" "1"

		}


		"skills"
		{
			"1" "troll_champion_axe_throw"
			"2" "troll_champion_double_strike"
			"11" "troll_regeneration_trait"
			"12" "troll_enrage_trait"
			"13" "troll_look_closest_hero_trait"
			"101" "retreat_if_weak_troll_ai"
			"103" "walk_to_closest_melee_ai"
 		}

 		"states"
  		{
  			"TROLL" "1"
  		}

 		"defaultSkill" "common_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTrollChampionSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatTrollChampion_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatTrollChampion_death"
			}
		}
	}

	"TrollChieftain" 
	{
		"Model" "TrollChieftain"
		"Name" "TROLL_CHIEFTAIN"
		"InheritsFrom" "Base"
		"cinematicTags" "Troll"

		"stats"
		{

			"level" "1"
				
			"health_max" "12"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "2"
		
			"baseDamage"  "4"
			"walkSpeed" "2"
			"rangedAttackRange" "4"
			"rangedAttackMinRange" "2"

			"visualMoveSpeed" "0.75" 
			"visualRunSpeed" "0.75"

			"troll_regeneration" "1"

		}


		"skills"
		{
			"1" "troll_war_drums"
			"2" "troll_chieftain_avalanche_beat"
			"11" "troll_regeneration_trait"
			"300" 	"custom_step_sound_trait"
 		}

 		"states"
  		{
  			"TROLL" "1"
  		}

 		"defaultSkill" "common_bash_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTrollChieftainSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_largeHumanoidHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_largeHumanoidDeath"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}

	"TrollBreaker" 
	{
		"Model" "TrollBreaker"
		"Name" "TROLL_BREAKER"
		"InheritsFrom" "Base"
		"cinematicTags" "Troll"

		"stats"
		{

			"level" "1"
				
			"health_max" "15"
			"armor_max" "3"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "0"
		
			"baseDamage"  "5"
			"walkSpeed" "2"
			"rangedAttackRange" "0"

			"visualMoveSpeed" "0.75" 
			"visualRunSpeed" "0.75"

			"troll_regeneration" "1"

		}


		"skills"
		{
			"1" "troll_breaker_battering_ram"
			"10" "troll_regeneration_trait"
			"11" "troll_enrage_trait"
			"13" "troll_look_closest_hero_trait"
			"300" 	"custom_step_sound_trait"
 		}

 		"states"
  		{
  			"TROLL" "1"
  		}

 		"defaultSkill" "troll_breaker_clobber"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTrollBreakerSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_largeHumanoidHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_largeHumanoidDeath"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}

	"MBFFrostHarbinger" 
	{
		"Model" "MountainTrollFrostHarbinger"
		"Name" "MBF_FROST_HARBINGER"
		"InheritsFrom" "Base"
		"cinematicTags" "Troll"
		
		"stats"
		{
			"level" "1"
				
			"health_max" "9"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"visualMoveSpeed" "0.5" 
			"visualRunSpeed" "0.5"

			"rangedAttackRange" "20"
			"rangedAttackMinRange" "1"

			"baseDamage"  "5"

			"walkSpeed" "0"

			"actionsAvailableMax" "2"
		}


		"skills"
		{
			"1" "mbf_harbinger_summon_crystals"
			"2" "mbf_harbinger_teleport"
			"100" "mbf_harbinger_glare_barrier_trait"
			"101" "mbf_harbinger_death_monitor"
			"102" "mbf_harbinger_main_trait"
 		}

 		"states"
		{
			"BOSS" "1"

			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"

			"CANT_BE_HEXED" "1"

			"NO_SKULL" "1"
			"FORCE_KILL_COUNT" "1"
 		}
 		

 		"defaultSkill" "no_attack_ability"

 		"soundConfig"
		{	
			"assetId" "DynamicSoundGroupMBFSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatMBF_harbingerReducedHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"roar" "krl_sfx_combatKrum_krumRoar"
				"howl" "krl_sfx_combatKrum_krumHowl"
				"victory" "krl_sfx_combatKrum_crowdVictory"
				"defeat" "krl_sfx_combatKrum_crowdDefeat"
				"boo" "krl_sfx_combatKrum_crowdBoo"
				"cheer" "krl_sfx_combatKrum_crowdCheer"
			}
		}
	}

	"MBFCrystalMinion" 
	{
		"Model" "CrystalCultist"
		"Name" "MBF_GLARE_CRYSTAL"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "2"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"baseDamage"  "1"
			
			"rangedAttackRange" "3"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"

		}

		"skills"
		{
			"10" "mbf_crystal_super_ray_attack"
			"100" "disable_default_walk_ai"
			"101" "mbf_suicide_on_turn_end"
 		}

 		"states"
		{
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"

			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"

			"NO_SKULL" "1"

			"mbfCrystal" "1"
 		}

 		"defaultSkill" "mbf_crystal_spell_attack"

 		"soundConfig"
		{	
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatMBF_redCrystalHit"
				"receiveArmorDamage" "krl_sfx_combatMBF_redCrystalHit"
				"death" "krl_sfx_combatMBF_redCrystalExplode"
			}
		}
	}

	"MBFGlareTower" 
	{
		"Model" "ArcaneTowerPillar"
		"Name" "MBF_GLARE_TOWER"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "10"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"baseDamage"  "3"
			
			"rangedAttackRange" "8"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"

		}

		"skills"
		{
			"10" "mbf_glare_tower_crystal_attack"

			"100" "mbf_glare_tower_visual_controller"
			"101" "mbf_glare_tower_main_trait"
			
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

  			"NO_SKULL" "1"
 		}

 		"defaultSkill" "mbf_glare_tower_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_armorHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatMBF_towerDeath"
			}
		}
	}

	"MBFGlareTowerBase" 
	{
		"Model" "ArcaneTowerBase"
		"Name" "OBELISK"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "10"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"baseDamage"  "3"
			
			"rangedAttackRange" "8"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"

		}

		"skills"
		{
 		}

 		"states"
		{
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"LEAVE_CORPSE_VISIBLE" "1"
  			"NO_SKULL" "1"

  			"towerPart" "1"
 		}

 		"defaultSkill" "no_attack_ability"
	}

	"MBFGlareTowerGem" 
	{
		"Model" "ArcaneTowerGem"
		"Name" "OBELISK"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "10"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"baseDamage"  "3"
			
			"rangedAttackRange" "8"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"
		}

		"skills"
		{
 		}

 		"states"
		{
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_SKULL" "1"
  			"towerPart" "1"
 		}

 		"defaultSkill" "no_attack_ability"
	}

	"MBFGlareTowerMinionFront" 
	{
		"Model" "ArcaneTowerMinionFront"
		"Name" "OBELISK"
		"InheritsFrom" "Base"

		"stats"
		{
		}

		"skills"
		{
 		}

 		"states"
		{
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_SKULL" "1"
  			"towerMinion" "1"
 		}

 		"defaultSkill" "no_attack_ability"

 		"assetId" "DynamicSoundGroupMBFSounds"
		"sounds"
		{
			"death" "krl_sfx_combatMBF_towerConsumePriests"
		}
	}

	"MBFGlareTowerMinionBack" 
	{
		"Model" "ArcaneTowerMinionBack"
		"Name" "OBELISK"
		"InheritsFrom" "Base"

		"stats"
		{
		}

		"skills"
		{
 		}

 		"states"
		{
			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_SKULL" "1"
  			"towerMinion" "1"
 		}

 		"defaultSkill" "no_attack_ability"
	}

	"MBFUlgukHai" 
	{
		"Model" "MountainTrollUlgukHai"
		"Name" "MBF_ULGUK"
		"InheritsFrom" "Base"
		"cinematicTags" "Troll"

		"stats"
		{

			"level" "1"
				
			"health_max" "20"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"


			"visualMoveSpeed" "0.5" 
			"visualRunSpeed" "0.5"

			"rangedAttackRange" "0"
			"rangedAttackMinRange" "1"

			"baseDamage"  "5"

			"walkSpeed" "2"


			"actionsAvailableMax" "2"
		}


		"skills"
		{
			"1" "mbf_ulgukhai_maze_swing"
			"2" "mbf_ulgukhai_summon_crystals"
			"3" "mbf_ulgukhai_snow_launch"
			"4" "mbf_ulgukhai_charge"
			"5" "mbf_ulgukhai_heal"
			"10" "kill_all_allies"


			"100" "walk_to_closest_melee_ai"
			"101" "mbf_ulgukhai_main_trait"
			"102" "mbf_ulguk_trait_display"
			"300" 	"custom_step_sound_trait"
 		}


 		"defaultSkill" "troll_breaker_clobber"

 		"states"
		{
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  			"NO_SKULL" "1"
  			"FORCE_KILL_COUNT" "1"

			"ulgukhai" "1"
 		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupMBFSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatMBF_ulgukHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatMBF_ulgukDeath"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}

	"MBFUlgukHaiOnIce" 
	{
		"Model" "MountainTrollUlgukHaiOnIce"
		"Name" "MBF_ULGUK"
		"InheritsFrom" "Base"

		"stats"
		{

			
		}


		"skills"
		{
			"1" "mbf_glare_tower_break_ice_attack"
 		}


 		"states"
		{
			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"
  			"NO_SKULL" "1"
 		}

 		"defaultSkill" "no_attack_ability"
	}

	"MBFHealingCrystalMinion" 
	{
		"Model" "LifelinkCrystal"
		"Name" "MBF_HEALING_CRYSTAL"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "2"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"baseDamage"  "1"
			
			"rangedAttackRange" "5"
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "0"

		}

		"skills"
		{
			
 		}

 		"states"
		{
			"NOT_IN_INITIATIVE_BAR" "1"

			"NO_FLIP_ON_HIT" "1"
			"NO_FLIP_ON_SKILL" "1"

			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  			"NO_SKULL" "1"

			"mbfCrystal" "1"
 		}

 		"defaultSkill" "no_attack_ability"

 		"soundConfig"
		{	
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatMBF_redCrystalHit"
				"receiveArmorDamage" "krl_sfx_combatMBF_redCrystalHit"
				"death" "krl_sfx_combatMBF_greenCrystalExplode"
			}
		}
	}
}
