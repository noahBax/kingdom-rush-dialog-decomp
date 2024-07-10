local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		
		
		
		
		
		
		
		
		cinematicHelper.Instant(|| print("1")),
		cinematicHelper.Sleep(1),
		cinematicHelper.Instant(|| print("START FIGHT")),
		cinematicHelper.DebugTriggerSkip(),
		cinematicHelper.Sleep(0.3),
		cinematicHelper.StartFight(),

	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))



return encounterLogic;
