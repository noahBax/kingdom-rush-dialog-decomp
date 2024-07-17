"units"
{
	"RLHumanGeraldLightSeekerLvl1" 
	{
		"UniqueId" "Gerald"
		"Model" "HumanGeraldLightSeeker"
		"MetaExo" "ExoSkeletonHumanGeraldLightSeeker_MetaDataAsset"
		"Name" "GERALD_LIGHTSEEKER"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Legend|GoodLegend|Gerald|Male|ct_legend|ct_holy|ct_might|ct_wisdom|ct_social|UPGRADES_mighty"
		"nextLevelArchetype" "RLHumanGeraldLightSeekerLvl2"
		"Icon" "Asst_Banner_Lightseeker" 
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_Gerald"
		"AttackType" "PHYSICAL"
		"PortraitBackgroundColor" "f5ee93"

		"stats"
		{

			"level" "1"
			"health_max" "8"
			"armor_max" "5"
			"baseDamage"  "4"
			"armor_regen_per_turn" "2"
			"armor_gain_passTurn" "2"
			
			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "gerald_ajaxs_blessing"
			"100" "mighty_endturn_trait"


 		}

 		"skillProgression"
 		{
			"1" 
 			{
 				"1" "shield_of_retribution"
 			}

 			"2" 
 			{
 				"1" "gerald_divine_blade"
 				"2" "gerald_glorious_swipe"
 				"3" "gerald_avenging_blade"
 			}

 			"3"
 			{
 				"1" "gerald_martyrs_prayer"
 				"2" "gerald_martyrs_inspiration"
 				"3" "gerald_rally"
 			}
 		}

 		"defaultSkill" "gerald_swing"

 		"states"
  		{
  			"LEGEND" "1"
  		}

		"soundConfig"
		{
			"assetId" "DynamicSoundGroupGeraldSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatGerald_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatGerald_death"
				"useSkill" "krl_va_combatGerald_action"
				"startTurn" "krl_va_combatGerald_turnStart"
				"promote" "krl_va_combatGerald_promote"
				"victory" "krl_va_combatGerald_victory"
				"selectHero" "krl_va_combatGerald_select"
			}
		}
	}

	"RLHumanGeraldLightSeekerLvl2" 
	{
		"InheritsFrom" "RLHumanGeraldLightSeekerLvl1"
		"nextLevelArchetype" "RLHumanGeraldLightSeekerLvl3"

		"stats"
		{

			"level" "2"
			"health_max" "10"
			"armor_max" "5"
			"baseDamage"  "6"
			"armor_regen_per_turn" "2"
			"armor_gain_passTurn" "2"
			
			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}
	}

	"RLHumanGeraldLightSeekerLvl3" 
	{
		"InheritsFrom" "RLHumanGeraldLightSeekerLvl1"

		"stats"
		{

			"level" "3"
			"health_max" "12"
			"armor_max" "6"
			"baseDamage"  "8"
			"armor_regen_per_turn" "3"
			"armor_gain_passTurn" "2"
			
			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}
	}

	"RLHumanAsraDagerfallLvl1" 
	{
		"UniqueId" "Asra"
		"Model" "HumanAsra"
		"MetaExo" "ExoSkeletonHumanAsra_MetaDataAsset"
		"Name" "ASRA_DAGERFALL"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Legend|DarkLegend|Asra|VeznanFaction|Female|ct_legend|ct_ranged|ct_athletics|ct_perception|ct_stealth|ct_dark||UPGRADES_athletic"
		"Background" "hero_roster_legend_bg_forest"
		"Icon" "Asst_Banner_Asra"
		"AttackType" "RANGED"
		"UnitOnMap" "Asst_Party_Azra"
		"PortraitBackgroundColor" "4d5380"
		"nextLevelArchetype" "RLHumanAsraDagerfallLvl2"

		"stats"
		{

			"level" "1"
				
			"health_max" "4"
			"armor_max" "2"
			"armor_regen_per_turn" "0"
			"baseDamage"  "5"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			"evasion" "0.25" 
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"10" "dodge_trait"
			"11" "asra_shield_of_shadows_trait"

			"100" "athletics_endturn_trait"
 		}

 		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "asra_onyx_arrows"
 			}

 			"2" 
 			{
 				"1" "asra_spider_bite"
 				"2" "asra_shiv"
 				"3" "asra_hit_and_run"
 			}

 			"3"
 			{
 				"1" "asra_shadow_strike"
 				"2" "asra_shadows_lullaby"
 				"3" "asra_spider_stance"
 			}
 		}

 		"defaultSkill" "arrow_of_sorrow"

 		"states"
  		{
  			"LEGEND" "1"
  		}

  		"soundConfig"
		{
			"assetId" "DynamicSoundGroupAsraSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatAsra_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatAsra_death"
				"useSkill" "krl_va_combatAsra_action"
				"startTurn" "krl_va_combatAsra_turnStart"
				"promote" "krl_va_combatAsra_promote"
				"victory" "krl_va_combatAsra_victory"
				"selectHero" "krl_va_combatAsra_select"
			}
		}
	}

	"RLHumanAsraDagerfallLvl2" 
	{
		"InheritsFrom" "RLHumanAsraDagerfallLvl1"
		"nextLevelArchetype" "RLHumanAsraDagerfallLvl3"

		"stats"
		{
			"level" "2"
				
			"health_max" "6"
			"armor_max" "2"
			"armor_regen_per_turn" "0"
			"baseDamage"  "5"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			"evasion" "0.25" 
			
			"walkSpeed" "3"
		}
	}

	"RLHumanAsraDagerfallLvl3" 
	{
		"InheritsFrom" "RLHumanAsraDagerfallLvl1"

		"stats"
		{
			"level" "3"
				
			"health_max" "8"
			"armor_max" "2"
			"armor_regen_per_turn" "0"
			"baseDamage"  "7"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			"evasion" "0.25" 
			
			"walkSpeed" "3"
		}
	}

	"RLDemonOlochLvl1"
	{
		"UniqueId" 					"DemonOloch"
		"Model" 					"DemonOloch"
		"MetaExo" 					"ExoSkeletonDemonOloch_MetaDataAsset"
		"Name" 						"OLOCH_DEMON"
		"InheritsFrom" 				"Hero"
		"cinematicTags" 			"Heroe|Legend|DarkLegend|Oloch|VeznanFaction|Male|ct_legend|ct_ranged|ct_social|ct_knowledge|ct_magic|UPGRADES_magic"
		"Background" 				"hero_roster_legend_bg_forest"
		"Icon" 						"Asst_Banner_Asra"
		"AttackType" 				"MAGIC"
		"UnitOnMap" 				"Asst_Party_Oloch"
		"PortraitBackgroundColor" 	"663300"
		"nextLevelArchetype" 		"RLDemonOlochLvl2"

		"stats"
		{
			"level" 				"1"
			"health_max" 			"5"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"baseDamage"  			"4"
			"rangedAttackRange" 	"4"
			"rangedAttackMinRange" 	"2"
			"visualMoveSpeed" 		"1.3"
			"visualRunSpeed" 		"1.3"
			"walkSpeed" 			"2"
		}

		"skills"
		{	
 			"10" 					"infernal_combustion_trait"
			"100" 					"magic_endturn_trait"
			"101" "wasteland_forged_by_fire_trait"
 		}

 		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "seal_of_immolation"
 			}

 			"2" 
 			{
 				"1" "magma_eruption"
 				"2" "oloch_magma_rift"
 				"3" "oloch_burning_claw"
 			}

 			"3"
 			{
 				"1" "demonic_duplication"
 				"2" "oloch_demonlord_call"
 				"3" "oloch_fire_barrier"
 			}
 		}

 		"defaultSkill" 				"abyssal_blast"

 		"states"
  		{
  			"LEGEND" 				"1"
  		}

  		"soundConfig"
		{	
			"assetId" "DynamicSoundGroupOlochSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatOloch_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatOloch_death"
				"useSkill" "krl_va_combatOloch_action"
				"startTurn" "krl_va_combatOloch_turnStart"
				"promote" "krl_va_combatOloch_promote"
				"victory" "krl_va_combatOloch_victory"
				"selectHero" "krl_va_combatOloch_select"
			}
		}
	}

	"RLDemonOlochLvl2"
	{
		"InheritsFrom" 		 "RLDemonOlochLvl1"
		"nextLevelArchetype" "RLDemonOlochLvl3"

		"stats"
		{
			"level" 				"2"
			"health_max" 			"7"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"baseDamage"  			"6"
			"rangedAttackRange" 	"4"
			"rangedAttackMinRange" 	"2"
			"visualMoveSpeed" 		"1.3"
			"visualRunSpeed" 		"1.3"
			"walkSpeed" 			"2"
		}
	}

	"RLDemonOlochLvl3"
	{
		"InheritsFrom" 		 "RLDemonOlochLvl1"

		"stats"
		{
			"level" 				"3"
			"health_max" 			"9"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"baseDamage"  			"8"
			"rangedAttackRange" 	"5"
			"rangedAttackMinRange" 	"2"
			"visualMoveSpeed" 		"1.3"
			"visualRunSpeed" 		"1.3"
			"walkSpeed" 			"2"
		}
	}

	"RLBruxaLvl1"
	{
		"UniqueId" 					"Bruxa"
		"Model" 					"HumanBruxa"
		"MetaExo" 					"ExoSkeletonHumanBruxa_MetaDataAsset"
		"Name" 						"BRUXA_VOODOO"
		"InheritsFrom" 				"Hero"
		"cinematicTags" 			"Heroe|Legend|NeutralLegend|Bruxa|Female|ct_legend|ct_ranged|ct_knowledge|ct_wisdom|ct_magic|UPGRADES_magic"
		"Background" 				"hero_roster_legend_bg_forest"
		"Icon" 						"Asst_Banner_Asra"
		"AttackType" 				"MAGIC"
		"UnitOnMap" 				"Asst_Party_Bruxa"
		"PortraitBackgroundColor" 	"a65acc"
		"nextLevelArchetype" 		"RLBruxaLvl2"

		"stats"
		{
			"level" 				"1"
			"health_max" 			"5"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"baseDamage"  			"4"
			"rangedAttackRange" 	"4"
			"rangedAttackMinRange" 	"2"
			"visualMoveSpeed" 		"2"
			"visualRunSpeed" 		"2"
			"walkSpeed" 			"2"
			"skulls"				"0"
			"initialSkulls"			"0"
			"skulls_max"			"1"
		}

		"skills"
		{	
			"10" 	"bruxa_laughing_skulls_trait"
			"100" 	"magic_endturn_trait"
 		}

 		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "bruxa_graveyard_kiss"
 			}

 			"2" 
 			{
 				"1" "bruxa_voodoo_blow"
 				"2" "bruxa_voodoo_ritual"
 				"3" "bruxa_voodoo_bomb"
 			}

 			"3"
 			{
 				"1" "bruxa_skull_sacrifice"
 				"2" "bruxa_skull_dance"
 				"3" "bruxa_voodoo_doll"
 			}
 		}

 		"defaultSkill" 				"bruxa_voodoo_blast"

 		"states"
  		{
  			"LEGEND" 				"1"
  		}

  		"soundConfig"
		{	
			"assetId" "DynamicSoundGroupBruxaSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatBruxa_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatBruxa_death"
				"useSkill" "krl_va_combatBruxa_action"
				"startTurn" "krl_va_combatBruxa_turnStart"
				"promote" "krl_va_combatBruxa_promote"
				"victory" "krl_va_combatBruxa_victory"
				"selectHero" "krl_va_combatBruxa_select"
			}
		}
	}

	"RLBruxaLvl2"
	{
		"InheritsFrom" 		 "RLBruxaLvl1"
		"nextLevelArchetype" "RLBruxaLvl3"

		"stats"
		{
			"level" 				"2"
			"health_max" 			"7"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"baseDamage"  			"5"
			"rangedAttackRange" 	"4"
			"rangedAttackMinRange" 	"2"
			"visualMoveSpeed" 		"2"
			"visualRunSpeed" 		"2"
			"walkSpeed" 			"2"
			"skulls_max"			"2"
		}
	}

	"RLBruxaLvl3"
	{
		"InheritsFrom" 		 "RLBruxaLvl1"

		"stats"
		{
			"level" 				"3"
			"health_max" 			"9"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"baseDamage"  			"7"
			"rangedAttackRange" 	"5"
			"rangedAttackMinRange" 	"2"
			"visualMoveSpeed" 		"2"
			"visualRunSpeed" 		"2"
			"walkSpeed" 			"2"
			"skulls_max"			"3"
		}
	}

	"RLRegsonLvl1" 
	{
		"UniqueId" "Regson"
		"Model" "Regson"
		"MetaExo" "ExoSkeletonRegson_MetaDataAsset"
		"Name" "REGSON"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Legend|NeutralLegend|Regson|NeutralFaction|Male|ct_legend|ct_athletics|ct_perception|ct_wisdom|UPGRADES_athletic"
		"nextLevelArchetype" "RLRegsonLvl2"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Banner_Asra"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_Regson"
		"PortraitBackgroundColor" "5a4424"

		"stats"
		{

			"level" "1"
				
			"health_max" "6"
			"armor_max" "2"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "5"

			"rangedAttackRange" "0" 
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "3"
		}

		"skills"
		{
			"100" "regson_eldritch_heal_trait"
			"200" "regson_eldritch_syphon_trait"
			"300" "athletics_endturn_trait"
 		}
		
		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "regson_vicious_lounge"
 			}

 			"2" 
 			{
 				"1" "regson_shadow_uppercut"
 				"2" "regson_blood_veil"
 				"3" "regson_eldritch_focus"
 			}

 			"3"
 			{	
 				"1" "regson_vindicator"
 				"2" "regson_eldritch_fury"
 				"3" "regson_twilight_step"
 			}
 		}

 		"defaultSkill" "regson_eldritch_blades"

 		"states"
  		{
  			"LEGEND" 				"1"
  		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupRegsonSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatRegson_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatRegson_death"
				"useSkill" "krl_va_combatRegson_action"
				"startTurn" "krl_va_combatRegson_turnStart"
				"promote" "krl_va_combatRegson_promote"
				"selectHero" "krl_va_combatRegson_select"
				"victory" "krl_va_combatRegson_victory"
			}
		}
	}


	"RLRegsonLvl2" 
	{
		"InheritsFrom" 			"RLRegsonLvl1"
		"nextLevelArchetype" 	"RLRegsonLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "8"
			"armor_max" "2"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "7"

			"rangedAttackRange" "0" 
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "3"
		}
	}


	"RLRegsonLvl3" 
	{
		"InheritsFrom" "RLRegsonLvl1"

		"stats"
		{

			"level" "3"
				
			"health_max" "11"
			"armor_max" "2"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "8"

			"rangedAttackRange" "0" 
			"rangedAttackMinRange" "0"
			
			"walkSpeed" "4"
		}
	}

	"RLBravebarkLvl1" 
	{
		"UniqueId" "Bravebark"
		"Model" "Bravebark"
		"MetaExo" "ExoSkeletonBraveBark_MetaDataAsset"
		"Name" "BRAVEBARK"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Legend|NeutralLegend|Bravebark|NeutralFaction|Male|ct_legend|ct_might|ct_survival|ct_wisdom|UPGRADES_mighty"
		"nextLevelArchetype" "RLBravebarkLvl2"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Banner_Lightseeker" 
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_BraveBark"
		"PortraitBackgroundColor" "5a4424"

		"stats"
		{
			"level" "1"
				
			"health_max" "9"
			"armor_max" "2"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "2"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "0"
			
			"visualMoveSpeed" "0.75" 
			"visualRunSpeed" "0.75"
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"100" "bravebark_thickbark_trait"
			"200" "bravebark_springsap_trait"
			"101" 	"mighty_endturn_trait"
			"200" 	"custom_step_sound_trait"
 		}
		
		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "bravebark_branchball"
 			}

 			"2" 
 			{
 				"1" "bravebark_rootspike"
 				"2" "bravebark_natures_wrath"
 				"3" "bravebark_seismic_pound"
 			}

 			"3"
 			{	
 				"1" "bravebark_wood_wide_web"
 				"2" "bravebark_pulling_vines"
 				"3" "bravebark_hearts_bark"
 			}
 		}

 		"defaultSkill" "bravebark_branchbat"

 		"states"
  		{
  			"LEGEND" 				"1"
  		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupBravebarkSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatBravebark_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatBravebark_death"
				"useSkill" "krl_va_combatBravebark_action"
				"startTurn" "krl_va_combatBravebark_turnStart"
				"promote" "krl_va_combatBravebark_promote"
				"selectHero" "krl_va_combatBravebark_select"
				"victory" "krl_va_combatBravebark_victory"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}


	"RLBravebarkLvl2" 
	{
		"InheritsFrom" 			"RLBravebarkLvl1"
		"nextLevelArchetype" 	"RLBravebarkLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "12"
			"armor_max" "3"
			"baseDamage"  "5"

		}
	}


	"RLBravebarkLvl3" 
	{
		"InheritsFrom" "RLBravebarkLvl1"

		"stats"
		{

			"level" "3"
				
			"health_max" "14"
			"armor_max" "4"
			"armor_regen_per_turn" "1"
			"armor_gain_passTurn" "2"
			"baseDamage"  "7"

		}
	}

	"MinionFemaleKnight" 
	{
		"UniqueId" "FemaleKnight"
		"Model" "HumanFemaleKnight"
		"MetaExo" "ExoSkeletonHumanFemaleKnight_MetaDataAsset"
		"Name" "MINION_FEMALE_KNIGHT"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Female|Knight|ct_minion|ct_might|ct_perception|ct_social|UPGRADES_mighty"
		"nextLevelArchetype" "MinionFemaleKnightLvl2"
		"Icon" "Asst_Banner_Knight" 
		"Background" "hero_roster_companion_bg_forest"
		"AttackType" "PHYSICAL"
		"UnitOnMap" "Asst_Party_Knight"		
		"PortraitBackgroundColor" "5f777f"

		"stats"
		{

			"level" "1"
				
			"health_max" "5"
			"armor_max" "6"
			"armor_regen_per_turn" "2"

			"armor_gain_passTurn" "2"

			"baseDamage"  "3"

			"rangedAttackRange" "0" 
			
			"blockChance" "0.25"
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" 	"block_trait"
			"100" 	"mighty_endturn_trait"
 		}

 		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "knight_shield_bash"
 			}

 			"2" 
 			{
 				"1" "knight_gain_terrain"
 				"2" "knight_hold_the_line"
 			}

 			"3"
 			{
 				"1" "charge"
 				"2" "knight_shieldarang"
 			}
 		}

 		"defaultSkill" "knight_slash"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupKnightSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatKnight_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatKnight_death"
				"useSkill" "krl_va_combatKnight_action"
				"startTurn" "krl_va_combatKnight_turnStart"
				"promote" "krl_va_combatKnight_promote"
				"selectHero" "krl_va_combatKnight_select"
			}
		}
	}


	"MinionFemaleKnightLvl2" 
	{
		"InheritsFrom" "MinionFemaleKnight"
		"nextLevelArchetype" "MinionFemaleKnightLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "7"
			"armor_max" "6"
			"armor_regen_per_turn" "3"

			"armor_gain_passTurn" "2"

			"baseDamage"  "4"

			"rangedAttackRange" "0" 
			
			"blockChance" "0.25"
			
			"walkSpeed" "2"
		}
	}


	"MinionFemaleKnightLvl3" 
	{
		"InheritsFrom" "MinionFemaleKnight"

		"stats"
		{

			"level" "3"
				
			"health_max" "8"
			"armor_max" "9"
			"armor_regen_per_turn" "4"

			"armor_gain_passTurn" "2"

			"baseDamage"  "5"

			"rangedAttackRange" "0" 
			
			"blockChance" "0.25"
			
			"walkSpeed" "2"
		}
	}


	"MinionRanger" 
	{
		"UniqueId" "Ranger"
		"Model" "HumanArcher"
		"MetaExo" "ExoSkeletonHumanRanger_MetaDataAsset"
		"Name" "MINION_RANGER"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|Ranger|ct_minion|ct_ranged|ct_athletics|ct_survival|ct_stealth|UPGRADES_athletic"
		"nextLevelArchetype" "MinionRangerLvl2"
		"AttackType" "RANGED"
		"Icon" "Asst_Banner_Ranger"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_Ranger"
		"PortraitBackgroundColor" "7d8f28"

		"stats"
		{

			"level" "1"

			"health_max" "4"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"baseDamage"  "4"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" 		"agility_trait"
			"100" 		"athletics_endturn_trait"
 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "ranger_poison_arrow"
 			}

 			"2" 
 			{
 				"1" "summon_wolf"
 				"2" "ranger_summon_brambles"
 			}

 			"3"
 			{
 				"1" "ricochet_shot"
 				"2" "ranger_kebab_shot"
 			}
 		}

 		"defaultSkill" "ranger_precise_shot"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupRangerSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatRanger_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatRanger_death"
				"useSkill" "krl_va_combatRanger_action"
				"startTurn" "krl_va_combatRanger_turnStart"
				"promote" "krl_va_combatRanger_promote"
				"selectHero" "krl_va_combatRanger_select"
			}
		}
	}


	"MinionRangerLvl2" 
	{
		"InheritsFrom" "MinionRanger"
		"nextLevelArchetype" "MinionRangerLvl3"

		"stats"
		{

			"level" "2"

			"health_max" "5"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"baseDamage"  "5"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}
	}

	"MinionRangerLvl3" 
	{
		"InheritsFrom" "MinionRanger"

		"stats"
		{

			"level" "3"

			"health_max" "5"
			"armor_max" "2"
			"armor_regen_per_turn" "0"

			"baseDamage"  "6"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "3"
		}
	}


	"MinionBarbarian" 
	{
		"UniqueId" "Barbarian"
		"Model" "HumanBarbarian"
		"MetaExo" "ExoSkeletonHumanBarbarian_MetaDataAsset"
		"Name" "MINION_BARBARIAN"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|Barbarian|ct_minion|ct_might|ct_survival|ct_wisdom|UPGRADES_mighty"
		"nextLevelArchetype" "MinionBarbarianLvl2"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Banner_Barbarian"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_Barbarian"
		"PortraitBackgroundColor" "5a4424"

		"stats"
		{

			"level" "1"
				
			"health_max" "9"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "2"
			"baseDamage"  "6"

			"rangedAttackRange" "0" 
			"rangedAttackMinRange" "1"
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "berserk_trait" 
			"100" "mighty_endturn_trait"
 		}
		
		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "whirlwind_strike"
 			}

 			"2" 
 			{
 				
 				"1" "brutal_strike"
 				"2" "barbarian_berserk_ritual"
 			}

 			"3"
 			{	
 				"1" "leap"
 				"2" "barbarian_wrecking_roll"
 			}
 		}

 		"defaultSkill" "cleave"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupBarbarianSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatBarbarian_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatBarbarian_death"
				"useSkill" "krl_va_combatBarbarian_action"
				"startTurn" "krl_va_combatBarbarian_turnStart"
				"promote" "krl_va_combatBarbarian_promote"
				"selectHero" "krl_va_combatBarbarian_select"
			}
		}
	}


	"MinionBarbarianLvl2" 
	{
		"InheritsFrom" "MinionBarbarian"
		"nextLevelArchetype" "MinionBarbarianLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "11"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "2"
			"baseDamage"  "8"

			"rangedAttackRange" "0" 
			"rangedAttackMinRange" "1"
			
			"walkSpeed" "2"
		}
	}


	"MinionBarbarianLvl3" 
	{
		"InheritsFrom" "MinionBarbarian"

		"stats"
		{

			"level" "3"
				
			"health_max" "13"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "2"
			"baseDamage"  "9"

			"rangedAttackRange" "0" 
			"rangedAttackMinRange" "1"
			
			"walkSpeed" "3"
		}
	}

	"MinionArcaneMage" 
	{
		"UniqueId" "ArcaneMage"
		"Model" "HumanArcaneMage"
		"MetaExo" "ExoSkeletonHumanArcaneMage_MetaDataAsset"
		"Name" "MINION_ARCANE_MAGE"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|Wizard|ct_minion|ct_ranged|ct_magic|ct_perception|ct_knowledge|UPGRADES_magic"
		"nextLevelArchetype" "MinionArcaneMageLvl2"
		"AttackType" "MAGIC"
		"Icon" "Asst_Banner_Arcane"
		"Background" "hero_roster_legend_bg_forest"
		"PortraitBackgroundColor" "cca13d"
		"UnitOnMap" "Asst_Party_Mage"

		"stats"
		{

			"level" "1"
			"health_max" "3"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "arcane_replenish_trait"
			"100" "magic_endturn_trait"
  		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "arcane_magic_missile"
 			}

 			"2" 
 			{
 				"1" "arcane_ice_lance"
 				"2" "arcane_mage_teleport"
 			}

 			"3"
 			{
 				"1" "fireball"
 				"2" "arcane_mage_disintegrate"
 			}
 		}

 		"defaultSkill" "arcane_ray"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupArcaneMageSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatArcaneMage_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatArcaneMage_death"
				"useSkill" "krl_va_combatArcaneMage_action"
				"startTurn" "krl_va_combatArcaneMage_turnStart"
				"promote" "krl_va_combatArcaneMage_promote"
				"selectHero" "krl_va_combatArcaneMage_select"
				"walk" ""
			}
		}

	}



	"MinionArcaneMageLvl2" 
	{
		"InheritsFrom" "MinionArcaneMage"
		"nextLevelArchetype" "MinionArcaneMageLvl3"

		"stats"
		{

			"level" "2"
			"health_max" "4"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "6"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}
	}


	"MinionArcaneMageLvl3" 
	{
		"InheritsFrom" "MinionArcaneMage"

		"stats"
		{

			"level" "3"
			"health_max" "5"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "7"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "3"
		}
	}


	"MinionDarkKnight" 
	{
		"UniqueId" "DarkKnight"
		"Model" "HumanDarkKnight"
		"MetaExo" "ExoSkeletonHumanDarkKnight_MetaDataAsset"
		"Name" "MINION_DARKKNIGHT"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|VeznanFaction|Male|DarkKnight|ct_minion|ct_unholy|ct_might|UPGRADES_mighty"
		"nextLevelArchetype" "MinionDarkKnightLvl2"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Banner_DarkKnight"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_DarkKnight"
		"PortraitBackgroundColor" "323248"

		"stats"
		{
			"level" "1"		
			"health_max" "4"
			"armor_max" "7"
			"armor_regen_per_turn" "2"
			"armor_gain_passTurn" "2"
			"baseDamage"  "3"
			"rangedAttackRange" "0" 
			"walkSpeed" "2"
			"armorOfThornsDamage"	"1"
		}

		"skills"
		{
			"11" "darkknight_armor_of_thorns_trait"
			"100" "mighty_endturn_trait"
 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "darkknight_rupture"
 			}

 			"2" 
 			{
 				"1" "darkknight_impervious"
 				"2" "darkknight_spike_reforge"
 			}

 			"3"
 			{
 				"1" "darkknight_soulstrike"
 				"2" "darkknight_porcupine_slam"
 			}
 		}

 		"defaultSkill" "darkknight_slash"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupDarkKnightSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatDarkKnight_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatDarkKnight_death"
				"useSkill" "krl_va_combatDarkKnight_action"
				"startTurn" "krl_va_combatDarkKnight_turnStart"
				"promote" "krl_va_combatDarkKnight_promote"
				"selectHero" "krl_va_combatDarkKnight_select"
			}
		}
	}


	"MinionDarkKnightLvl2" 
	{
		"InheritsFrom" "MinionDarkKnight"
		"nextLevelArchetype" "MinionDarkKnightLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "5"
			"armor_max" "8"
			"armor_regen_per_turn" "3"
			"armor_gain_passTurn" "2"
			"baseDamage"  "4"

			"rangedAttackRange" "0" 
			"walkSpeed" "2"
		}
	}


	"MinionDarkKnightLvl3" 
	{
		"InheritsFrom" "MinionDarkKnight"

		"stats"
		{

			"level" "3"
				
			"health_max" "6"
			"armor_max" "9"
			"armor_regen_per_turn" "4"
			"armor_gain_passTurn" "2"
			"baseDamage"  "6"
			"armorOfThornsDamage"	"2"

			"rangedAttackRange" "0" 
			"walkSpeed" "2"
		}
	}


	"MinionDwarfBombardier" 
	{
		"UniqueId" "Bombardier"
		"Model" "HumanDwarfFemale"
		"MetaExo" "ExoSkeletonHumanDwarfFemale_MetaDataAsset"
		"Name" "MINION_DWARF_BOMBARDIER"
		"InheritsFrom" "Hero"
		"nextLevelArchetype" "MinionDwarfBombardierLvl2"
		"cinematicTags" "Heroe|Minion|Female|Bombardier|ct_minion|ct_ranged|ct_craft|ct_knowledge|ct_wisdom|UPGRADES_crafty"
		"AttackType" "ARTILLERY"
		"Icon" "Asst_Banner_Bombardier"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_Bombardier"
		"PortraitBackgroundColor" "cc9629"
		
		"stats"
		{

			"level" "1"

			"health_max" "4"
			"armor_max" "2"
			"armor_regen_per_turn" "1"

			"baseDamage"  "2"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"10" "mayhem_trait"
			"100" "crafty_endturn_trait"
 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "big_badaboom"
 			}

 			"2" 
 			{
 				"1" "dwarf_zooka"
 				"2" "bombardier_napalm_shower"
 			}

 			"3"
 			{
 				"1" "rocket_jump"
 				"2" "bombardier_robombs"
 			}
 		}

 		"defaultSkill" "shortfuse"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupBombardierSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatBombardier_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatBombardier_death"
				"useSkill" "krl_va_combatBombardier_action"
				"startTurn" "krl_va_combatBombardier_turnStart"
				"promote" "krl_va_combatBombardier_promote"
				"selectHero" "krl_va_combatBombardier_select"
			}
		}
	}

	"MinionDwarfBombardierLvl2" 
	{
		"InheritsFrom" "MinionDwarfBombardier"
		"nextLevelArchetype" "MinionDwarfBombardierLvl3"

		"stats"
		{

			"level" "2"

			"health_max" "5"
			"armor_max" "3"
			"armor_regen_per_turn" "1"

			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}
	}


	"MinionDwarfBombardierLvl3" 
	{
		"InheritsFrom" "MinionDwarfBombardier"

		"stats"
		{

			"level" "3"

			"health_max" "5"
			"armor_max" "4"
			"armor_regen_per_turn" "2"

			"baseDamage"  "5"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}
	}

	"MinionOrcCleaver"
	{
		"UniqueId" "OrcCleaver"
		"Model" "OrcCleaver"
		"MetaExo" "ExoSkeletonOrcCleaver_MetaDataAsset"
		"Name" "MINION_ORC_CLEAVER"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|OrcCleaver|ct_minion|ct_might|ct_perception|ct_survival|UPGRADES_mighty|LOCKED"
		"nextLevelArchetype" "MinionOrcCleaverLvl2"
		"Icon" "Asst_Banner_Knight" 
		"Background" "hero_roster_companion_bg_forest"
		"AttackType" "PHYSICAL"
		"UnitOnMap" "Asst_Party_OrcCleaver"		
		"PortraitBackgroundColor" "708B8E"

		"stats"
		{

			"level" "1"
				
			"health_max" "6"
			"armor_max" "3"
			"armor_regen_per_turn" "1"

			"armor_gain_passTurn" "2"

			"baseDamage"  "5"

			"rangedAttackRange" "0" 
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "counter_stance"
 			"100" "mighty_endturn_trait"
 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "cleaver_brutal_strike"
 			}

 			"2" 
 			{
 				"1" "cleaver_pommel_strike"
 				"2" "cleaver_parry_stance"
 			}

 			"3"
 			{
 				"1" "cleaver_whirlwind_strike"
 				"2" "cleaver_undying_rage"
 			}
 		}

 		"defaultSkill" "cleaver_slash"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupOrcCleaverSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatOrcCleaver_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatOrcCleaver_death"
				"useSkill" "krl_va_combatOrcCleaver_action"
				"startTurn" "krl_va_combatOrcCleaver_turnStart"
				"promote" "krl_va_combatOrcCleaver_promote"
				"selectHero" "krl_va_combatOrcCleaver_select"
			}
		}
	}


	"MinionOrcCleaverLvl2" 
	{
		"InheritsFrom" "MinionOrcCleaver"
		"nextLevelArchetype" "MinionOrcCleaverLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "7"
			"armor_max" "4"
			"armor_regen_per_turn" "2"

			"armor_gain_passTurn" "2"

			"baseDamage"  "6"

			"rangedAttackRange" "0" 
			
			"walkSpeed" "2"
		}
	}


	"MinionOrcCleaverLvl3" 
	{
		"InheritsFrom" "MinionOrcCleaver"

		"stats"
		{

			"level" "3"
				
			"health_max" "9"
			"armor_max" "6"
			"armor_regen_per_turn" "3"

			"armor_gain_passTurn" "2"

			"baseDamage"  "7"

			"rangedAttackRange" "0" 
			
			"walkSpeed" "2"
		}
	}

	"MinionWitchDoctor" 
	{
		"UniqueId" "WitchDoctor"
		"Model" "RenegadeOrcShaman"
		"MetaExo" "ExoSkeletonRenegadeOrcShaman_MetaDataAsset"
		"Name" "MINION_WITCH_DOCTOR"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|WitchDoctor|ct_minion|ct_ranged|ct_magic|ct_wisdom|ct_knowledge|UPGRADES_magic|LOCKED"
		"nextLevelArchetype" "MinionWitchDoctorLvl2"
		"AttackType" "MAGIC"
		"Icon" "Asst_Banner_Arcane"
		"Background" "hero_roster_legend_bg_forest"
		"PortraitBackgroundColor" "3a9c81"
		"UnitOnMap" "Asst_Party_RenegadeOrcShaman"

		"stats"
		{

			"level" "1"
			"health_max" "3"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "3"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "shamanic_focus_trait"
			"100" "magic_endturn_trait"
  		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "witch_doctor_healing"
 			}

 			"2" 
 			{
 				"1" "telekinesis"
 				"2" "witch_doctor_tainted_healing"
 			}

 			"3"
 			{
 				"1" "witch_doctor_ring_of_healing"
 				"2" "witch_doctor_healing_totem"
 			}
 		}

 		"defaultSkill" "witch_doctor_blast"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupWitchDoctorSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatWitchDoctor_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatWitchDoctor_death"
				"useSkill" "krl_va_combatWitchDoctor_action"
				"startTurn" "krl_va_combatWitchDoctor_turnStart"
				"promote" "krl_va_combatWitchDoctor_promote"
				"selectHero" "krl_va_combatWitchDoctor_select"
			}
		}

	}



	"MinionWitchDoctorLvl2" 
	{
		"InheritsFrom" "MinionWitchDoctor"
		"nextLevelArchetype" "MinionWitchDoctorLvl3"

		"stats"
		{

			"level" "2"
			"health_max" "4"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}
	}


	"MinionWitchDoctorLvl3" 
	{
		"InheritsFrom" "MinionWitchDoctor"

		"stats"
		{

			"level" "3"
			"health_max" "5"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "6"

			"rangedAttackRange" "6" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}
	}

	"MinionSasquatch" 
	{
		"UniqueId" "Sasquatch"
		"Model" "Sasquatch"
		"MetaExo" "ExoSkeletonSasquatch_MetaDataAsset"
		"Name" "MINION_SASQUATCH"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|Sasquatch|ct_minion|ct_might|ct_perception|ct_survival|UPGRADES_mighty|LOCKED"
		"nextLevelArchetype" "MinionSasquatchLvl2"
		"Icon" "Asst_Banner_Knight" 
		"Background" "hero_roster_companion_bg_forest"
		"AttackType" "PHYSICAL"
		"UnitOnMap" "Asst_Party_Sasquatch"		
		"PortraitBackgroundColor" "bf9d2f"

		"stats"
		{

			"level" "1"
				
			"health_max" "8"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "4"
			"sasquatch_regeneration" "1"

			"rangedAttackRange" "3" 
			
			"walkSpeed" "1"
		}

		"skills"
		{
			"11" "sasquatch_regeneration_trait"
 			"100" "mighty_endturn_trait"
 			"200" 	"custom_step_sound_trait"
 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "sasquatch_mudball_throw"
 			}

 			"2" 
 			{
 				"1" "sasquatch_mighty_blow"
 				"2" "sasquatch_ground_spike"
 			}

 			"3"
 			{
 				"1" "sasquatch_abominable_growl"
 				"2" "sasquatch_abominable_chomp"
 			}
 		}

 		"defaultSkill" "sasquatch_smash"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSasquatchSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatSasquatch_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatSasquatch_death"
				"useSkill" "krl_va_combatSasquatch_action"
				"startTurn" "krl_va_combatSasquatch_turnStart"
				"promote" "krl_va_combatSasquatch_promote"
				"selectHero" "krl_va_combatSasquatch_select"
				"selectHero" "krl_va_combatSasquatch_select"
				"abominableGrunt" "krl_va_combatSasquatch_abominableGrunt"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}


	"MinionSasquatchLvl2" 
	{
		"InheritsFrom" "MinionSasquatch"
		"nextLevelArchetype" "MinionSasquatchLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "10"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "5"
			"sasquatch_regeneration" "1"

			"rangedAttackRange" "3" 
			
			"walkSpeed" "2"
		}
	}


	"MinionSasquatchLvl3" 
	{
		"InheritsFrom" "MinionSasquatch"

		"stats"
		{

			"level" "3"
				
			"health_max" "14"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "6"
			"sasquatch_regeneration" "2"

			"rangedAttackRange" "3" 
			
			"walkSpeed" "2"
		}
	}

	"MinionTesla" 
	{
		"UniqueId" "Tesla"
		"Model" "HumanTesla"
		"MetaExo" "ExoSkeletonHumanTesla_MetaDataAsset"
		"Name" "MINION_TESLA"
		"InheritsFrom" "Hero"
		"nextLevelArchetype" "MinionTeslaLvl2"
		"cinematicTags" "Heroe|Minion|Male|Tesla|ct_minion|ct_ranged|ct_craft|ct_knowledge|ct_perception|UPGRADES_crafty"
		"AttackType" "ARTILLERY"
		"Icon" "Asst_Banner_Bombardier"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_Tesla"
		"PortraitBackgroundColor" "cc9629"
		
		"stats"
		{

			"level" "1"

			"health_max" "4"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"baseDamage"  "3"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"10" 		"tesla_shocking_presence"
			"100" "crafty_endturn_trait"

 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "tesla_lightning_ball"
 			}

 			"2" 
 			{
 				"1" "tesla_chain_lightning"
 				"2" "tesla_thunder_strike"
 			}

 			"3"
 			{
 				"1" "tesla_raise_coil"
 				"2" "tesla_magnetic_trap"
 			}
 		}

 		"defaultSkill" "tesla_jolt"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTeslaSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatTesla_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatTesla_death"
				"useSkill" "krl_va_combatTesla_action"
				"startTurn" "krl_va_combatTesla_turnStart"
				"promote" "krl_va_combatTesla_promote"
				"selectHero" "krl_va_combatTesla_select"
			}
		}
	}

	"MinionTeslaLvl2" 
	{
		"InheritsFrom" "MinionTesla"
		"nextLevelArchetype" "MinionTeslaLvl3"

		"stats"
		{

			"level" "2"

			"health_max" "6"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"baseDamage"  "4"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}
	}


	"MinionTeslaLvl3" 
	{
		"InheritsFrom" "MinionTesla"

		"stats"
		{

			"level" "3"

			"health_max" "8"
			"armor_max" "0"
			"armor_regen_per_turn" "2"

			"baseDamage"  "6"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			"walkSpeed" "2"
		}
	}

	"MinionSorceress" 
	{
		"UniqueId" "Sorceress"
		"Model" "HumanSorceress"
		"MetaExo" "ExoSkeletonHumanSorceress_MetaDataAsset"
		"Name" "MINION_SORCERESS"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Female|Sorceress|ct_minion|ct_ranged|ct_magic|ct_wisdom|ct_social|UPGRADES_magic|LOCKED"
		"nextLevelArchetype" "MinionSorceressLvl2"
		"AttackType" "MAGIC"
		"Icon" "Asst_Banner_Arcane"
		"Background" "hero_roster_legend_bg_forest"
		"PortraitBackgroundColor" "3a9c81"
		"UnitOnMap" "Asst_Party_Sorceress"

		"stats"
		{

			"level" "1"
			"health_max" "5"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "sorceress_grounded_trait"
			"100" "magic_endturn_trait"
  		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "sorceress_rotting_curse"
 			}

 			"2" 
 			{
 				"1" "sorceress_corroding_hex"
 				"2" "sorceress_punishing_hex"
 			}

 			"3"
 			{
 				"1" "sorceress_trebuchet"
 				"2"	"sorceress_summon_golem"
 			}
 		}

 		"defaultSkill" "stormcloud_sorcerer_hex_blast"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSorceressSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatSorceress_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatSorceress_death"
				"useSkill" "krl_va_combatSorceress_action"
				"startTurn" "krl_va_combatSorceress_turnStart"
				"promote" "krl_va_combatSorceress_promote"
				"selectHero" "krl_va_combatSorceress_select"
				"walk" ""
			}
		}

	}



	"MinionSorceressLvl2" 
	{
		"InheritsFrom" "MinionSorceress"
		"nextLevelArchetype" "MinionSorceressLvl3"

		"stats"
		{

			"level" "2"
			"health_max" "6"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}
	}


	"MinionSorceressLvl3" 
	{
		"InheritsFrom" "MinionSorceress"

		"stats"
		{

			"level" "3"
			"health_max" "8"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "6"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}
	}

	"MinionSylvanElf" 
	{
		"UniqueId" "SylvanElf"
		"Model" "SylvanElf"
		"MetaExo" "ExoSkeletonHumanSylvanElf_MetaDataAsset"
		"Name" "MINION_SYLVANELF"
		"InheritsFrom" "Hero"
		"cinematicTags" "Heroe|Minion|Male|SylvanElf|ct_minion|ct_ranged|ct_athletics|ct_perception|ct_social|UPGRADES_athletic"
		"nextLevelArchetype" "MinionSylvanElfLvl2"
		"AttackType" "RANGED"
		"Icon" "Asst_Banner_Ranger"
		"Background" "hero_roster_legend_bg_forest"
		"UnitOnMap" "Asst_Party_SylvanElf"
		"PortraitBackgroundColor" "7d8f28"

		"stats"
		{
			"level" "1"

			"health_max" "5"
			"armor_max" "1"
			"armor_regen_per_turn" "0"

			"baseDamage"  "3"

			"rangedAttackRange" "3" 
			"rangedAttackMinRange" "2"
			"evasion" "0.25" 
			
			"walkSpeed" "3"
		}

		"skills"
		{
			"100" 		"agility_trait"
			"101"     "dodge_trait"
			
			"102" 		"athletics_endturn_trait"
 		}

		"skillProgression"
 		{
 			"1" 
 			{
 				"1" "sylvan_elf_living_bow"
 			}

 			"2" 
 			{
 				"1" "sylvan_elf_sylvan_volley"
 				"2" "sylvan_elf_spear_rush"
 			}

 			"3"
 			{
 				"1" "sylvan_elf_woodland_stride"
 				"2" "sylvan_elf_skirmish"
 			}
 		}

 		"defaultSkill" "sylvan_elf_thrust"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSylvanElfSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatSylvanElf_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatSylvanElf_death"
				"useSkill" "krl_va_combatSylvanElf_action"
				"startTurn" "krl_va_combatSylvanElf_turnStart"
				"promote" "krl_va_combatSylvanElf_promote"
				"selectHero" "krl_va_combatSylvanElf_select"
			}
		}
	}


	"MinionSylvanElfLvl2" 
	{
		"InheritsFrom" "MinionSylvanElf"
		"nextLevelArchetype" "MinionSylvanElfLvl3"

		"stats"
		{
			"level" "2"

			"health_max" "6"
			"armor_max" "2"
			"armor_regen_per_turn" "1"

			"baseDamage"  "4"

		}
	}

	"MinionSylvanElfLvl3" 
	{
		"InheritsFrom" "MinionSylvanElf"

		"stats"
		{
			"level" "3"

			"health_max" "8"
			"armor_max" "3"
			"armor_regen_per_turn" "2"

			"baseDamage"  "5"

			"rangedAttackRange" "4" 
		}
	}








	"MinionBulldog" 
	{
		"UniqueId" "Bulldog"
		"Model" "Bulldog"
		"MetaExo" "ExoSkeletonBulldog_MetaDataAsset"
		"Name" "MINION_BULLDOG"
		"InheritsFrom" "Hero"
		
		/"cinematicTags""Minion|Soldier|Female|Jaws|ct_jaws|ct_medium|ct_female|ct_minion|ct_beast"
		"cinematicTags" "Minion|Female|Bulldog|LOCKED"
		"nextLevelArchetype" "MinionBulldogLvl2"
		"Icon" "Asst_Banner_Hound"
		"AttackType" "PHYSICAL"
		"Background" "hero_roster_legend_bg_forest"

		"stats"
		{

			"level" "1"
			"health_max" "4"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "4"

			"rangedAttackRange" "0" 
			
			
			"walkSpeed" "4"
		}

		"skills"
		{
			"1" "heavy_strike"
			"11" "oportunity_attack"
			}

		"skillProgression"
			{
				"2" 
				{
					"1" "war_howl"
				}

				"3"
				{
					"1" "rupture"
				}
			}

			"defaultSkill" "bulldog_melee_attack"
	}


	"MinionBulldogLvl2" 
	{
		"InheritsFrom" "MinionBulldog"
		"nextLevelArchetype" "MinionBulldogLvl3"

		"stats"
		{

			"level" "2"
			"health_max" "5"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "4"

			"rangedAttackRange" "0" 
			
			
			"walkSpeed" "4"
		}
	}


	"MinionBulldogLvl3" 
	{
		"InheritsFrom" "MinionBulldog"
		"nextLevelArchetype" "MinionBulldogLvl4"

		"stats"
		{

			"level" "3"
			"health_max" "6"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "5"

			"rangedAttackRange" "0" 
			
			
			"walkSpeed" "4"
		}
	}

	"MinionBulldogLvl4" 
	{
		"InheritsFrom" "MinionBulldog"
		

		"stats"
		{

			"level" "4"
			"health_max" "7"
			"armor_max" "0"
			"armor_regen_per_turn" "0"

			"armor_gain_passTurn" "2"

			"baseDamage"  "6"

			"rangedAttackRange" "0" 
			
			
			"walkSpeed" "5"
		}
	}

	"MinionKnight" 
	{
		"Model" "HumanSoldier"
		"Name" "MINION_KNIGHT"
		"InheritsFrom" "Hero"
		
		"nextLevelArchetype" "MinionKnightLvl2"
		"AttackType" "PHYSICAL"
		"Background" "hero_roster_legend_bg_forest"

		"stats"
		{

			"level" "1"
			
				
			"health_max" "8"
			"armor_max" "6"
			"armor_regen_per_turn" "2"

			"armor_gain_passTurn" "2"

			"baseDamage"  "3"

			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"skillPool"
 		{
 			"1" "stunning_blow"
 			"2" "shield_wall"
 			"3" "charge"
 		}

 		"defaultSkill" "common_melee_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanMaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanMaleDeath"
			}
		}
	}


	"MinionKnightLvl2" 
	{
		"InheritsFrom" "MinionKnight"
		"nextLevelArchetype" "MinionKnightLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "9"
			"armor_max" "6"
			"armor_regen_per_turn" "2"

			"armor_gain_passTurn" "2"

			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}


	"MinionKnightLvl3" 
	{
		"InheritsFrom" "MinionKnight"

		"stats"
		{

			"level" "3"
				
			"health_max" "9"
			"armor_max" "6"
			"armor_regen_per_turn" "3"

			"armor_gain_passTurn" "2"

			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionKnightLvl4" 
	{
		"InheritsFrom" "MinionKnight"
		"nextLevelArchetype" "MinionKnightLvl5"

		"stats"
		{

			"level" "4"
				
			"health_max" "9"
			"armor_max" "6"
			"armor_regen_per_turn" "3"

			"armor_gain_passTurn" "2"

			"baseDamage"  "5"

			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "3"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionKnightLvl5" 
	{
		"InheritsFrom" "MinionKnight"

		"stats"
		{

			"level" "5"
				
			"health_max" "9"
			"armor_max" "7"
			"armor_regen_per_turn" "3"

			"armor_gain_passTurn" "2"

			"baseDamage"  "6"

			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "3"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionMage" 
	{
		"Model" "HumanMage"
		"MetaExo" "ExoSkeletonHumanArcaneMage_MetaDataAsset"
		
		"Name" "MINION_MAGE"
		"InheritsFrom" "Hero"
		
		"nextLevelArchetype" "MinionMageLvl2"
		"AttackType" "MAGIC"
		"Background" "hero_roster_legend_bg_forest"

		"stats"
		{

			"level" "1"
			"health_max" "5"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "3"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
 		}

 		"skillPool"
 		{
 			"1" "magic_missile"
 			"2" "ice_lance"
 			"3" "fireball"
 		}

 		"defaultSkill" "common_ranged_spell_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanFemaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanFemaleDeath"
			}
		}
	}



	"MinionMageLvl2" 
	{
		"InheritsFrom" "MinionMage"
		"nextLevelArchetype" "MinionMageLvl3"

		"stats"
		{

			"level" "2"
			"health_max" "6"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"

			"rangedAttackRange" "4" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
 		}

 		"defaultSkill" "common_ranged_spell_attack"
	}


	"MinionMageLvl3" 
	{
		"InheritsFrom" "MinionMage"
		"nextLevelArchetype" "MinionMageLvl4"

		"stats"
		{

			"level" "3"
			"health_max" "6"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "2"
		}

		"skills"
		{		
 		}

 		"defaultSkill" "common_ranged_spell_attack"
	}

	"MinionMageLvl4" 
	{
		"InheritsFrom" "MinionMage"
		"nextLevelArchetype" "MinionMageLvl5"

		"stats"
		{

			"level" "4"
			"health_max" "6"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "5"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "3"
		}

		"skills"
		{		
 		}

 		"defaultSkill" "common_ranged_spell_attack"
	}

	"MinionMageLvl5" 
	{
		"InheritsFrom" "MinionMage"

		"stats"
		{

			"level" "5"
			"health_max" "7"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "6"

			"rangedAttackRange" "5" 
			"rangedAttackMinRange" "2"
			
			
			"walkSpeed" "3"
		}

		"skills"
		{		
 		}

 		"defaultSkill" "common_ranged_spell_attack"
	}

	"MinionRogue" 
	{
		"Model" "HumanRogueFemale"
		"Name" "MINION_ROGUE"
		"InheritsFrom" "Hero"
		
		"nextLevelArchetype" "MinionRogueLvl2"
		"AttackType" "PHYSICAL"
		"Background" "hero_roster_legend_bg_forest"

		"stats"
		{

			"level" "1"
				
			"health_max" "5"
			"armor_max" "1"
			"armor_regen_per_turn" "1"
			"baseDamage"  "3"

			"rangedAttackRange" "3" 
			
			"evasion" "0.15" 
			
			"walkSpeed" "3"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"skillPool"
 		{
 			"1" "viper_strike"
 			"2" "shadow_dodge"
 			"3" "chink_in_the_armor"
 		}

 		"defaultSkill" "common_melee_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanFemaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanFemaleDeath"
			}
		}
	}


	"MinionRogueLvl2" 
	{
		"InheritsFrom" "MinionRogue"
		"nextLevelArchetype" "MinionRogueLvl3"

		"stats"
		{

			"level" "2"
				
			"health_max" "6"
			"armor_max" "1"
			"armor_regen_per_turn" "1"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			
			"evasion" "0.15" 
			
			"walkSpeed" "3"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}


	"MinionRogueLvl3" 
	{
		"InheritsFrom" "MinionRogue"
		"nextLevelArchetype" "MinionRogueLvl4"

		"stats"
		{

			"level" "3"
				
			"health_max" "6"
			"armor_max" "1"
			"armor_regen_per_turn" "1"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			
			"evasion" "0.25" 
			
			"walkSpeed" "4"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionRogueLvl4" 
	{
		"InheritsFrom" "MinionRogue"
		"nextLevelArchetype" "MinionRogueLvl5"

		"stats"
		{

			"level" "4"
				
			"health_max" "6"
			"armor_max" "2"
			"armor_regen_per_turn" "1"
			"baseDamage"  "5"

			"rangedAttackRange" "3" 
			
			"evasion" "0.25" 
			
			"walkSpeed" "4"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionRogueLvl5" 
	{
		"InheritsFrom" "MinionRogue"

		"stats"
		{

			"level" "5"
				
			"health_max" "7"
			"armor_max" "2"
			"armor_regen_per_turn" "1"
			"baseDamage"  "5"

			"rangedAttackRange" "3" 
			
			"evasion" "0.5" 
			
			"walkSpeed" "4"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionCleric" 
	{
		"Model" "HumanCleric"
		"MetaExo" "ExoSkeletonHumanCleric_MetaDataAsset"
		"Name" "MINION_CLERIC"
		"InheritsFrom" "Hero"
		"cinematicTags""Minion|Cleric|Male|Mace|ct_mace|ct_medium|ct_male|ct_minion|ct_human|ct_blunt|ct_melee|ct_holy|ct_martial|ct_medicine|ct_might|ct_religion|ct_social|LOCKED"
		"nextLevelArchetype" "MinionClericLvl2"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Banner_Cleric"
		"Background" "hero_roster_legend_bg_forest"

		"stats"
		{

			"level" "1"
							
			"health_max" "5"
			"armor_max" "3"
			"armor_regen_per_turn" "1"
			"baseDamage"  "3"

			"rangedAttackRange" "3" 
			
			
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"skillPool"
 		{
 			"1" "healing_light"
 			"2" "blessing_of_battle"
 			"3" "sacred_vengeance"
 		}

 		"defaultSkill" "common_melee_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanMaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanMaleDeath"
			}
		}
	}


	"MinionClericLvl2" 
	{
		"InheritsFrom" "MinionCleric"
		"nextLevelArchetype" "MinionClericLvl3"

		"stats"
		{

			"level" "2"
							
			"health_max" "6"
			"armor_max" "4"
			"armor_regen_per_turn" "1"
			"baseDamage"  "3"

			"rangedAttackRange" "3" 
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}


	"MinionClericLvl3" 
	{
		"InheritsFrom" "MinionCleric"
		"nextLevelArchetype" "MinionClericLvl4"

		"stats"
		{

			"level" "3"
							
			"health_max" "6"
			"armor_max" "4"
			"armor_regen_per_turn" "1"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			"walkSpeed" "2"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionClericLvl4" 
	{
		"InheritsFrom" "MinionCleric"
		"nextLevelArchetype" "MinionClericLvl5"

		"stats"
		{

			"level" "3"
							
			"health_max" "6"
			"armor_max" "4"
			"armor_regen_per_turn" "2"
			"baseDamage"  "4"

			"rangedAttackRange" "3" 
			"walkSpeed" "3"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MinionClericLvl5" 
	{
		"InheritsFrom" "MinionCleric"

		"stats"
		{

			"level" "3"
							
			"health_max" "7"
			"armor_max" "4"
			"armor_regen_per_turn" "2"
			"baseDamage"  "4"

			"rangedAttackRange" "4" 
			"walkSpeed" "3"
		}

		"skills"
		{
			"11" "oportunity_attack"
 		}

 		"defaultSkill" "common_melee_attack"
	}



	"LegendZPlaceholder" 
	{
		"UniqueId" "LegendZPlaceholder"
		"Model" "HumanWarriorRodrick"
		"Name" "MINION_PLACEHOLDER"
		"InheritsFrom" "Hero"
		"cinematicTags""Legend|Mage|Male|Placeholder|ct_medium|ct_female|ct_legend|ct_human|ct_magical|ct_magic|ct_perception|ct_social"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Legend_Banner_None"
		"Background" "hero_roster_legend_bg_forest"
		
		"stats"
		{

			"level" "1"
			"health_max" "0"
			"armor_max" "0"
			"baseDamage"  "0"
			"armor_gain_passTurn" "4"
			"rangedAttackRange" "3" 
			"walkSpeed" "0"
		}
		"skills"
		{
			"1" "divine_shield"
			"2" "avenging_shield"
			"3" "heavy_strike"
			"11" "oportunity_attack"
 		}
 		"defaultSkill" "common_melee_attack"
	}

	"MinionZPlaceholder" 
	{
		"UniqueId" "MinionZPlaceholder"
		"Model" "HumanWarriorRodrick"
		"Name" "MINION_PLACEHOLDER"
		"InheritsFrom" "Hero"
		"cinematicTags""Minion|Mage|Male|Placeholder|ct_medium|ct_female|ct_minion|ct_human|ct_magical|ct_magic|ct_perception|ct_social"
		"AttackType" "PHYSICAL"
		"Icon" "Asst_Banner_None"
		"Background" "hero_roster_legend_bg_forest"
		
		"stats"
		{

			"level" "1"
			"health_max" "0"
			"armor_max" "0"
			"baseDamage"  "0"
			"armor_gain_passTurn" "4"
			"rangedAttackRange" "3" 
			"walkSpeed" "0"
		}
		"skills"
		{
			"1" "divine_shield"
			"2" "avenging_shield"
			"3" "heavy_strike"
			"11" "oportunity_attack"
 		}
 		"defaultSkill" "common_melee_attack"
	}
}
