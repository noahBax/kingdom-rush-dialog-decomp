


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
 
		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc06"), || "Angry"),
		 cinematicHelper.ShowComment(|| "orc06", || __C(1, "Ukta!"), 1.2),
		 cinematicHelper.Sleep(1.4),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc06")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc05"), || "Angry"),
		 cinematicHelper.ShowComment(|| "orc05", || __C(2, "Milanga!"), 1.6),
		 cinematicHelper.Sleep(1.4),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc06")}, || "Left"),
	     cinematicHelper.Sleep(0.2),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc01")}, || "Left"),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc02")}, || "Left"),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc07")}, || "Left"),	

		 cinematicHelper.Parallel({
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc05")),
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),

		 }),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		 cinematicHelper.ShowComment(|| "HeroUnit", || __C(3, "It's on!"), 1.4),
		 cinematicHelper.Sleep(1.2),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.2),
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
