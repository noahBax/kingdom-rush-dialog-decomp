"units"
{
	"Enchantress"
	{
		"Model" 			"SilveroakEnchantress"
		"Name" 				"SILVEROAK_ENCHANTRESS"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"7"
			"armor_max" 				"0"	
			"armor_regen_per_turn" 		"0"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"3"
			"rangedAttackMinRange"		"0"
			"baseDamage"  				"4"
			"walkSpeed" 				"2"
		}

		"skills"
		{
			"01" "enchantress_spore_shower"
			"02" "enchantress_parasite_blast"

			"100" "silveroak_forest_step_trait"
			"101" "silveroak_sylvan_awareness"
			"102" "get_in_range_ai"
			"103" "walk_to_closest_ranged_ai"
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

	"Warlock"
	{
		"Model" 			"Warlock"
		"Name" 				"SILVEROAK_WARLOCK"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 					"1"	
			"health_max" 				"8"
			"armor_max" 				"2"	
			"armor_regen_per_turn" 		"2"
			"armor_gain_passTurn" 		"0"
			"rangedAttackRange" 		"2"
			"baseDamage"  				"4"
			"walkSpeed" 				"2"
			"evasion"					"0.25"
		}

		"skills"
		{
			"01" "warlock_sunder_armor"
			"02" "warlock_summon_vinepaw"

			"100" "silveroak_forest_step_trait"
			"101" "dodge_trait"
			"102" "silveroak_sylvan_awareness"
  		}

 		"defaultSkill" "warlock_quick_swing"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSilveroakWarlockSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatWarlock_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatWarlock_death"
			}
		}
	}
}
