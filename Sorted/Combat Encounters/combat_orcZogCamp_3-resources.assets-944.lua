

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Crippled"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Angry"),
		 cinematicHelper.Instant(function ()
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("peasant01").GetUnit(), "soldier_survives_orc_camp_achievement_modifier")
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("peasant02").GetUnit(), "soldier_survives_orc_camp_achievement_modifier")
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("peasant03").GetUnit(), "soldier_survives_orc_camp_achievement_modifier")
		 end),

cinematicHelper.FadeScreenFX(true),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.8),	
				
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("ogre01"),"Speak")),
					cinematicHelper.ShowComment(|| "ogre01", || __C(1, "GET READY..."), 1.5),
					cinematicHelper.Sleep(1.5),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01"), || "Victory"),
					cinematicHelper.ShowComment(|| "ogre01", || __C(2, "FOR THE BLOOD!"), 1.5),
					cinematicHelper.Sleep(1.5),
					
					cinematicHelper.Parallel({
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 2.4),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcArcher01"), || "Victory"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcArcher02"), || "Victory"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcArcher04"), || "Victory"),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04"), || "Victory"),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03")),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Attack"),
					}),	
				
				
				cinematicHelper.ShowComment(|| "peasant03", || __C(3, "Bring it on!"), 1.4),
				cinematicHelper.Sleep(1),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03")),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Angry"),
			}),			

			cinematicHelper.Sequence({	
						cinematicHelper.Sleep(6.4),
						
						cinematicHelper.Parallel({
							cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
							cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
							cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
							cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
							cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.2),
						}),

						cinematicHelper.Sleep(0.1),

						
						
						cinematicHelper.Parallel({
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc04")}, || "Left"),
							cinematicHelper.Sleep(0.2),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc01")}, || "Left"),
							cinematicHelper.Sleep(0.2),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orcArcher01")}, || "Left"),
							cinematicHelper.Sleep(1),
						}),
						
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01")),
						cinematicHelper.ShowComment(|| "Legend", || __C(4, "It's even now,\ngreen beans!"), 2.4),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
						cinematicHelper.Sleep(2.6),
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.6),
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01"), || "Angry"),
						cinematicHelper.ShowComment(|| "ogre01", || __C(5, "GOOD, MORE BLOOD\nFOR ORCS!"), 1.8),
						cinematicHelper.Sleep(1.6),
						cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ogre01")),
					}),
		}),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 0.6),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcArcher01")),
		cinematicHelper.Sleep(0.1),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcArcher04")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcArcher02")),
		cinematicHelper.Sleep(0.1),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02")),
		cinematicHelper.Sleep(0.1),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03")),
		cinematicHelper.FromCinematicToUnit("peasant01",UnitGroup.GoodSide),
		cinematicHelper.FromCinematicToUnit("peasant02",UnitGroup.GoodSide),
		cinematicHelper.FromCinematicToUnit("peasant03",UnitGroup.GoodSide),
		

		cinematicHelper.Sequence({
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
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

return encounterLogic;
