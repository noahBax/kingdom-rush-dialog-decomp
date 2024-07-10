


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		

		cinematicHelper.Sequence({

			cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			}),

			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(1, "Careful,\nenemies ahead."), 2), 
			cinematicHelper.Sleep(2),

		}),

		cinematicHelper.Parallel({	
			cinematicHelper.MoveCinematicUnit("troll01", "enemyPos01", true),
			cinematicHelper.MoveCinematicUnit("troll02", "enemyPos02", true),
			cinematicHelper.MoveCinematicUnit("troll03", "enemyPos03", true),
			cinematicHelper.MoveCinematicUnit("troll04", "enemyPos04", true),
			cinematicHelper.MoveCinematicUnit("troll05", "enemyPos05", true),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		}),
			
		cinematicHelper.Sequence({
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll04"), || "Speak"),
			cinematicHelper.ShowComment(|| "troll04", || __C(2, "No worry, guys,\nwe high ground."), 2.4), 
			cinematicHelper.Sleep(2.4),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll04")),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
			cinematicHelper.ShowComment(|| "HeroUnit", || __C(3, "You underestimate\nour power!"), 2), 
			cinematicHelper.Sleep(1.8),
		}),
		
		cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.6),
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
