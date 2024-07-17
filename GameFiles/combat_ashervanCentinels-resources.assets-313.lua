


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		
		cinematicHelper.MoveCinematicUnit("enemy01","enemyPos01", true),

		cinematicHelper.ShowComment(|| "enemy01", || __C(1, "Here come the intruders..."), 2), 
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy01"), || "Angry"),
		cinematicHelper.Sleep(2.2),
		cinematicHelper.ShowComment(|| "enemy01", || __C(2, "that got past our sentinels!"), 2.2), 
		cinematicHelper.Sleep(2.4),

		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
		 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
		 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
		 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy01")),
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		 }),

		cinematicHelper.ShowComment(|| "Legend", || __C(3, "Time to make our stand!"), 1.4), 
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
