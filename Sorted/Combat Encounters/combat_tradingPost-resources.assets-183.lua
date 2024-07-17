

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01"), || "Angry"),
		 
		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "orc01", || __C(1, "Gives us\nyer goodies!"), 2),
				cinematicHelper.Sleep(2.2),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 1.8),
				cinematicHelper.ShowComment(|| "Legend", || __C(2, "Stop!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(1.8),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc01")}, || "Left"),
				cinematicHelper.Sleep(0.05),
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("orc02"),
					cinematicHelper.Sequence({
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc02")}, || "Left"),
				})),
				
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc03")}, || "Left"),
				cinematicHelper.Sleep(0.05),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc04")}, || "Left"),
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("orc05"),
					cinematicHelper.Sequence({
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc05")}, || "Left"),
				})),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc05")}, || "Left"),
				cinematicHelper.ShowComment(|| "Legend", || __C(3, "You'll have to\ngo through us\nfirst!"), 2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
 				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03"), || "Angry"),
				cinematicHelper.Sleep(0.05),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04"), || "Angry"),
				cinematicHelper.Sleep(2.8),
		}),


		 cinematicHelper.Parallel({
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 0.6),
			 cinematicHelper.Sequence({
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc01")),
				cinematicHelper.Sleep(0.1),

				
				cinematicHelper.Sleep(0.05),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03")),
				cinematicHelper.Sleep(0.1),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04")),
			}),
		}),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true),
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.2),		

		}),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant02"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Victory"),
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
