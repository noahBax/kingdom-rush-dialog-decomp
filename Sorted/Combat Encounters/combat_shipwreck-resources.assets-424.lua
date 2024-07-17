

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetCurtain(true),

		cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		cinematicHelper.Sleep(0.5),

		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcCinematic01"), || "Speak"),
		cinematicHelper.ShowComment(|| "orcCinematic01", || __C(1, "Let's go!"), 1.2),
		cinematicHelper.Sleep(1.4),
		cinematicHelper.ShowComment(|| "orcCinematic01", || __C(2, "Krum wants supplies."), 1.6),
		cinematicHelper.Sleep(1.4),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcCinematic01")),
		cinematicHelper.Sleep(0.2),
		
		cinematicHelper.Parallel({
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(3, "Stop right there!"), 2),
		cinematicHelper.Sleep(0.8),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orcCinematic01")}, || "Left"),
		cinematicHelper.Sleep(1.6),  
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(4, "You won't leave\nunpunished!"), 2.4),
		cinematicHelper.Sleep(2),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),

		cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.2),

		}),
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
