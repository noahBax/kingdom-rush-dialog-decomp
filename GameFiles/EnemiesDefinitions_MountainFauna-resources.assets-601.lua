"units"
{
	"WinterWulf" 
	{
		"Model" "MountainWulf"
		"Name" "FAUNA_WINTER_WULF"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				

			"health_max" "6" 
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"evasion" "0.3"  

			"visualMoveSpeed" "2.25" 
			"visualRunSpeed" "2.25"
			"rangedAttackRange" "0"

			"baseDamage"  "3"

			"walkSpeed" "3"

			"initiativeModifier" "-4"

		}


		"skills"
		{
			"1" "winter_wulf_frost_howl"
			"10" "dodge_trait"
			"20" "winter_wulf_ai"
 		}


 		"defaultSkill" "winter_wulf_bite"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupWinterWulfSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_faunaHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_faunaDeath"
				"walk" "krl_sfx_genericCombat_smallWulfWalk"
			}
		}
	}

	"SpiderMatriarch"
	{ 
		"Model" "SpiderMatriarch"
		"Name" "MOUNTAIN_FAUNA_SPIDER_MATRIARCH"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "12"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"walkSpeed" "2"

			"visualMoveSpeed" "3" 
			"visualRunSpeed" "2"

			"rangedAttackRange" "2" 
			"baseDamage"  "3"


			"initiativeModifier" "2"

		}

		"skills"
		{
			"1" "spider_matriarch_motherlode"
			"12" "spawn_acid_on_death_trait"
			"100" "mountain_warm_blooded_trait"
  		}

 		"defaultSkill" "spider_matriarch_venomous_bite"

 		"states"
  		{
			"CANT_BE_FROZEN" "1"
			"WONT_TRIGGER_ACID_FLOOR" 	"1"
  		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupMatriarchSounds"
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_spiderHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_spiderDeath"
				"walk" "krl_sfx_genericCombat_bigSpiderWalk"
			}
		}
	}

	"Yeti"
	{ 
		"Model" "Yeti"
		"Name" "MOUNTAIN_FAUNA_YETI"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "15"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"

			"walkSpeed" "2"

			"visualMoveSpeed" "3" 
			"visualRunSpeed" "1"

			"rangedAttackRange" "3" 
			"baseDamage"  "4"


			"initiativeModifier" "2"

		}

		"skills"
		{
			"1" "yeti_snowball_throw"
			"100" "mountain_warm_blooded_trait"
			"100" "stoic_stance_trait"
			"200" "custom_step_sound_trait"
 		}

 		"defaultSkill" "yeti_smash"

 		"states"
  		{
			"CANT_BE_FROZEN" "1"
			"CANT_BE_KNOCKED_BACK" "1"
  		}

 		"soundConfig"
		{
			"assetId" 		"DynamicSoundGroupSasquatchSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatYeti_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatYeti_death"
				"walk" ""
				"step" "krl_sfx_combatGeneric_heavyFootsteps"
			}
		}
	}
}
