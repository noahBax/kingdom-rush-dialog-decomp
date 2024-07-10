

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Sequence({	
		 	cinematicHelper.Sleep(1),
		 	cinematicHelper.ShowComment(|| "hero01", || __C(1, "There!\nI can see the wheat shaking!"), 2),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero01"), || "Speak"),
			cinematicHelper.Sleep(2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero01")),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.ShowComment(|| "Legend", || __C(2, "Alright!\nKeep your eyes\nsharp..."), 2),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Speak"),
			cinematicHelper.Sleep(2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "and your swords sharper."), 1),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Speak"),
			cinematicHelper.Sleep(1),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
			cinematicHelper.Sleep(0.5),

	 		cinematicHelper.Parallel({
	 			cinematicHelper.Sequence({	
			 		cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("wolf1"), || cinematicHelper.FindCinematicPos("enemyPos1"), || false),
				}),
				cinematicHelper.Sequence({	
			 		cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("wolf2"), || cinematicHelper.FindCinematicPos("enemyPos2"), || false),
				}),
				cinematicHelper.Sequence({	
			 		cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("wolf3"), || cinematicHelper.FindCinematicPos("enemyPos3"), || false),
				}),
				cinematicHelper.Sequence({	
			 		cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("wolf4"), || cinematicHelper.FindCinematicPos("enemyPos4"), || false),
				}),
				cinematicHelper.Sequence({	
			 		cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("wolf5"), || cinematicHelper.FindCinematicPos("enemyPos5"), || false),
				}),
				cinematicHelper.Sleep(1.5),
			}),

			cinematicHelper.ShowComment(|| "hero02", || __C(4, "Looks like\nthe puppies\nwant a treat!"), 2),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02"), || "Speak"),
			cinematicHelper.Sleep(2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero02")),
			cinematicHelper.Sleep(0.5),
		}),	

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(1.2),
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
