


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),


		 cinematicHelper.Sequence({
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01"), || "Attack"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02"), || "Angry"),
			cinematicHelper.Sleep(0.1),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03"), || "Angry"),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf04"), || "Attack"),
		 }),

	    cinematicHelper.Sequence({
			cinematicHelper.MoveCinematicUnit("orcShaman","enemyPos03", true),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcShaman"), || "Speak"),
			cinematicHelper.ShowComment(|| "orcShaman", || __C(1, "Focus, boys.\nFestival is near!"), 2),
			cinematicHelper.Sleep(0.8),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcShaman")),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orcShaman")}, || "Right"),
			cinematicHelper.Sleep(0.6),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orcShaman")}, || "Left"),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcShaman"), || "Angry"),
			cinematicHelper.ShowComment(|| "orcShaman", || __C(2, "BOYS!"), 1.4),
			cinematicHelper.Sleep(1.2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcShaman")),
			cinematicHelper.Sleep(0.8),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcShaman"), || "Crippled"),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.ShowComment(|| "orcShaman", || __C(3, "*Sigh*"), 1),
			cinematicHelper.Sleep(1),
		}),	

		cinematicHelper.Sequence({

			cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
			}),

			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02")),
			cinematicHelper.Sleep(0.1),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf04")),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcShaman")),
			cinematicHelper.Parallel({
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf01")}, || "Left"),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf03")}, || "Left"),
			}),
			cinematicHelper.Sleep(0.2),

			cinematicHelper.Parallel({
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf02")}, || "Left"),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wulf04")}, || "Left"),
			}),

			cinematicHelper.Sleep(0.4),

			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf01"),"SpellCastA")),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf04"),"SpellCastA")),
			cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),

			cinematicHelper.Sleep(0.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf02"),"SpellCastA")),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf03"),"SpellCastA")),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
			cinematicHelper.Sleep(0.4),

		}),	

		cinematicHelper.Sequence({
			cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("warg01")}, || 0.4),
				cinematicHelper.MoveCinematicUnit("warg01", "enemyPos01",true),
			}),
			cinematicHelper.Sleep(0.6),
			cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("warg02")}, || 0.4),
				cinematicHelper.MoveCinematicUnit("warg02", "enemyPos02",true),
			}),	
			cinematicHelper.Sleep(0.6),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 1),
			cinematicHelper.ShowComment(|| "orcShaman", || __C(4, "Yes, yes!\nNow we dance!"), 1.8),
			cinematicHelper.Sleep(2.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orcShaman"),"Attack")),
			cinematicHelper.ShowComment(|| "orcShaman", || __C(5, "Go, my boys!"), 1.8),
			cinematicHelper.Sleep(1.6),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
 		}),	

		cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.2),				

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
