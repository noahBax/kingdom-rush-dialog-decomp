local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	  
		 

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("Legend","legendPos", true),
				cinematicHelper.Sequence({
					 cinematicHelper.Sleep(2),
					 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 2.4),

				}),

				cinematicHelper.Sequence({	
					cinematicHelper.SetCinematicBarsVisibility(true),
			 		cinematicHelper.SetCurtain(true),
				}),
		}),
 			
 		cinematicHelper.Sequence({	
	 		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("guard")}, || "Left"),
			
			cinematicHelper.MoveCinematicUnit("guard","guardPos", true),
			cinematicHelper.ShowComment(|| "guard", || __C(0, "Where do you\nthink you're\ngoing?!"), 2.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard"),"Speak")),
			cinematicHelper.Sleep(2.8),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 0.8),
			cinematicHelper.ShowComment(|| "Legend", || __C(0, "Far away from\nthis prison!"), 2.4),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(2.8),
			
			
			
			
			
			
			
			
			
			cinematicHelper.ShowNotification("NotificationDungeon1"),
		}),



		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),				
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.RemoveSkill("shield_of_retribution"),
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

encounterLogic.AddCinematic("OnEndTurn",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("ENDTURN-" .. cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber"))),
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 2, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.ShowNotification("NotificationDungeon2"),

		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 3, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.ShowNotification("NotificationDungeon3"),
			

		})),

	}))

return encounterLogic;
