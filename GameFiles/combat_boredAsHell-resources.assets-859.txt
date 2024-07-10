


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Sequence({

		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("demon02"), || "Speak"),
			cinematicHelper.ShowComment(|| "demon02", || __C(1, "Gee..."), 1.2), 
			cinematicHelper.Sleep(1.4),
			cinematicHelper.ShowComment(|| "demon02", || __C(2, "It sure gets boring\naround here!"), 2.8), 
			cinematicHelper.Sleep(2.7),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("demon02")),
			cinematicHelper.Sleep(0.2),

		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("demon01"), || "Speak"),
			cinematicHelper.ShowComment(|| "demon01", || __C(3, "C'mon, big guy...."), 1.4), 
			cinematicHelper.Sleep(1.6),
			cinematicHelper.ShowComment(|| "demon01", || __C(4, "Do something fun!"), 1.6), 
			cinematicHelper.Sleep(1.5),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("demon01")),
			cinematicHelper.Sleep(1),
			
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon02"),"Speak")),
			cinematicHelper.ShowComment(|| "demon02", || __C(5, "Gah, he's\na tough one."), 2), 
			cinematicHelper.Sleep(2),
		 }),

		 cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("demon02")}, || "Left"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("demon01")}, || "Left"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon02"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon02", || __C(6, "Yes! Let's have\nfun with them!"), 2), 
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
