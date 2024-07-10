


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(0.4),		 
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 3),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc01", "ePos1", true),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01"), || "Angry"),
				cinematicHelper.ShowComment(|| "orc01", || __C(1, "Gral'Kek!"), 2),
				cinematicHelper.Sleep(1.0),
			}),		
			cinematicHelper.MoveCinematicUnit("orc03", "ePos3", true),
			cinematicHelper.MoveCinematicUnit("orc04", "ePos4", true),	
			
			cinematicHelper.Sequence({	
						cinematicHelper.Sleep(1),
						cinematicHelper.ShowComment(|| "Legend", || __C(2, "Get ready, lads!"), 2),
						cinematicHelper.Sleep(2),					
					}),
		}),
		 
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03")),

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
