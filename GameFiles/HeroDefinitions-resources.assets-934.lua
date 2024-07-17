"units"
{ 
	"Base"
	{

		"stats"
		{
			"actionsAvailableMax" "1"
			"actionPointsMax" "2"
			"meleeRange" "1"	
			"bonusDamageMultiplier" "1.0"
			"bonusDamage" "0" 
			"extraDamage" "0" 

			"evasion" "0" 
			

			"spellpower" "0"
			"skipsInitiative" "0"
			"visualMoveSpeed" "1.58"
			
			"visualRunSpeed" "3"
			
			"armor_max" "0"
			"armor_regen_per_turn" "2"
			"armor_gain_passTurn" "2"


			"rangedAttackRange" "3"

			"attackCostAP" "1" 
			
			"walkSpeed" "3"
			"runSpeed" "0"

			"cooldownOffset" "0"

			"initiativeModifier" "0"
			"initiativeRandomSize" "10" 

			
			
			
			"hitChanceMin" "1" 
			"hitChanceMax" "1" 

			"hitChanceMelee" "1.0" 
			"hitChanceRanged" "1.0"

			"hitChanceRangedEnemyInMeleePenalty" "0.5"
			"hitChanceRangedPerDistancePenaltyFreeDistance" "2"
			"hitChanceRangedPerDistancePenalty" "0.00"  

			
			"beHitChanceModifier" "0"
			"beHitChanceImmobileModifier" "0.0"


			"health_max_available_percent" "1.0"
			"health_max_available_percent_min" "0.5"
			"health_max_available_percent_step" "0.25"

			"health_after_revive" "2"
		    "health_regen_after_fight" "0"

		    "healing_augmentation" "0"

		    "map_stats_max_modification" "3"
		    "stat_def_min__armor_max" "0"
		    "stat_def_min__baseDamage" "1"

		    "stat_def_min__walkSpeed" "1"
		    "stat_def_width__walkSpeed" "2"
		    
		    "stat_def_min__attackDamage" "1"
		    "stat_def_min__health_max" "1"

			"stat_def_width__health_max" "10"


		    "mapDiceExtraRegular" "0"
			"mapDiceExtraSideRegular" "1"
			"mapDiceGloriousDice" "0"
			"mapDiceDoomDice" "0"
		}
	}

	"Hero"
	{
		"InheritsFrom" "Base"
		"UnitOnMap" "Asst_Party_Mage"
	}

	"MissingUnitDefinition"
	{
		"Model" "MissingUnitViewComplex"
		"Name" "MissingUnit"
		"InheritsFrom" "Base"

		"stats"
		{
			"level" "1"	
			"health_max" "9"
		}

		"skills"
		{	
 		}

 		"defaultSkill" "common_melee_attack"
	}
}
