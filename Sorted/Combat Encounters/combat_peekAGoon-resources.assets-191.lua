


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon01"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon01", || __C(1, "What are they\ndoing in there?"), 2.4), 
		 cinematicHelper.Sleep(2.8),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon02"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon02", || __C(2, "I don't know, but\nthey're weird...."), 2.6), 
		 cinematicHelper.Sleep(2.8),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon02"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon02", || __C(3, "...should we go in?"), 1.8), 
		 cinematicHelper.Sleep(2),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon01"),"Speak")),
		 cinematicHelper.ShowComment(|| "demon01", || __C(4, "Gah!\nLater, I guess."), 1.8), 
		 cinematicHelper.Sleep(2),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("cultist02","cultistPos02", true),
			cinematicHelper.MoveCinematicUnit("cultist03","cultistPos03", true),
			cinematicHelper.MoveCinematicUnit("cultist04","cultistPos04", true),

			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"Speak")),
				cinematicHelper.ShowComment(|| "cultist01", || __C(5, "Get out of here..."), 1.8), 
			})
		}),
		
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Angry"),
		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(6, "All of you!"), 1.6), 
		 cinematicHelper.Sleep(1.6),

		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos03")}, || 1),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),

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
