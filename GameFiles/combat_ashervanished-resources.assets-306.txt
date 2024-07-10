


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		  cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 2.4),
		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(0.4),
		 		cinematicHelper.Parallel({
			 		cinematicHelper.MoveCinematicUnit("enemy01","enemyPos", true),
			 		cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			 		cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			 		cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			 		cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 		})
		 	})
		 }),

		cinematicHelper.ShowComment(|| "enemy01", || __C(1, "Where are you\ngoing?"), 1.8), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		cinematicHelper.Sleep(2.2),

		cinematicHelper.ShowComment(|| "hero01", || __C(2, "To stop this\ncalamity!"), 1.8), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		cinematicHelper.Sleep(1.6),

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
