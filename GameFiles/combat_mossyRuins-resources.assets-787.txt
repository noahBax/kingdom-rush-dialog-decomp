


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.ShowComment(|| "enemy01", || __C(1, "Tell me, trespasser..."), 2), 
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		 cinematicHelper.Sleep(2.2),

		 cinematicHelper.ShowComment(|| "enemy01", || __C(2, "Have you seen..."), 1.6), 
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		 cinematicHelper.Sleep(1.8),

		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("enemy01")}, || "Left"),
		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.ShowComment(|| "enemy01", || __C(3, "...the writings on the wall?"), 2), 
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		 cinematicHelper.Sleep(1.8),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.8),
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
		 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
		 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
		 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		cinematicHelper.ShowComment(|| "Legend", || __C(4, "Can't say I'm interested."), 2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2.2),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 1.8),

		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("enemy01","enemyPos01", true),
			cinematicHelper.ShowComment(|| "enemy02", || __C(5, "What we are trying to achieve..."), 2.4), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy02"),"Speak")),
		}),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.ShowComment(|| "enemy02", || __C(6, "...you cannot even fathom!"), 1.6), 
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy02"),"Speak")),
		 cinematicHelper.Sleep(2),

 		 cinematicHelper.ShowComment(|| "enemy01", || __C(7, "Let's get them."), 1.6), 
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy02"),"Speak")),
		 cinematicHelper.Sleep(1.4),

		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),

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
