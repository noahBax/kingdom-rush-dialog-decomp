"units"
{
	"Sapling"
	{
		"Model" 			"SilveroakSapling"
		"Name" 				"SILVEROAK_SAPLING"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"4"
			"armor_max" 				"2"	
			"armor_regen_per_turn" 		"1"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"0"
			"baseDamage"  				"3"
			"walkSpeed" 				"3"
			"extraBurnDamage"		 	"0"
		}

		"skills"
		{
			"01" "sapling_wild_roots"

			"101" "silveroak_forest_step_trait"
			"102" "sapling_regrowth_trait"
			"103" "silveroak_inflammable_trait"
			"103" "silveroak_treefolk_kill_by_burning_achievement_trait"
  		}

 		"defaultSkill" "sapling_branch_punch"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSilveroakSaplingSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatSapling_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatSapling_death"
			}
		}
	}

	"Trunk"
	{
		"Model" 			"SilveroakTrunk"
		"Name" 				"SILVEROAK_TRUNK"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"10"
			"armor_max" 				"3"	
			"armor_regen_per_turn" 		"1"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"0"
			"baseDamage"  				"4"
			"walkSpeed" 				"2"
			"extraBurnDamage"		 	"0"
			"blockChance"				"0.3"
		}

		"skills"
		{
			"01" "trunk_healing_sap"

			"100" "stoic_stance_trait"
			"103" "silveroak_inflammable_trait"
			"104" "play_sound_on_death_trait"
			"105" "silveroak_treefolk_kill_by_burning_achievement_trait"
  		}

 		"defaultSkill" "ogre_clober"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSilveroakTrunkSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatTrunk_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatTrunk_death"
				"deathSound" "krl_sfx_genericCombat_trunkDeath"
			}
		}
	}

	"Nightshade"
	{
		"Model" 			"SilveroakNightShade"
		"Name" 				"SILVEROAK_NIGHTSHADE"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"8"
			"armor_max" 				"3"	
			"armor_regen_per_turn" 		"0"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"0"
			"baseDamage"  				"3"
			"walkSpeed" 				"3"
			"evasion"					"0.25"
		}

		"skills"
		{
			"01" "nightshade_venomous_embrace"
			
			"100" "silveroak_forest_step_trait"
			
			"102" "silveroak_sylvan_awareness"
  		}

 		"defaultSkill" "nightshade_thorn_pick"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSilveroakNightshadeSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatNightshade_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatNightshade_death"
			}
		}
	}

	"Vinepaw"
	{
		"Model" 			"SilveroakVinepaw"
		"Name" 				"SILVEROAK_VINEPAW"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"5"
			"armor_max" 				"0"	
			"armor_regen_per_turn" 		"0"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"0"
			"baseDamage"  				"2"
			"walkSpeed" 				"3"
			"evasion"					"0.25"
			"antlersDamage"				"1"
		}

		"skills"
		{
			"01" "vinepaw_headbutt"
			
			"100" "vinepaw_antlers_trait"
			"101" "dodge_trait"
			"103" "silveroak_inflammable_trait"
			"104" "walk_to_closest_ranged_ai"
			"105" "silveroak_treefolk_kill_by_burning_achievement_trait"
			"105" "play_sound_on_death_trait"
  		}

 		"defaultSkill" "vinepaw_bite"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSilveroakVinepawSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_faunaHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"deathSound" "krl_sfx_genericCombat_vinepawDeath"
				"walk" "krl_sfx_genericCombat_smallWulfWalk"
			}
		}
	}
}
