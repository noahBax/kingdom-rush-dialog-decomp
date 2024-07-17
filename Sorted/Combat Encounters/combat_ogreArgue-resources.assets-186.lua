


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	    
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
		 cinematicHelper.Sleep(0.4),
	 	 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 1.6),
		 
		 	cinematicHelper.ConditionalIfElse(|| cinematicHelper.QuestStatus().context.GetObject("diffVariant") == "1", cinematicHelper.Sequence(
				{	
					
					
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01"), || "Angry"),
					cinematicHelper.ShowComment(|| "ogre01", || __C(1, "Me eat hunam!"), 1.8),
					cinematicHelper.Sleep(1.8),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01")),
					cinematicHelper.Sleep(0.4),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02"), || "Angry"),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("peasant01")}, || "Left"),
					cinematicHelper.ShowComment(|| "ogre02", || __C(2, "ME CATCH!"), 1.4),
					cinematicHelper.Sleep(1.2),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02")),
					cinematicHelper.Sleep(0.2),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre03"), || "Angry"),
					cinematicHelper.ShowComment(|| "ogre03", || __C(3, "NO!\nME EAT!"), 1.4),
					cinematicHelper.Sleep(1.2),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre03")),
					
				}),

				cinematicHelper.Sequence(
				{	
					
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01"), || "Angry"),
					cinematicHelper.ShowComment(|| "ogre01", || __C(4, "Me eat hunam!"), 1.8),
					cinematicHelper.Sleep(1.8),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01")),
					cinematicHelper.Sleep(0.4),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02"), || "Angry"),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("peasant01")}, || "Left"),
					cinematicHelper.ShowComment(|| "ogre02", || __C(5, "ME CATCH!"), 1.4),
					cinematicHelper.Sleep(1.6),
					cinematicHelper.ShowComment(|| "ogre02", || __C(6, "ME EAT!"), 1.4),
					cinematicHelper.Sleep(1.4),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02")),
					
				})	
			),

			cinematicHelper.ConditionalIfElse(|| cinematicHelper.QuestStatus().context.GetObject("diffVariant") == "1", cinematicHelper.Sequence(
				{	
					
					cinematicHelper.Parallel({
						cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
						cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
						cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
						cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
						cinematicHelper.MoveCinematicUnit("peasant01", "npcPos1", true),
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.2),
						
					}),
					
					
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("ogre02")}, || "Left"),
					cinematicHelper.ShowComment(|| "ogre02", || __C(7, "HUH?"), 1),
					cinematicHelper.Sleep(1.2),				
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
					cinematicHelper.ShowComment(|| "hero02", || __C(8, "Let him go!"), 1.8),
					cinematicHelper.Sleep(2),
					cinematicHelper.Parallel({
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02"), || "Victory"),
						cinematicHelper.ShowComment(|| "ogre02", || __C(9, "MOAR FOOD!"), 1.4),
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(0.1),
							cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01"), || "Victory"),
							cinematicHelper.Sleep(0.1),
							cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre03"), || "Victory"),
						}),
					}),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("peasant01")}, || "Left"),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Angry"),
					cinematicHelper.Sleep(1.2),					
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01")),
					cinematicHelper.Sleep(0.05),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02")),
					cinematicHelper.Sleep(0.05),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre03")),
					
				}),

				cinematicHelper.Sequence(
				{	
					
					cinematicHelper.Parallel({
						cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
						cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
						cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
						cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
						cinematicHelper.MoveCinematicUnit("peasant01", "npcPos1", true),
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.2),
						
					}),
					
					
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("ogre02")}, || "Left"),
					cinematicHelper.ShowComment(|| "ogre02", || __C(10, "HUH?"), 1),
					cinematicHelper.Sleep(1.2),				
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
					cinematicHelper.ShowComment(|| "hero02", || __C(11, "Let him go!"), 1.8),
					cinematicHelper.Sleep(2),
					cinematicHelper.Parallel({
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02"), || "Victory"),
						cinematicHelper.ShowComment(|| "ogre02", || __C(9, "MOAR FOOD!"), 1.4),
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(0.1),
							cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01"), || "Victory"),
						}),
					}),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("peasant01")}, || "Left"),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Angry"),
					cinematicHelper.Sleep(1.2),					
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01")),
					cinematicHelper.Sleep(0.05),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre02")),
					
				})
			),

		 cinematicHelper.Sequence({
			 cinematicHelper.SetCinematicBarsVisibility(false),
			 cinematicHelper.SetIngameHudVisibility(true);
			 cinematicHelper.StartFight(),	
			 cinematicHelper.Sleep(0.8),
		 }),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Victory"),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
		cinematicHelper.ShowDefeated(),
	}))

return encounterLogic;
