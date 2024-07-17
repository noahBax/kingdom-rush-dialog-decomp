


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Sleep(0.6),
		 cinematicHelper.Sequence({
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Fear"),
				cinematicHelper.ShowComment(|| "Orc01", || __C(1, "You works fer\nKrum now!"), 2),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Orc01"), || "Angry"),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 1),
				cinematicHelper.ShowComment(|| "hero01", || __C(2, "Hey!\nMess with someone\nyour own size!"), 2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Orc01")}, || "Left"),
				cinematicHelper.Sleep(2.8),
				cinematicHelper.ShowComment(|| "Legend", || __C(3, "He is bigger\nthan us...."), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(2.2),
				cinematicHelper.ShowComment(|| "hero01", || __C(4, "Oh ... right."), 1.2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.Sleep(1.5),
				cinematicHelper.ShowComment(|| "hero01", || __C(5, "Well ...\nfight us anyway!"), 1.8),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				cinematicHelper.Sleep(2),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Orc01")),
				cinematicHelper.Sleep(0.2),
		}),

		 cinematicHelper.SetCinematicBarsVisibility(false),
		 cinematicHelper.StartFight(),	
		 cinematicHelper.Sleep(1.2),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant01"), || "Victory"),
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
