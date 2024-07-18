local encounterLogic = encounterHelper.CreateEncounterLogic()
encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "CameraDebugMonitor")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
	}))

 encounterLogic.AddCinematic("OnStartMove",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.MoveCinematicUnit("TheHero", "Destination1", true),
		cinematicHelper.Sleep(0.3),
		cinematicHelper.MoveCinematicUnit("TheEnemy", "Destination2", true),
	}))

  encounterLogic.AddCinematic("OnStartMoveParallel",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("TheHero", "Destination1", true),
			cinematicHelper.MoveCinematicUnit("TheEnemy", "Destination2", true),
		})
	}))



encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

return encounterLogic;
