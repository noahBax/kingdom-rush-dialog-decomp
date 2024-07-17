local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	  
		 

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({
		 	cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("Legend","legendPos", true),
			}),
			
			cinematicHelper.Sequence({	
				cinematicHelper.SetCinematicBarsVisibility(true),
		 		cinematicHelper.SetCurtain(true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(2),	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 2.5),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero1","heroPos1", true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero2","heroPos2", true),
			}),

	 	}),

		 cinematicHelper.Sequence({	
	 		
			cinematicHelper.Sleep(0.5),
			cinematicHelper.ShowComment(|| "guard", || __C(0, "Can't hide.\nCan't run either..."), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard"),"Speak")),
			cinematicHelper.Sleep(2.3),
			cinematicHelper.ShowComment(|| "Legend", || __C(0, "More armored guards!\n"), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(2.5),
			cinematicHelper.ShowComment(|| "Wizard", || __C(0, "My magic\nwill blast through\ntheir armor!"), 3),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Wizard"),"Speak")),
			cinematicHelper.Sleep(3.5),
			cinematicHelper.ShowComment(|| "Ranger", || __C(0, "Poison\nwill also do\nthe trick!"), 2.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Ranger"),"Speak")),
			cinematicHelper.Sleep(2.8),
			cinematicHelper.ShowComment(|| "Legend", || __C(0, "Ok!\nStay close!"), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(2.3),
			cinematicHelper.ShowComment(|| "Legend", || __C(0, "My holy aura\nwill protect you!"), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1),
		}),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero1","heroPos3", true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero2","heroPos4", true),
			}),

	 	}),


		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),				
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),

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
