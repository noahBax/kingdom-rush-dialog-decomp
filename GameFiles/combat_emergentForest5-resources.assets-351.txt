

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		cinematicHelper.Sequence({	
			cinematicHelper.Sleep(1),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Left"),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 2),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Right"),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 1),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.ShowComment(|| "Legend", || __C(1, "It's an ambush!"), 1.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1.8),				
			cinematicHelper.SetCinematicBarsVisibility(false),
		}),

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.8),
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
