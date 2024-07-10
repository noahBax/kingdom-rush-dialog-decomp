


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),

		cinematicHelper.ShowComment(|| "enemy01", || __C(1, "Intruders..."), 1.4), 
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy01"), || "Angry"),
		cinematicHelper.Sleep(1.2),

		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
		 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
		 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
		 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(0.4),
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		 	}),
		 }),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy01")),

		cinematicHelper.ShowComment(|| "hero01", || __C(2, "You've meddled\neven with\nthe spiders?"), 2.6), 
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero01"), || "Speak"),
		cinematicHelper.Sleep(2.0),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero01")),
		cinematicHelper.Sleep(1.2),
		cinematicHelper.ShowComment(|| "hero02", || __C(3, "Like we ever\nliked spiders."), 1.8), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.Sleep(1.6),

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
