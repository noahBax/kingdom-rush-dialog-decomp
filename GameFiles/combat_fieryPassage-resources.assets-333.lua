


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

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
					cinematicHelper.Sleep(1),
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
				}),

		}),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Speak"),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(1, "Sorry, only\nmembers can enter."), 2.2), 
		 cinematicHelper.Sleep(2.2),
 		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),
		 cinematicHelper.Sleep(0.2),
		 
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero01"), || "Speak"),
		 cinematicHelper.ShowComment(|| "hero01", || __C(2, "Then we'll go\nthrough you!"), 2), 
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero01")),
		 cinematicHelper.Sleep(0.4),

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
