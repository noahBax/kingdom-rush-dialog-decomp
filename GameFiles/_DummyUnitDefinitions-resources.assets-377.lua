"units"
{
	"IcicleRainDummyUnit" 
	{
		"Name" "DummyUnit"
		"InheritsFrom" "Base"
		"Model" "IcicleRainDummyUnit"

		"stats"
		{
			"health_max" "2"
			"skipsInitiative" "1"
			"initiative" "-99"
		}

		"skills"
		{ 
 			
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_LIFEBAR" "1"
  		}

  		"defaultSkill" "common_melee_attack"


	}

	"DummyUnitThornTrap" 
	{
		"Name" "DummyUnit"
		"InheritsFrom" "Base"
		"Model" "Thornfakingunit"

		"stats"
		{
			"health_max" "2"
			"skipsInitiative" "1"
			"initiative" "-99"
		}

		"skills"
		{ 
 			
  		}

  		"states"
  		{
  			"NOT_IN_INITIATIVE_BAR" "1"
  			"NON_TARGETABLE" "1"
  			"NO_COLLISION" "1"
  			"NO_LIFEBAR" "1"
  		}

  		"defaultSkill" "common_melee_attack"
	}
}
