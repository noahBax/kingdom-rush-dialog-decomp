

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
						cinematicHelper.Sleep(2),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("gob1"), || "Angry"),
						cinematicHelper.ShowComment(|| "gob1", || __C(1, "Nya-hahaha!"), 1),
						cinematicHelper.Sleep(1),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("gob1")),
						cinematicHelper.Parallel({
							cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 3.5),
							cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("gob3"), || "Angry"),
							cinematicHelper.ShowComment(|| "gob3", || __C(2, "Nya-hahaha!"), 3),
							cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("gob4"), || "Angry"),
							cinematicHelper.ShowComment(|| "gob4", || __C(3, "Nya-hahaha!"), 3),
							
						}),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("gob3")),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("gob4")),
						cinematicHelper.Parallel({
							cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
														 	 || {cinematicHelper.FindCinematicPos("heroPos1"), 
														 	     cinematicHelper.FindCinematicPos("heroPos2"), 
														 	     cinematicHelper.FindCinematicPos("heroPos3"), 
														 	     cinematicHelper.FindCinematicPos("heroPos4")},
														 	 || true),
							cinematicHelper.ShowComment(|| "Legend", || __C(4, "There's still time!\nLet's do this!"), 2.5),
							cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 3),
						}),
						
						cinematicHelper.SetCinematicBarsVisibility(false),
					}),
		}),

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.5),
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
