


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 1),
		 cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "orc01", || __C(1, "Look!\nThooz ar tha onez\nwho attacked mah farm!"), 2.8),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01"), || "Angry"),
				cinematicHelper.Sleep(3),
				cinematicHelper.ShowComment(|| "orc01", || __C(2, "Ju'll learn\nnot mess with Krum's\nfarmahs!"), 2.8),
				cinematicHelper.Sleep(3),
				cinematicHelper.ShowComment(|| "orc01", || __C(3, "Get 'em!"), 1.5),
				cinematicHelper.Sleep(1.7),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01")),
				cinematicHelper.Sleep(0.2),
		}),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.5),
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
