"units"
{
	"HumanGeneral" 
	{
		"Model" "HumanRoyalPaladin"
		"Name" "NPC_GENERAL"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "3"
				
			"health_max" "10"
			"armor_max" "5"
			"rangedAttackRange" "0"
			"baseDamage"  "4"

			"walkSpeed" "3"
		}

		"skills"
		{
			"1" "stunning_blow"
			"2" "heavy_strike"
						
			"10" "counter_stance"
			"11" "oportunity_attack"
			
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

	"HumanSoldier" 
	{
		"Model" "HumanSoldier"
		"Name" "NPC_SOLDIER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "4"
			"armor_max" "3"

			"walkSpeed" "2"
			"rangedAttackRange" "0"
			
			"baseDamage"  "3"

			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "2"
		}

		"skills"
		{
			"1" "stunning_blow"
			"11" "oportunity_attack"
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

	"HumanFarmer" 
	{
		"Model" "HumanFarmer"
		"Name" "NPC_MALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "4"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
			
			"baseDamage"  "2"
		}

		"skills"
		{
 		}

 		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  		}

 		"defaultSkill" "allyNPC_melee_attack"
	}

	"HumanFarmerB" 
	{
		"Model" "HumanFarmerB"
		"Name" "NPC_MALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "4"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"

			
			"baseDamage"  "2"
			"visualMoveSpeed" "1"
			"visualRunSpeed" "1"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"
	}

	"HumanFemaleVillagerA" 
	{
		"Model" "HumanFemaleVillager"
		"Name" "NPC_FEMALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "5"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
	
			
			"baseDamage"  "2"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"

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

	"HumanFemaleVillagerMountainA" 
	{
		"Model" "HumanFemaleVillagerMountainA"
		"Name" "NPC_FEMALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "5"
			"armor_max" "0"

			"walkSpeed" "2"
			"rangedAttackRange" "0"
	
			
			"baseDamage"  "2"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"
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

	"HumanHooligan" 
	{
		"Model" "HumanHooligan"
		"Name" "NPC_HOOLIGAN"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "10"
			"armor_max" "0"
			"rangedAttackRange" "0"
	
			
			"baseDamage"  "4"
		}

		"skills"
		{
			"1" "stunning_blow"
			"2" "heavy_strike"
			"11" "oportunity_attack"
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

	"HumanMaleVillagerA" 
	{
		"Model" "HumanMaleVillagerA"
		"Name" "NPC_MALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "4"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
	
			
			"baseDamage"  "2"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"

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

	"HumanMaleVillagerB" 
	{
		"Model" "HumanMaleVillagerB"
		"Name" "NPC_MALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "5"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
	
			
			"baseDamage"  "2"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"

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

	"HumanMaleVillagerMountainA" 
	{
		"Model" "HumanMaleVillagerMountainA"
		"Name" "NPC_MALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "5"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
	
			
			"baseDamage"  "2"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"

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

	"HumanMaleVillagerMountainB" 
	{
		"Model" "HumanMaleVillagerMountainB"
		"Name" "NPC_MALE_VILLAGER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "5"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
	
			
			"baseDamage"  "2"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "allyNPC_melee_attack"

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

	

	"GnomeSaleMan" 
	{
		"Model" "GnomeSaleMan"
		"Name" "NPC_GNOME_SALESMAN"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "3"
			"armor_max" "0"
			"rangedAttackRange" "0"

			"walkSpeed" "2"
	
			
			"baseDamage"  "3"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"SpiderCocoons" 
	{
		"Model" "SpiderCocoons"
		"Name" "NPC_COCOON"
		"InheritsFrom" "Hero"

		

		"stats"
		{

			"level" "1"
				
			"health_max" "2"
			"armor_max" "2"
			"rangedAttackRange" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
				
			"baseDamage"  "0"
		
		}

		"skills"
		{

			
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"MountainBarbarian" 
	{
		"Model" "MountainBarbarian"
		"Name" "NPC_BARBARIAN"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
				
			"health_max" "8"
			"armor_max" "0"

			"walkSpeed" "2"
			"rangedAttackRange" "0"
			
			"baseDamage"  "6"

			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
		}

		"skills"
		{
			"1" "berserk_npc_trait" 
			"2" "whirlwind_strike"
			"3" "barbarian_unlock_achievement_trait"
 		}

 		"skillPool"
 		{
 			
 			
 		}
 		
 		"defaultSkill" "cleave"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupBarbarianCommonSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanMaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanMaleDeath"
			}
		}
	}

	"StormcloudSorcerer"
	{
		"Model" "StormcloudSorcerer"
		"Name" "NPC_STORMCLOUD_SORCERER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
			"health_max" "4"
			"armor_max" "0"
			"rangedAttackRange" "4"
			"rangedAttackMinRange" "2"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "3"
			"walkSpeed" "2"
		}

		"skills"
		{
			"1" "stormcloud_sorcerer_rotting_curse"
 		}

 		"defaultSkill" "stormcloud_sorcerer_hex_blast"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSorcerersCommonSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanMaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanMaleDeath"
			}
		}
	}

	"StormcloudHighSorcerer"
	{
		"Model" "StormcloudHighSorcerer"
		"Name" "NPC_STORMCLOUD_HIGH_SORCERER"
		"InheritsFrom" "Base"
		"cinematicTags" "NPC"

		"stats"
		{
			"level" "1"
			"health_max" "5"
			"armor_max" "0"
			"rangedAttackRange" "4"
			"rangedAttackMinRange" "2"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"
			"baseDamage"  "4"
			"walkSpeed" "2"
		}

		"skills"
		{
			"1" "stormcloud_sorcerer_rotting_curse"
			"2" "stormcloud_high_sorcerer_summon_golem"
 		}

 		"defaultSkill" "stormcloud_sorcerer_hex_blast"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupHighSorcererSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_humanMaleHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_humanMaleDeath"
				"walk" ""
			}
		}
	}
}
