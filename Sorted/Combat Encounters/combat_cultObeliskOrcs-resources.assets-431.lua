

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({


	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.5),
						cinematicHelper.ShowComment(|| "cultist1", || __C(1, "You had simple orders..."), 2.2),
						cinematicHelper.Sleep(2.4),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist1"), || "Angry"),
						cinematicHelper.ShowComment(|| "cultist1", || __C(2, "Conquer Pagras!"), 1.5),
						cinematicHelper.Sleep(2),
						
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc1"), || "Speak"),
						cinematicHelper.ShowComment(|| "orc1", || __C(3, "HA!\nYou no order us!"), 1.5),
						cinematicHelper.Sleep(1.5),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc1")),
						cinematicHelper.Sleep(0.3),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist1")),
						cinematicHelper.Sleep(0.5),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
						cinematicHelper.ShowComment(|| "cultist1", || __C(4, "Oh!"), 0.5),
						cinematicHelper.Sleep(1),
						cinematicHelper.ShowComment(|| "cultist1", || __C(5, "Is that so?"), 1.5),
						cinematicHelper.Sleep(1.8),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Attack")),
						cinematicHelper.Sleep(0.6),
						cinematicHelper.AddFxToPosition(|| "GenericReviveFXMega", || cinematicHelper.getUnitPositionFromView(cinematicHelper.FindCinematicUnit("orc1"))),
						cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("orc1")),
						cinematicHelper.SpawnCinematicProp("Forest_Deco_Generic_Scarecrow_01", cinematicHelper.FindCinematicPos("orcPos")),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc2"),"TakeDamage")),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc3"),"TakeDamage")),
						cinematicHelper.Sleep(0.6),
						cinematicHelper.Sequence({	
							cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
														 	 || {cinematicHelper.FindCinematicPos("heroPos1"), 
														 	     cinematicHelper.FindCinematicPos("heroPos2"), 
														 	     cinematicHelper.FindCinematicPos("heroPos3"), 
														 	     cinematicHelper.FindCinematicPos("heroPos4")},
														 	 || true),
						}),
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 1),
						cinematicHelper.Sequence({	
							cinematicHelper.Sleep(0.3),
							cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist1"), || "Angry"),
							cinematicHelper.ShowComment(|| "cultist1", || __C(6, "And now this?"), 1),
							cinematicHelper.Sleep(1.2),
							cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist1")),
							cinematicHelper.Sleep(0.5),
							cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
							cinematicHelper.ShowComment(|| "cultist1", || __C(7, "Get rid\nof this scum."), 2),
							cinematicHelper.Sleep(2.2),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc2")}, || "Left"),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc3")}, || "Left"),
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
