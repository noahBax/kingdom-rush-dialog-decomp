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
		cinematicHelper.ConditionalIf(|| true,cinematicHelper.Sequence({
			cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition)
							local unit = cinematicHelper.SpawnCinematicUnitI("CultistAcolyte", spawnPosition)
							cinematicHelper.FromCinematicToUnitI(unit,UnitGroup.BadSide)
						end),
					})
				end),
		}))
	}))

return encounterLogic;
