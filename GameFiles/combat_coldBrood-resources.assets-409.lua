


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("spider01","spiderPos01", true),
			cinematicHelper.MoveCinematicUnit("spider02","spiderPos02", true),

			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.8),
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1.6),
			}),
		 }),

		 cinematicHelper.Sequence({
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Angry"),
		 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Left"),
		 	cinematicHelper.Sleep(0.2),
			
			cinematicHelper.ShowComment(|| "Legend", || __C(1, "You said this was\na safe shortcut!"), 2.6), 
			
			cinematicHelper.Sleep(2),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02"), || "Crippled"),
			cinematicHelper.Sleep(1),
			cinematicHelper.ShowComment(|| "hero02", || __C(2, "S-sorry..."), 1.2), 
			cinematicHelper.Sleep(1), 
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Right"),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02")),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),

		 }),

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
