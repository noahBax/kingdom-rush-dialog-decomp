"units"
{


	
	"TutorialGuard" 
	{
		"Model" "BanditRaider"
		"Name" "TUTORIAL_GUARD"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "2"
			"armor_max" "4"	
			"armor_regen_per_turn" "0"
			"rangedAttackRange" "0"
			

			"baseDamage"  "3"
			
			"walkSpeed" "2"

			"initiativeModifier" "2"

		}


		"skills"
		{
 		}

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_mediumHumanoidHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_mediumHumanoidDeath"
			}
		}

 		"defaultSkill" "common_melee_attack"
	}


	"ShadowArcher" 
	{
		"Model" "HumanShadowArcher"
		"Name" "SHADOW_ARCHER"
		"InheritsFrom" "Base"


		"stats"
		{

			"level" "1"
				
			"health_max" "2"
			"armor_max" "0"
			"armor_regen_per_turn" "0"
			"armor_gain_passTurn" "0"


			"baseDamage"  "2"

			"rangedAttackRange" "4"
			"rangedAttackMinRange" "2"
			"evasion" "0.2"
			"walkSpeed" "2"
		}


		"skills"
		{
			"100" "keepDistance_ai"
			"101" "get_in_range_ai"
			"102" "walk_to_closest_ranged_ai"
 		}

 		"defaultSkill" "common_ranged_attack"

 		"soundConfig"
		{
			"sounds"
			{
				"receiveDamage" "krl_sfx_combatGeneric_smallHumanoidHit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_sfx_combatGeneric_smallHumanoidDeath"
			}
		}

	}
}
