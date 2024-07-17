


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("legend")}, || "Right"),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero03")}, || "Right"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Right"),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Right"),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 	cinematicHelper.ShowComment(|| "Legend", || __C(1, "Be careful, everyone."), 1.6), 
		 }),

		 cinematicHelper.Sleep(1.2),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(2, "Or we may end up\nlike them."), 2.2), 
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
