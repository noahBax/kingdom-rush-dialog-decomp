

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 3),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("wolf05", "ePos05", true),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf05"),"Angry")),
				cinematicHelper.Sleep(1.0),
			}),			

			cinematicHelper.MoveCinematicUnit("wolf01", "ePos01", true),
			cinematicHelper.MoveCinematicUnit("wolf02", "ePos02", true),
			cinematicHelper.MoveCinematicUnit("wolf03", "ePos03", true),
			cinematicHelper.MoveCinematicUnit("wolf04", "ePos04", true),
			cinematicHelper.MoveCinematicUnit("wolf06", "ePos06", true),
			cinematicHelper.Sequence({	
						cinematicHelper.Sleep(1),
						cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "To arms!"), 2),
						cinematicHelper.Sleep(2),					
					}),
		}),

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(1.2),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))


return encounterLogic;
