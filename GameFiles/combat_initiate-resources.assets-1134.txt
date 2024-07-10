

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({


	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("CameraPos1")),
		 
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
						
						
						cinematicHelper.Sequence({	
							cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
														 	 || {cinematicHelper.FindCinematicPos("heroPos1"), 
														 	     cinematicHelper.FindCinematicPos("heroPos2"), 
														 	     cinematicHelper.FindCinematicPos("heroPos3"), 
														 	     cinematicHelper.FindCinematicPos("heroPos4")},
														 	 || true),
						}),
						
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 1),
						cinematicHelper.Sequence({	
							cinematicHelper.Sleep(0.3),
							cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
							cinematicHelper.ShowComment(|| "cultist1", || __C(1, "Yes!"), 1),
							cinematicHelper.Sleep(1.2),
							cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
							cinematicHelper.ShowComment(|| "cultist1", || __C(2, "Vengeance\nshall be\nmine!"), 2),
							cinematicHelper.Sleep(2.2),
						}),
						cinematicHelper.SetCinematicBarsVisibility(false),
					}),
		}),

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.1),
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
