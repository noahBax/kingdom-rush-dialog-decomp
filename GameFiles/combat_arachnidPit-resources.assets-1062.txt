

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicForestFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),

		cinematicHelper.Sequence({
			cinematicHelper.ShowComment(|| "hero02", || __C(1, "I've had it with\nthese horrible\nspiders"), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
			cinematicHelper.Sleep(2),
			cinematicHelper.ShowComment(|| "hero02", || __C(2, "in these\nhorrible caves!"), 1.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		}),

		cinematicHelper.Sleep(2),

		cinematicHelper.Sequence({
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "Focus."), 1.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1.6),
			cinematicHelper.ShowComment(|| "Legend", || __C(4, "This won't be easy."), 1.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1.6),
		}),

		cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.2),				
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
