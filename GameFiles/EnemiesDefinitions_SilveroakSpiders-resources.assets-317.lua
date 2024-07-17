"units"
{
	"Webweaver"
	{ 
		"Model" 			"SilveroakWebweaver"
		"Name" 				"SILVEROAK_SPIDER_WEBWEAVER"
		"InheritsFrom" 		"Base"

		"stats"
		{
			"level" 				"1"
			"health_max" 			"10"
			"armor_max" 			"0"
			"armor_regen_per_turn" 	"0"
			"armor_gain_passTurn" 	"0"
			"walkSpeed" 			"2"
			"visualMoveSpeed" 		"2"
			"visualRunSpeed" 		"2"
			"rangedAttackRange" 	"3"
			"baseDamage"  			"4"
			"initiativeModifier" 	"2"

		}

		"states"
        {
            "WONT_TRIGGER_ACID_FLOOR" 	"1"
        }

		"skills"
		{
			"1"					"webweaver_web_split"

			"100" 				"spawn_acid_on_death_trait"
  		}

 		"defaultSkill" 			"spider_matriarch_venomous_bite"

 		"soundConfig"
		{
			"assetId" 				"DynamicSoundGroupSilveroakWebWeaverSounds"
			"sounds"
			{
				"receiveDamage" 		"krl_sfx_combatGeneric_spiderHit"
				"receiveArmorDamage" 	"krl_sfx_combatGeneric_armorHit"
				"death" 				"krl_sfx_combatGeneric_spiderDeath"
				"walk" 					"krl_sfx_genericCombat_bigSpiderWalk"
			}
		}
	}
}
