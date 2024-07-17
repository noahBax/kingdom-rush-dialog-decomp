"units"
{
	"ExplosiveBarrel" 
	{
		"Name" "ExplosiveBarrel"
		"InheritsFrom" "Base"
		"Model" "ExplosiveBarrel"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "6"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "explode_on_death_prop"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}

	"PoisonBarrel" 
	{
		"Name" "PoisonBarrel"
		"InheritsFrom" "Base"
		"Model" "PoisonBarrel"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "1"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "poison_on_death_prop"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULLS" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}

	"FireBarrel" 
	{
		"Name" "FireBarrel"
		"InheritsFrom" "Base"
		"Model" "FireBarrel"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "1"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "brazier_explode_on_death"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}

	"SleepingFungus" 
	{
		"Name" "PROP_SLEEPING_FUNGUS"
		"InheritsFrom" "Base"
		"Model" "SleepingFungus"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "0"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "sleeping_fungus_attack"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"

  		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_plantHit"
				"death" "krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"VenomVine" 
	{
		"Name" "PROP_VENOM_VINE"
		"InheritsFrom" "Base"
		"Model" "VenomVine"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "0"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "venom_vine_hit_handler_trait"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "venom_vine_attack"

  		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_plantHit"
				"death" "krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"FireworksCrate" 
	{
		"Name" "FireworksCrate"
		"InheritsFrom" "Base"
		"Model" "FireworksCrate"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "1"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "explode_on_death_fireworks"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"HIDE_DAMAGE" "1"
  			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  			"NO_LIFEBAR" "1"
  			"NO_SKULL" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}

	"Snapvine" 
	{
		"Name" "PROP_SNAPVINE"
		"InheritsFrom" "Base"
		"Model" "Snapvine"

		"stats"
		{
			"health_max" "1"
			"baseDamage" "2"
			"rangedAttackRange" "0"
		}

		"skills"
		{ 
 			"0" "disable_default_walk_ai"

 			"10" "snapvine_hit_handler_trait"
  		}

  		"states"
		{
			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
 		}

  		"defaultSkill" "snapvine_attack"

  		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_plantHit"
				"death" "krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"Brazier" 
	{
		"Name" "PROP_BRAZIER"
		"InheritsFrom" "Base"
		"Model" "Brazier"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "1"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "brazier_explode_on_death"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "0"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"

  		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_plantHit"
				"death" "krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"LavaGeyser" 
	{
		"Name" 			"PROP_LAVA_GEYSER"
		"InheritsFrom" 	"Base"
		"Model" 		"LavaGeyser"

		"stats"
		{
			"health_max" 		"1000000"
			"baseDamage" 		"2"
			"explodeRadius" 	"1"
			"disabledTurns"		"2"
		}

		"skills"
		{ 
 			"0" "lava_geyser_attack_every_other_turn_trait"
 			"100" "disable_default_walk_ai"
  		}

  		"states"
  		{
  			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"
			"FIXED_POSITION" "1"
			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  			"NON_TARGETABLE" "1"
  		}

  		"defaultSkill" "lava_geyser_attack"

  		"soundConfig"
		{
			"assetId" 					"DynamicSoundGroupLavaGeyserSounds"
			"sounds"
			{
				"receiveDamage" 		"krl_sfx_combatGeneric_plantHit"
				"death" 				"krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"WildTentacle" 
	{
		"Name" "PROP_WILD_TENTACLE"
		"InheritsFrom" "Base"
		"Model" "WildTentacle"

		"stats"
		{
			"health_max" "1"
			"baseDamage" "4"
			"rangedAttackRange" "0"
		}

		"skills"
		{ 
 			"0" "disable_default_walk_ai"

 			"10" "wild_tentacle_hit_handler_trait"
  		}

  		"states"
		{
			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
 		}

  		"defaultSkill" "wild_tentacle_attack"

  		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_genericCombat_tentacleDeath"
				"death" "krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"SulfuricBlast" 
	{
		"Name" "PROP_SULFURIC_BLAST"
		"InheritsFrom" "Base"
		"Model" "SulfuricBlast"

		"stats"
		{
			"health_max" "100000"
			"skipsInitiative" "1"
			"initiative" "-99"
			"explodeRadius" "1"
			"explodeDamage" "0"
			"baseDamage" "0"

			"beHitChanceModifier" "0.3"
		}

		"skills"
		{ 
 			"0" "sulfuric_blast_attack"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
  		}

  		"defaultSkill" "common_melee_attack"

  		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_plantHit"
				"death" "krl_sfx_combatGeneric_plantHit"
			}
		}
	}

	"Healstalk" 
	{
		"Model" 						"Healstalk"
		"Name" 							"PROP_HEALSTALK"
		"InheritsFrom" 					"Base"

		"stats"
		{
			"health_max" 				"100000"
			"rangedAttackRange" 		"1"
			"baseDamage" 				"1"
			"skipsInitiative" 			"1"
		}

		"skills"
		{
			"100" 						"healstalk_healing_bloom_trait"
			"200" 						"healstalk_healing_aura_trait"
		}

		"defaultSkill" 					"common_melee_attack"

		"states"
  		{
  			"FIXED_POSITION" "1"
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"
			"PROP" "1"
			"NO_DEATH" "1"
  		}
	}

	"PokeOak" 
	{
		"Name" 				"PROP_POKEOAK"
		"InheritsFrom" 		"Base"
		"Model" 			"Pokeoak"

		"stats"
		{
			"health_max" 		"100000"
			"baseDamage" 		"4"
		}

		"skills"
		{ 
 			"0" "disable_default_walk_ai"

 			"10" "oportunity_attack"
 			"100" "silveroak_oak_multiple_hit_win_achievement_trait"
  		}

  		"defaultSkill" "pokeoak_poke"

  		"states"
		{
			"HIDE_DAMAGE" "1"
  			"NO_LIFEBAR" "1"
  			"NON_TARGETABLE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"
			"NO_CHECK_END_FIGHT" "1"
  			"PROP" "1"
 		}
	}

	"BreakableWallBase" 
	{
		"Name" "BreakableWall"
		"InheritsFrom" "Base"
		"Model" "BreakableWall"

		"stats"
		{
			"health_max" "2"
			"walkSpeed" "0"
		}

		"skills"
		{

  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"FORCE_SHOW_LIFEBAR" "1"
  			"NO_SKULL" "1"
  			"PROP" "1"
  			"FIXED_POSITION" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  		}

  		"defaultSkill" "no_attack_ability"

  		"soundConfig"
		{
			"assetId" "DynamicSoundGroupBreakableWallSounds"
			"sounds"
			{
				"death" "krl_sfx_arenaCombat_breakableWallBreak"
			}
		}
	}

	"BreakableWall01" 
	{
		"InheritsFrom" "BreakableWallBase"
		"Model" "BreakableWall01"
	}

	"BreakableWall02" 
	{
		"InheritsFrom" "BreakableWallBase"
		"Model" "BreakableWall02"
	}

	"BreakableWall03" 
	{
		"InheritsFrom" "BreakableWallBase"
		"Model" "BreakableWall03"
	}

	"SpinningQuintain" 
	{
		"Name" "SpinningQuintain"
		"InheritsFrom" "Base"
		"Model" "SpinningQuintain"

		"stats"
		{
			"health_max" "2"
			"walkSpeed" "0"
		}

		"skills"
		{
			"1" "spinning_quintain_trait"
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NO_SKULL" "1"
  			"PROP" "1"
  			"FIXED_POSITION" "1"
  			"NO_FLIP_ON_HIT" "1"
  			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
  		}

  		"defaultSkill" "no_attack_ability"

  		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSpinningQuintainSounds"
			"sounds"
			{
			}
		}
	}

	"SpikeSpinner" 
	{
		"Name" "PROP_SPIKE_SPINNER"
		"InheritsFrom" "Base"
		"Model" "SpikeSpinner"

		"stats"
		{
			"health_max" "0"
			"baseDamage" "4"
			"rangedAttackRange" "1"
			"walkSpeed" "0"
		}

		"skills"
		{ 
 			
  		}

  		"states"
		{
			"NON_TARGETABLE" "1"
			"HIDE_DAMAGE" "1"
			"CANT_BE_KNOCKED_BACK" "1"
			"CANT_BE_POISONED" "1"
			"CANT_BE_BURNT" "1"
			"CANT_BE_BLED" "1"
			"CANT_BE_STUNNED" "1"
			"CANT_BE_ROOTED" "1"
			"CANT_BE_ASLEPT" "1"
			"CANT_BE_FROZEN" "1"
			"NO_SKULL" "1"

			"FIXED_POSITION" "1"

			"NO_CHECK_END_FIGHT" "1"
  			"NO_LIFEBAR" "1"
  			"PROP" "1"
 		}

  		"defaultSkill" "spike_spinner_attack"

  		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSpikeSpinnerSounds"
			"sounds"
			{
			}
		}
	}
}
