


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 


		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy01"), || "Angry"),
		 cinematicHelper.Sleep(0.02),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy02"), || "Angry"),
		 cinematicHelper.Sleep(0.02),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy03"), || "Angry"),
		 cinematicHelper.Sleep(0.02),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy04"), || "Angry"),
		 cinematicHelper.Sleep(0.6),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 2.4),
		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(0.2),
		 		cinematicHelper.Parallel({
				 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 		}),
		 	}),
		 }),

		cinematicHelper.ShowComment(|| "enemy01", || __C(1, "GRRWOOOOOH!"), 1.6), 
		cinematicHelper.Sleep(2),

		cinematicHelper.ShowComment(|| "hero02", || __C(2, "Ahh ... the sounds\nof nature."), 2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.Sleep(2.6),

		cinematicHelper.ShowComment(|| "hero02", || __C(3, "Lovely."), 1.2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		cinematicHelper.Sleep(0.8),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy03")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy01")),
		cinematicHelper.Sleep(0.02),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy04")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("enemy02")),

		cinematicHelper.Sleep(0.2),


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
