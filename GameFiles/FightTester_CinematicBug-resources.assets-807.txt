local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
		cinematicHelper.Instant(|| print("STARTING CUSTOM"))
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

encounterLogic.AddCinematic("OnEndTurn",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("ENDTURN-" .. cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber"))),
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 2,cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("SpawnPos1")}, || 1),
		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 3,cinematicHelper.Sequence({
			cinematicHelper.Parallel({
				
				cinematicHelper.Instant(|| cinematicHelper.BUGShakeCamera()),
				cinematicHelper.Sequence({
					cinematicHelper.Sleep(0.1),
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("SpawnPos1")}, || 1),
				})
			})
		}))
	}))

return encounterLogic;
