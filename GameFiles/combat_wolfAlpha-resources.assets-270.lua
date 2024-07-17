


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Sleep(0.5),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(1, "Did you hear that?"), 2),
		cinematicHelper.Sleep(2),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Left"),
		cinematicHelper.Sleep(0.1),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Left"),
		cinematicHelper.Sleep(0.4),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		cinematicHelper.ShowComment(|| "hero01", || __C(2, "Uh-oh..."), 1),
		cinematicHelper.Sleep(1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf05"),"SpellCastA")),
		cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_bigFaunaHowl"),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf01"),"SpellCastA")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf04"),"SpellCastA")),
		cinematicHelper.ShowComment(|| "wolf05", || __C(3, "ARH-WOOOOOO!"), 1.8),
		cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
		cinematicHelper.Sleep(1.8),

		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("wolf04", "wolfSpot4", true),
			cinematicHelper.MoveCinematicUnit("wolf01", "wolfSpot1", true),
		}),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Right"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Right"),
		}),
  	
  		

  		cinematicHelper.Parallel({
			
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf06"),"SpellCastA")),
			cinematicHelper.ShowComment(|| "wolf06", || __C(4, "GRRRRRR!"), 1),
			cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
			cinematicHelper.Sleep(0.5),
			
			cinematicHelper.MoveCinematicUnit("wolf02", "wolfSpot2", true),
			cinematicHelper.MoveCinematicUnit("wolf03", "wolfSpot3", true),
		}),
		cinematicHelper.Sleep(1),
		cinematicHelper.MoveCinematicUnit("wolf06", "wolfSpot6", true),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
		cinematicHelper.ShowComment(|| "Legend", || __C(5, "Stand your ground!"), 1.8),

		cinematicHelper.Sleep(1.4),

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
