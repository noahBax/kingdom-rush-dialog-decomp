

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 2),
		 
		 cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "Legend", || __C(1, "Look! There are some orcs blocking our path!"), 2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(3),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 1.5),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 2),
				cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "We'll take care of them!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
				cinematicHelper.Sleep(1.7),
		}),
		cinematicHelper.Parallel({
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "I'll take this side!"), 1.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		}),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 1),
		}),
		cinematicHelper.Parallel({
			cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
										 	 || {cinematicHelper.FindCinematicPos("pos01"), 
										 	     cinematicHelper.FindCinematicPos("pos02"), 
										 	     cinematicHelper.FindCinematicPos("pos03"), 
										 	     cinematicHelper.FindCinematicPos("pos04")},
										 	 || true),
		}),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos3")}, || 1),
		
		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.8),				
				cinematicHelper.SetCinematicBarsVisibility(false),
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
