


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	    
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),

		cinematicHelper.Sleep(0.6),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.6),
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),

			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.8),	
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc05")}, || "Left"),
				cinematicHelper.Sleep(0.4),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc05"), || "Angry"),
				cinematicHelper.ShowComment(|| "orc05", || __C(1, "Chi'vi toh!"), 1.4),
			}),
		}),

		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc05")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.Sleep(0.4),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(2, "Party is over,\ngreen beans!"), 1.8),
		cinematicHelper.Sleep(1.6),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Angry"),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.8),
		}),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Victory"),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))


return encounterLogic;
