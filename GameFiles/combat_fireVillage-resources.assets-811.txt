


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("cameraPos01")),
		 
		 cinematicHelper.Sequence({	
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("goblin1"), || "Angry"),
				cinematicHelper.Sleep(0.1),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("goblin2"), || "Angry"),
		 		cinematicHelper.Sleep(0.6),
		 		cinematicHelper.Parallel({
		 			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.6),

		 			cinematicHelper.Sequence({	
				 		cinematicHelper.Sleep(0.6),
						
						cinematicHelper.ShowComment(|| "goblin1", || __C(1, "Fiyahhh!"), 1.4),
						cinematicHelper.Sleep(1.6),
						cinematicHelper.ShowComment(|| "goblin2", || __C(2, "We puts\nthe veelaj on\nfiyahhh!"), 2.5),
						cinematicHelper.Sleep(2),
					}),
				}),	

				cinematicHelper.Parallel({
							cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
							cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
							cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
							cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
							cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
				}),

				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("goblin1")}, || "Left"),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Speak"),
				cinematicHelper.ShowComment(|| "Legend", || __C(3, "You'll pay for this!"), 1.2),
				cinematicHelper.Sleep(1.2),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("goblin1")),
				cinematicHelper.Sleep(0.05),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("goblin2")),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),



		}),	

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.8),
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
