"units"
{


	"SkeletonWarrior01" 
	{
		"Model" "SkeletonWarrior01"
		"Name" "UNDEAD_SKELETON_WARRIOR"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "5"
			"armor_max" "0"		
			
			"baseDamage"  "3"

			"walkSpeed" "3"
			"rangedAttackRange" "0"

			"reassemble_health" "3"
		}

		"skills"
		{
			
			"100" "skeleton_re_assemble_trait"
			"100" "skeleton_bloodless_trait"
 		}

 		"defaultSkill" "common_melee_attack"

 		"states"
 		{
 			"CANT_BE_POISONED" "1"
            "CANT_BE_BLED" "1"
 		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSkeletonSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatSkeletonWarrior_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatSkeletonWarrior_death"
			}
		}
	}

	"SkeletonSummon" 
	{
		"Model" "SkeletonWarrior01"
		"Name" "SUMMONED_SKELETON"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "2"
			"armor_max" "0"		
			
			
			"baseDamage"  "3"

			"walkSpeed" "2"
			"initiativeModifier" "100"
			"rangedAttackRange" "0"


		}

		"skills"
		{
			
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"SkeletonChampion01" 
	{
		"Model" "SkeletonChampion01"
		"Name" "UNDEAD_SKELETON_CHAMPION"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "5"
			"armor_max" "3"		
			
			"baseDamage"  "4"

			"armor_regen_per_turn" "1"
			"rangedAttackRange" "0"

			"walkSpeed" "2"

			"reassemble_health" "3"

		}


		"skills"
		{
			"1" "skeleton_knight_shield_bash"
			"100" "skeleton_re_assemble_trait"
			"100" "skeleton_bloodless_trait"
 		}

 		"defaultSkill" "common_melee_attack"

 		"states"
 		{
 			"CANT_BE_POISONED" "1"
            "CANT_BE_BLED" "1"
 		}

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupSkeletonSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatSkeletonChampion_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatSkeletonChampion_death"
			}
		}
	}

	"GoblinTadpole" 
	{
		"Model" "GoblinTadpole"
		"Name" "UNIT_GOBLIN_TADPOLE_NAME"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "13"
			"armor_max" "3"		
			
			
			"baseDamage"  "4"
			"rangedAttackRange" "0"
		}

		"skills"
		{
			
 		}

 		"defaultSkill" "common_melee_attack"
	}

	"ZombieFarmer" 
	{
		"Model" "ZombieFarmer"
		"Name" "UNDEAD_ZOMBIE_FARMER"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "4"
			"armor_max" "1"	
			"armor_regen_per_turn" "0"
			"rangedAttackRange" "0"

			"baseDamage"  "2"
			
			"walkSpeed" "1"

			"initiativeModifier" "2"

			"visualMoveSpeed" "1.2"
			"visualRunSpeed" "1.2"

		}


		"skills"
		{
			
			
 		}

 		"defaultSkill" "lifesteal_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupZombiesSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatZombieFarmer_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatZombieFarmer_death"
			}
		}
	}
	

	"ZombieWarrior" 
	{
		"Model" "ZombieWarrior"
		"Name" "UNDEAD_ZOMBIE_WARRIOR"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "5"
			"armor_max" "2"	
			"armor_regen_per_turn" "0"
			

			"baseDamage"  "3"
			
			"walkSpeed" "1"
			"rangedAttackRange" "0"

			"initiativeModifier" "2"

			"visualMoveSpeed" "1.2"
			"visualRunSpeed" "1.2"

		}


		"skills"
		{
			
			
 		}

 		"defaultSkill" "lifesteal_melee_attack"

 		"soundConfig"
		{
			"assetId" "DynamicSoundGroupZombiesSounds"
			"sounds"
			{
				"receiveDamage" "krl_va_combatZombieWarrior_hit"
				"receiveArmorDamage" "krl_sfx_combatGeneric_armorHit"
				"death" "krl_va_combatZombieWarrior_death"
			}
		}
	}

	"Necromancer" 
	{
		"Model" "Necromancer"
		"Name" "UNDEAD_NECROMANCER"
		"InheritsFrom" "Base"

		"stats"
		{

			"level" "1"
				
			"health_max" "5"
			"armor_max" "1"	
			"armor_regen_per_turn" "0"
			"rangedAttackRange" "0"
			

			"baseDamage"  "3"
			
			"walkSpeed" "1"

			"initiativeModifier" "2"

			"visualMoveSpeed" "1.2"
			"visualRunSpeed" "1.2"

		}


		"skills"
		{
			
			
 		}

 		"defaultSkill" "lifesteal_melee_attack"
	}
	
	
	
	
	
	
















 

 
	
}
