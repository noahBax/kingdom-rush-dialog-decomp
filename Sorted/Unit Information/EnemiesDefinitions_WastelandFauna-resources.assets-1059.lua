"units"
{
	"MagmaElemental"
	{ 
		"Model" "MagmaElemental"
		"Name" "MOUNTAIN_FAUNA_MAGMAELEMENTAL"
		"InheritsFrom" "Base"

		"stats"
		{
			"level" "1"
			"health_max" "12"
			"armor_max" "6"
			"armor_regen_per_turn" "3"
			"armor_gain_passTurn" "0"
			"walkSpeed" "2"
			"visualMoveSpeed" "1" 
			"visualRunSpeed" "2"
			"rangedAttackRange" "0" 
			"baseDamage"  "5"
			"initiativeModifier" "2"
		}

		"skills"
		{
			"1" 	"magma_elemental_eruption"
			"100" 	"wasteland_forged_by_fire_trait"
			"200" 	"stoic_stance_trait"
			"300" 	"custom_step_sound_trait"
  		}

 		"defaultSkill" "magma_elemental_magma_crush"

 		"states"
  		{
			"CANT_BE_BURNT" "1"
			"CANT_BE_KNOCKED_BACK" "1"
  		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupMagmaElementalSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatGolem_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_hitOnRock"
				"death" "krl_va_combatGolem_death"
				"walk" ""
				"step" "krl_sfx_genericCombat_magmaElementalWalk"
			}
		}
	}
}
