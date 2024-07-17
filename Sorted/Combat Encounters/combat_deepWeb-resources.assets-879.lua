


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),

		cinematicHelper.ShowComment(|| "hero02", || __C(1, "Another cave\nfilled with spiders,\nhuh?"), 2.4), 
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02"), || "Speak"),
		cinematicHelper.Sleep(2.6),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02")),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("legend")}, || "Left"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Left"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Left"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero03")}, || "Left"),
			cinematicHelper.Sleep(0.05),
		}),

		cinematicHelper.Sleep(0.8),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1.8),

			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("legend")}, || "Right"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Left"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Left"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero03")}, || "Right"),
			cinematicHelper.Sleep(0.05),
		}),

		cinematicHelper.ShowComment(|| "Legend", || __C(2, "Looks like it."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(1.4),

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
