


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		
		cinematicHelper.Sleep(0.8),

		cinematicHelper.Sequence({			 
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Right"),
			cinematicHelper.Sleep(0.6),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Left"),
			cinematicHelper.Sleep(0.6),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
			cinematicHelper.ShowComment(|| "hero02", || __C(1, "What a lovely\nplace!"), 1.8), 
			cinematicHelper.Sleep(1.8),
		}),	

		cinematicHelper.Parallel({
			 cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			 cinematicHelper.MoveCinematicUnit("trollWarrior01","enemyPos01", true),
			 cinematicHelper.MoveCinematicUnit("trollWarrior02","enemyPos03", true),
			 cinematicHelper.MoveCinematicUnit("trollChamp01","enemyPos02", true),
			 cinematicHelper.MoveCinematicUnit("trollChamp02","enemyPos04", true),
			 cinematicHelper.MoveCinematicUnit("trollChief01","enemyPos05", true),
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.8),
		}),
		cinematicHelper.Sleep(0.8),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		cinematicHelper.ShowComment(|| "hero02", || __C(2, "..."), 1), 
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("legend")}, || "Right"),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Right"),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero03")}, || "Right"),
		cinematicHelper.Sleep(0.8),


		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.ShowComment(|| "hero02", || __C(3, "I take that back."), 1.6), 
		cinematicHelper.Sleep(1.2),
		
		cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.4),
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
