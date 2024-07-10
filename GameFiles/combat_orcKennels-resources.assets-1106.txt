

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		
		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.Sequence({
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf01"), || "Angry"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf03"), || "Angry"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf02"), || "Angry"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf04"), || "Angry"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf05"), || "Angry"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf06"), || "Angry"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf07"), || "Angry"),
			cinematicHelper.Sleep(1.6),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf01")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf02")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf03")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf04")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf05")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf06")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wolf07")),
		}),
		

		 cinematicHelper.Sequence({
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc01"),"TakeDamage")),
		 	cinematicHelper.Sleep(0.05),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc02"),"TakeDamage")),
		 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc01")}, || "Right"),
		 	cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc02")}, || "Right"),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1.5),

		 	
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc01"),"Speak")),
			cinematicHelper.ShowComment(|| "orc01", || __C(1, "Critters\nbe hungry!"), 1.5),
			cinematicHelper.Sleep(1.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc02"),"Speak")),
			cinematicHelper.ShowComment(|| "orc02", || __C(2, "We needs to\nfind sum\ncritter chow!"), 2),
			cinematicHelper.Sleep(2),
		}),
			
		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("legend","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			cinematicHelper.MoveCinematicUnit("hero04","heroPos04", true),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		}),
		
		cinematicHelper.Sequence({	
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc01")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc02")}, || "Left"),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc02"),"Speak")),
			cinematicHelper.ShowComment(|| "orc02", || __C(3, "Looks like\nmeat is back on the\nmenu!"), 2.4),
			cinematicHelper.Sleep(2.6),
			cinematicHelper.ShowComment(|| "Legend", || __C(4, "We'll see\nabout that!"), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1.8),				
		}),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos03")}, || 0.8),

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
