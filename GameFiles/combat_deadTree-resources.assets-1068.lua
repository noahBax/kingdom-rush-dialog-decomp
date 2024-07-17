

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.5),
		 
		 cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "Legend", || __C(1, "Let's get 'em!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(2.3),
		}),
		 cinematicHelper.SetCinematicBarsVisibility(false),
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
