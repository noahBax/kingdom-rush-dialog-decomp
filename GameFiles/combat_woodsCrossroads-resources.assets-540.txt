

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Fear"),

		 cinematicHelper.Sleep(0.8),
	 	 cinematicHelper.ShowComment(|| "villager01", || __C(1, "Please, don't\nhurt us...."), 1.8),

	 	 cinematicHelper.Sleep(1.8),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),

		 cinematicHelper.Parallel({
		 	 cinematicHelper.ShowComment(|| "Legend", || __C(2, "Hey!"), 1),
			 cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			 cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			 cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orcWarrior01")}, || "Left"),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orcArcher01")}, || "Left"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("goblin01")}, || "Left"),
		
		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(3, "Leave them alone!"), 1.4),
		
		 cinematicHelper.Sleep(1.2),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.8),

		}),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Victory"),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))


return encounterLogic;
