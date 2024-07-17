


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 2.5),
		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(0.5),
		 		cinematicHelper.Parallel({
				 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
				 	cinematicHelper.Sequence({
				 		cinematicHelper.Sleep(1.4),
				 		cinematicHelper.ShowComment(|| "hero02", || __C(1, "We could\nmake a stew..."), 1.6), 
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
				 	}),
		 		}),

		 	}),
		 }),

		cinematicHelper.Sleep(1.2),

		cinematicHelper.ShowComment(|| "hero02", || __C(2, "...with some of\nthese mushrooms!"), 2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.Sleep(2.2),

		cinematicHelper.ShowComment(|| "Legend", || __C(3, "That will have\nto wait."), 1.8), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2.2),

		
		
		

		
		
		

		cinematicHelper.ShowComment(|| "hero02", || __C(4, "Sorry! Fighting\ngives me an appetite."), 2.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.Sleep(2.4),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.4),

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
