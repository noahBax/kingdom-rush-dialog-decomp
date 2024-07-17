

local encounterLogic = encounterHelper.CreateEncounterLogic()
encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.6),

		 cinematicHelper.Parallel({
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 3.6),
			 cinematicHelper.Sequence({
					
					cinematicHelper.Sleep(2.4),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Speak"),
					cinematicHelper.ShowComment(|| "Legend", || __C(1, "Let's put these\ngrounds to use\nonce more."), 3),
					cinematicHelper.Sleep(2.4),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
					
					
			}),
		 }),
		cinematicHelper.Sleep(1.2),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02"), || "Speak"),
		cinematicHelper.ShowComment(|| "hero02", || __C(2, "Oh!\nMy Kingdom for\na horse!"), 3),
		cinematicHelper.Sleep(2.4),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02")),
		cinematicHelper.Sleep(0.6),

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibility(true);
		cinematicHelper.StartFight(),
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
