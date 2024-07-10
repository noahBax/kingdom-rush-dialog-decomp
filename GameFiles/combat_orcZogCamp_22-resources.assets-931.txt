


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03"), || "Crippled"),
		
		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("orc01", "ePos1", true),
			cinematicHelper.MoveCinematicUnit("orc02", "ePos2", true),	
			cinematicHelper.MoveCinematicUnit("peasant01", "pPos1", true),
		}),

		cinematicHelper.Parallel({
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 1.2),
		}),

		cinematicHelper.Sequence({	
			cinematicHelper.Sleep(0.2),	
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc03"),"Speak")),
			cinematicHelper.ShowComment(|| "orc03", || __C(1, "Clatto..."), 1),
			cinematicHelper.Sleep(1.1),
			cinematicHelper.ShowComment(|| "peasant03", || __C(2, "W... WHAT?"), 1.2),
			cinematicHelper.Sleep(1.3),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc04"),"Speak")),
			cinematicHelper.ShowComment(|| "orc04", || __C(3, "Verata..."), 1),
			cinematicHelper.Sleep(1.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc05"),"Attack")),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc04"),"Attack")),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc03"),"Attack")),
			cinematicHelper.ShowComment(|| "orc05", || __C(4, "Niktooooo!"), 1),
			cinematicHelper.Sleep(0.7),
			cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("spawnPos")),
			
			
			
			
			
			
			cinematicHelper.Sleep(0.6),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc06")}, || "Left"),
			cinematicHelper.Sleep(0.6),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc06"), || "Angry"),
			cinematicHelper.ShowComment(|| "orc06", || __C(5, "Raga'wanga!!"), 1.5),
			cinematicHelper.Sleep(0.8),

			cinematicHelper.Parallel({
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc06")),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 2),
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			}),

			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc05")}, || "Left"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03"), || "Victory"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04"), || "Victory"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc05"), || "Victory"),	

			cinematicHelper.Parallel({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.ShowComment(|| "hero01", || __C(6, "Let's stop\nthis madness!"), 2),
				cinematicHelper.MoveCinematicUnit("peasant03","pPos2", true),
			}),

			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant03")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
			
		}),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1.2),
			cinematicHelper.Sequence({
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc03")),
				cinematicHelper.Sleep(0.1),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc04")),
				cinematicHelper.Sleep(0.1),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc05")),
			}),
		}),

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
