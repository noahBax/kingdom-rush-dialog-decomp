local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({

			cinematicHelper.Sequence({	
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02"), || "Fear"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Fear"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant04"), || "Fear"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant05"), || "Fear"),
						cinematicHelper.Sleep(1),
						}),
						
						cinematicHelper.SetCinematicBarsVisibility(false),
						
						
		}),
				
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.5),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant04")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant05")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Victory"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02"), || "Victory"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Victory"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant04"), || "Victory"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant05"), || "Victory"),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

return encounterLogic;
