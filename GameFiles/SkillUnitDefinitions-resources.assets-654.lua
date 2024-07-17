"units"
{
	"WulfEnt" 
	{
		"Model" "WulfEnt"
		"Name" "SUMMONED_VERDANT_DEFENDER"
		"InheritsFrom" "Base"

		"stats"
		{
			"level" "1" 

			"health_max" "3"
			"evasion" "0.3" 

			
			"visualMoveSpeed" "3" 
			"visualRunSpeed" "3"
			"rangedAttackRange" "0"

			"baseDamage"  "3"
			
			"walkSpeed" "4"
		}

		"skills"
		{
			"10" "counter_stance"
			"11" "dodge_trait"
 		}

 		"defaultSkill" "common_bite_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupWulfSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_faunaHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_faunaDeath"
				"walk" "krl_sfx_genericCombat_smallWulfWalk"
			}
		}
	}

	"DemonicDuplicate" 
	{
		"Model" 						"DemonOlochDuplicate"
		"Name" 							"SUMMONED_DEMONIC_DUPLICATE"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"1"
			"visualMoveSpeed" 			"1.3"
			"visualRunSpeed" 			"1.3"
			"rangedAttackRange" 		"4"
			"rangedAttackMinRange" 		"2"
			"baseDamage"  				"6"
			"walkSpeed" 				"2"
		}

		"skills"
		{
			"10" 						"infernal_combustion_trait"
			"100" "wasteland_forged_by_fire_trait"
		}

 		"defaultSkill" 					"abyssal_blast"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" 		"krl_va_combatOloch_hit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_sfx_combatGeneric_fumesExplosion"
			}
		}
	}

	"OlochImp" 
	{
		"Model" 						"DemonOlochImp"
		"Name" 							"SUMMONED_OLOCH_IMP"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"5"
			"visualMoveSpeed" 			"1.3"
			"visualRunSpeed" 			"1.3"
			"rangedAttackRange" 		"3"
			"rangedAttackMinRange" 		"2"
			"baseDamage"  				"6"
			"walkSpeed" 				"2"
		}

		"skills"
		{
			"10" 						"infernal_combustion_trait"
			"100" "wasteland_forged_by_fire_trait"
		}

 		"defaultSkill" 					"common_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupDemonSpawnSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatDemonSpawn_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatDemonSpawn_death"
			}
		}
	}

	"BombardierRobombs" 
	{
		"Model" 						"Robomb"
		"Name" 							"SUMMONED_BOMBARDIER_ROBOMBS"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"100000"
			"visualMoveSpeed" 			"1"
			"visualRunSpeed" 			"1"
			"baseDamage"  				"6"
			"explodeRadius" 			"1"
			"explodeDamage" 			"6"
			"walkSpeed" 				"4"
		}

		"skills"
		{ 
 			"0"							"bombardier_robombs_explode_on_target_ai"
 			"1" 						"explode_on_death_prop"
  		}

  		"states"
  		{
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  		}

 		"defaultSkill" 					"bombardier_robombs_walk_to_target_ai"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" 		"krl_sfx_combatGeneric_mediumHumanoidHit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_sfx_combatGeneric_fumesExplosion"
			}
		}
	}

	"BruxaVoodooDoll" 
	{
		"Model" 						"BruxaDoll"
		"Name" 							"SUMMONED_VOODOO_DOLL"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"100000"
		}

		"skills"
		{ 
  		}

  		"states"
  		{
  			"ROOTED" "1"
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NO_LIFEBAR" "1"
  			"FIXED_POSITION" "1"
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
			"NO_SKULL" "1"
  		}

 		"defaultSkill" 					"common_melee_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" 		"krl_sfx_combatBruxa_voodooDollHit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_sfx_combatBruxa_voodooDollSpellRelease"
			}
		}
	}

	"ArcaneSentry" 
	{
		"Model" "Sentry"
		"Name" "SUMMONED_ARCANE_SENTRY"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"

			"health_max" "2"
			"evasion" "0.5" 

			

			"rangedAttackRange" "4"
			
			"baseDamage" "4"

			"walkSpeed" "2"
		}

		"skills"
		{
			"10" "dodge_trait"
 		}

 		"defaultSkill" "sentry_ranged_spell_attack"
	}

	
	"Golem" 
	{
		"Model" "Golem"
		"Name" "SUMMONED_GOLEM"
		"InheritsFrom" "Base"

		"stats"
		{
			"level" "1"
				
			"health_max" "4"
			"armor_max" "8"
			"armor_regen_per_turn" "2"

			"armor_gain_passTurn" "2"
			"rangedAttackRange" "0"

			"visualMoveSpeed" "1" 
			"visualRunSpeed" "1"
			
			"baseDamage"  "3"

			"walkSpeed" "1"
			
		}


		"skills"
		{
			"1" "stunning_blow"
			"2" "solidify"
			"300" 	"custom_step_sound_trait"
 		}


 		"defaultSkill" "common_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupGolemSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatGolem_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_hitOnRock"
				"death" "krl_va_combatGolem_death"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}

	"BadaboomBomb" 
	{
		"Name" "SUMMONED_BADABOOM_BOMB"
		"InheritsFrom" "Base"
		"Model" "BombardierBadaboomBomb"

		"stats"
		{
			"health_max" "100000"
			"initiative" "-99"
			"explodeRadius" "1"
			"baseDamage" "0"
		}

		"skills"
		{ 
 			"0" "explode_on_death_badaboom"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}

	"BombardierMine" 
	{
		"Name" "SUMMONED_MINE"
		"InheritsFrom" "Base"
		"Model" "BombardierMine"

		"stats"
		{
			"health_max" "100000"
			"initiative" "-99"
			"baseDamage" "0"
		}

		"skills"
		{ 
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}

	"HealingTotem" 
	{
		"Model" 						"HealingTotem"
		"Name" 							"SUMMONED_HEALING_TOTEM"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"1"
		}

		"skills"
		{
		}

		"states"
  		{
  			"FIXED_POSITION" "0"
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NO_LIFEBAR" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"CANT_BE_KNOCKED_BACK" "0"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"
  		}

 		"defaultSkill" 					"common_melee_attack"
	}

	"TeslaCoil" 
	{
		"Model" 						"TeslaCoil"
		"Name" 							"SUMMONED_TESLA_COIL"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"2"
			"rangedAttackRange" 		"4"
		}

		"skills"
		{
		}

		"states"
  		{
  			"ROOTED" "1"
  			"FIXED_POSITION" "1"
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
			"NO_SKULL" "1"
  		}

 		"defaultSkill" 					"tesla_coil_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupTeslaCoilSounds"
			"sounds"
			{
				"death" "krl_sfx_teslaCombat_coilDeath"
			}
		}
 	}

 	"TeslaMagneticTrap" 
	{
		"Model" 						"TeslaMagneticTrap"
		"InheritsFrom" 					"Base"

		"stats"
		{
		}

		"skills"
		{
		}

		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NO_FLIP_ON_SKILL" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"FIXED_POSITION" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  		}

 		"defaultSkill" 					"tesla_coil_attack"
 	}
}
