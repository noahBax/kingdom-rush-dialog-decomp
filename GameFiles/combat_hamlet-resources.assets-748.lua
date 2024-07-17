


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager"), || "Fear"),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		  
	 	 cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
	 	 		cinematicHelper.Sequence({
	 	 			cinematicHelper.Sleep(0.8),
	 	 			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
	 	 		}),
			}),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Sequence({
		 		cinematicHelper.ShowComment(|| "hero01", || __C(1, "They're raiding the hamlet!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.Sleep(2.2),
				cinematicHelper.ShowComment(|| "Legend", || __C(2, "To beat\nor\nto beat a lot..."), 2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(2.8),
				cinematicHelper.ShowComment(|| "Legend", || __C(3, "THAT\nis the question!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(2),
		}),
		 cinematicHelper.SetCinematicBarsVisibility(false),
		 cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager"), || "Victory"),
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
