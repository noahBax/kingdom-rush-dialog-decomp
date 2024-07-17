


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),

		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
		 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
		 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
		 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		cinematicHelper.ShowComment(|| "hero01", || __C(1, "Once we are done..."), 1.2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		cinematicHelper.Sleep(1.4),
		cinematicHelper.ShowComment(|| "hero01", || __C(2, "...I'll come back to\ncamp on this lake."), 2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		cinematicHelper.Sleep(2.4),
		cinematicHelper.ShowComment(|| "hero02", || __C(3, "Sounds like a good plan!"), 1.8), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "Legend", || __C(4, "Count me in."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(1.4),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.4),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.8),
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
