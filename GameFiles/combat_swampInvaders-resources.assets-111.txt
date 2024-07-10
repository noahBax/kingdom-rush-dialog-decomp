

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		
		cinematicHelper.Parallel({
			 cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			 cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			 cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			 cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			 cinematicHelper.Sequence({
			 	cinematicHelper.Sleep(0.8),
				cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
			 }),

		}),

		cinematicHelper.Sequence({
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		 	cinematicHelper.ShowComment(|| "hero02", || __C(1, "What a foul place..."), 1.8),
		 	cinematicHelper.Sleep(1.8),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("snapVineIntro"),"Attack")),
		 	cinematicHelper.Sleep(0.6),
		 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Left"),
		 	
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Dodge")),
		 	cinematicHelper.Sleep(0.8),
		 	cinematicHelper.ShowComment(|| "hero01", || __C(2, "WOAH!"), 1),
		 	cinematicHelper.Sleep(0.2),
		 	cinematicHelper.MoveCinematicUnit("hero01", "heroPos04", true),
		 	cinematicHelper.Sleep(0.2),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 	cinematicHelper.ShowComment(|| "hero01", || __C(3, "and dangerous!"), 2),
		 	cinematicHelper.Sleep(1.6),
		 }),
		
		cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orcShaman01"),"Speak")),
			cinematicHelper.ShowComment(|| "orcShaman01", || __C(4, "This is our swamp now!"), 2),
			cinematicHelper.Sleep(2),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcWarrior01"), || "Angry"),
			cinematicHelper.ShowComment(|| "orcWarrior01", || __C(5, "Go away!"), 1.4),
			cinematicHelper.Sleep(1.2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orcWarrior01")),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(6, "We'll see\nabout that!"), 2),
			cinematicHelper.Sleep(1.6),
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
