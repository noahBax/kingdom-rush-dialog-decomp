

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		cinematicHelper.Sequence({	
			cinematicHelper.Sleep(0.4),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.6),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant"), || "Fear"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("warg"), || "Angry"),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc01"),"Speak")),
			cinematicHelper.ShowComment(|| "orc01", || __C(1, "Munch! Munch! Munch!"), 1.5),
			cinematicHelper.Sleep(2.4),
			
			
			
			
			cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos2")}, || 0.6),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc06"),"Speak")),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc06"), || "Angry"),
				cinematicHelper.ShowComment(|| "orc06", || __C(2, "Fight, you coward!"), 1.8),
				cinematicHelper.Sleep(2),
			}),
		}),

		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc06")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("peasant"),"Speak")),
		cinematicHelper.ShowComment(|| "peasant", || __C(3, "Back off!"), 1.2),
		cinematicHelper.Sleep(1.2),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("peasant")}, || "Left"),
		
		cinematicHelper.MoveCinematicUnit("peasant", "pos3", true),


		
		
		
		cinematicHelper.Parallel({
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc01")}, || "Left"),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 0.5),
			
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("peasant"),"Attack")),
				cinematicHelper.Sleep(0.3),
				
				cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("pos3")),

				cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("wall1")),
				cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("wall2")),
			}),

			cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			}),
		}),
		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("peasant", "pos5", true),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(4, "Go! We have\nyour back."), 1.6),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("warg")),
		}),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("peasant")}, || "Right"),
		
		
		


		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.4),
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
