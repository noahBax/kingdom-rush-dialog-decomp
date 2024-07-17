


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 8),

			
			
			
			
			

			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(1.2),
				
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("goblin07"),"Victory")),
				cinematicHelper.Sleep(0.6),
				
				cinematicHelper.ShowComment(|| "goblin01", || __C(2, "Nilbog?"), 1.4),
			}),

			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(3.6),
				cinematicHelper.MoveCinematicUnit("goblin03", "enemyPos3", true),
				cinematicHelper.ShowComment(|| "goblin02", || __C(3, "Bolgin!"), 1.4),
			

			

				cinematicHelper.Parallel({	
					cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
					cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
					cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
					cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
				}),
			}),
		}),

 		cinematicHelper.Sequence({
		 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("goblin01")}, || "Left"),
			cinematicHelper.ShowComment(|| "goblin01", || __C(4, "HUH?"), 1.0),
		 	cinematicHelper.Sleep(1.2),

		 	cinematicHelper.Parallel({
				cinematicHelper.ShowComment(|| "goblin02", || __C(5, "HUNAMS!"), 1.2),
				cinematicHelper.MoveCinematicUnit("goblin02", "enemyPos2", true),			
				
				cinematicHelper.Sequence({	
					cinematicHelper.Sleep(0.2),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("goblin03")}, || "Left"),
					cinematicHelper.Sleep(0.2),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("goblin06")}, || "Left"),
					cinematicHelper.Sleep(0.2),
					cinematicHelper.ShowComment(|| "goblin07", || __C(6, "DINNER!"), 1.2),
					cinematicHelper.Sleep(0.2),
					
					
					
				}),
			}),
		}),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(7, "Let's get this done!"), 2),
			cinematicHelper.Sleep(1.8),

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
		cinematicHelper.Sleep(1),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

return encounterLogic;
