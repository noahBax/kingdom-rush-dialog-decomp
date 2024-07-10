local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
	    cinematicHelper.Sequence({	
					cinematicHelper.MoveCinematicUnit("villager1", "introEnemyPos1", true),
			}),		
		cinematicHelper.SetCurtain(true),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		
		 
		 	
		cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

return encounterLogic;
