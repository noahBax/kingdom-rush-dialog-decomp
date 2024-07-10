

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.4),
				cinematicHelper.ShowComment(|| "wulf01", || __C(1, "*sniff* *sniff*"), 1.2),
				cinematicHelper.Sleep(1.6),
			}),

		cinematicHelper.Sequence({
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf01")}, || "Left"),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01"), || "Angry"),
			
			cinematicHelper.Sleep(0.2),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf02")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf04")}, || "Left"),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf02"),"Angry")),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf04"),"Angry")),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf03")}, || "Left"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03"), || "Angry"),
			cinematicHelper.Sleep(0.2),
		}),

		cinematicHelper.Parallel({
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03")),
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
			 cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			 cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			 cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			 cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		
	
		cinematicHelper.Sequence({	
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.ShowComment(|| "hero01", || __C(2, "Uh-oh..."), 1.2),
				cinematicHelper.Sleep(1.4),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.ShowComment(|| "Legend", || __C(3, "Easy, boy ...\neaaasy!"), 1.8),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01")),
				cinematicHelper.Sleep(1.4),				
		}),

		cinematicHelper.Sequence({
			cinematicHelper.SetCinematicBarsVisibility(false),
			cinematicHelper.SetIngameHudVisibility(true);
			cinematicHelper.StartFight(),
			cinematicHelper.Sleep(0.8),
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
