


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.6),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Speak"),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(1, "...and we will all\nbecome one with the Glare"), 2.4), 
		 cinematicHelper.Sleep(2.6),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(2, "as the Great Iriza\nforesaw in her dreams."), 2.8),	
		 cinematicHelper.Sleep(2.8),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),


		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),	
		 }),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.6),
		 	cinematicHelper.MoveCinematicUnit("cultist01","cultistPos", true),
		 	cinematicHelper.Sequence({
			 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist02")}, || "Left"),
			 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("abomination02")}, || "Left"),
			 	cinematicHelper.Sleep(0.2),
			 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist03")}, || "Left"),
			 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("abomination01")}, || "Left"),
			 	cinematicHelper.Sleep(0.2),
			 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist04")}, || "Left"),
			 }),
		 }),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Angry"),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(3, "After dealing with\nthese pests, that is."), 2.8),	
		 cinematicHelper.Sleep(2.6),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),


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
