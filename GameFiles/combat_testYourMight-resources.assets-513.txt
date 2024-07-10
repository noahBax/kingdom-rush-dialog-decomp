


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon02"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon02", || __C(1, "I want a fight!"), 1.8), 
		 cinematicHelper.Sleep(2.2),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon01"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon01", || __C(2, "Yeah, the last ones\ndied so quickly!"), 2.6), 
		 cinematicHelper.Sleep(2.6),
		 
		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("demon01")}, || "Left"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon01"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon01", || __C(3, "Now THAT looks\nlike a challenge!"), 2.2), 
		 cinematicHelper.Sleep(2),


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
