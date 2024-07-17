

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 1.2),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("ogre01"),"Speak")),
				cinematicHelper.ShowComment(|| "ogre01", || __C(1, "Krum says\nstop Hunams Heros!"), 2.5),
				cinematicHelper.Sleep(2.7),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("ogre01"),"Speak")),
				cinematicHelper.ShowComment(|| "ogre01", || __C(2, "We Krum Tusk!\nWe stop Hunams!"), 1.5),
				cinematicHelper.Sleep(1.7),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01"), || "Victory"),
				cinematicHelper.ShowComment(|| "orc01", || __C(3, "Krum!"), 1.2),
				cinematicHelper.Sleep(0.8),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc02"), || "Victory"),
				cinematicHelper.Sleep(0.05),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04"), || "Victory"),
				cinematicHelper.Sleep(0.05),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03"), || "Victory"),
				cinematicHelper.Sleep(0.4),
				cinematicHelper.ShowComment(|| "orc03", || __C(4, "Krum!"), 1.2),
				
				
				
				cinematicHelper.Sleep(2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("ogre01"),"Speak")),
				cinematicHelper.ShowComment(|| "ogre01", || __C(5, "They here!\nGO NOW!"), 1.5),
				cinematicHelper.Sleep(0.8),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc02")),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04")),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01")),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03")),
					cinematicHelper.Parallel({	
						cinematicHelper.MoveCinematicUnit("orc02", "orcPos2", true),
						cinematicHelper.MoveCinematicUnit("orc04", "orcPos4", true),
						cinematicHelper.Sequence({	
							cinematicHelper.Sleep(0.2),
							cinematicHelper.Parallel({
								cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 3),
								cinematicHelper.MoveCinematicUnit("orc01", "orcPos1", true),
								cinematicHelper.MoveCinematicUnit("orc03", "orcPos3", true),
							}),
						}),
					}),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc02"),"Speak")),
				cinematicHelper.ShowComment(|| "orc02", || __C(6, "HEROES!"), 1.2),
				cinematicHelper.Sleep(1.6),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc02"),"Speak")),
				cinematicHelper.ShowComment(|| "orc02", || __C(7, "You die here!"), 1.4),
				cinematicHelper.Sleep(1.4),
				cinematicHelper.ShowComment(|| "hero01", || __C(8, "Let's see you try!"), 1.6),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.Sleep(2.0),
			}),			

			 cinematicHelper.Parallel({
			 	
			 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			 }),
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
