


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("cameraPos01")),
		 
		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.ShowComment(|| "Legend", || __C(1, "Let's stop these pillagers!"), 2),
				cinematicHelper.Sleep(2),

				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcCinematic01"), || "Angry"),
				cinematicHelper.ShowComment(|| "orcCinematic01", || __C(2, "Gwar'thum!"), 1.2),
				cinematicHelper.Sleep(1),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcCinematic01")),
				cinematicHelper.Sleep(0.2),

				
				
				
				
		}),
 		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),

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
