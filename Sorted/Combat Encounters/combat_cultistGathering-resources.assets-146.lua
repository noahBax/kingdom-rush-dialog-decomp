


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
	 	cinematicHelper.Sequence({
		 		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ritualPriest"), || "SpellCastA"),
		 		cinematicHelper.Sleep(0.8),
		 		cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("ritualPos")),
		 		cinematicHelper.Sleep(0.8),
		 		cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("ritualPos")),
		 		cinematicHelper.Sleep(0.8),

		 		cinematicHelper.Parallel({
					cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("ritualPos")),
					cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
					cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
					cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
					cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
				}),

		 		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 		cinematicHelper.ShowComment(|| "Legend", || __C(1, "Stop right there!"), 1.8), 
		 		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ritualPriest")),
		 		cinematicHelper.Sleep(1.8),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("ritualPriest")}, || "Left"),
				cinematicHelper.Sleep(0.2),
				cinematicHelper.Parallel({
			 		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("ritualPriest"), || "Angry"),
			 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
				}),
			 	
		 		cinematicHelper.Sleep(0.2),
			 	cinematicHelper.ShowComment(|| "ritualPriest", || __C(2, "Grrr..."), 1.6), 
				cinematicHelper.Sleep(1.8),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("ritualPriest")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("ritualPriest"),"SpecialAttack")),
				cinematicHelper.Sleep(0.2),
				cinematicHelper.ShowComment(|| "ritualPriest", || __C(3, "GET THEM!!"), 1.5), 
				cinematicHelper.Sleep(1.2),
		}),

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
