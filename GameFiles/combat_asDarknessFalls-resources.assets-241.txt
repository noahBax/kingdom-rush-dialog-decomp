


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		 cinematicHelper.Instant(function ()
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("TURNMARKER").GetUnit(), "silveroak_find_ashervan_den_achievement_trait_modifier")
		 end),

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 2.4),
		 	
		 	
		 
				 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 	
		 	
		 }),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),

		cinematicHelper.ShowComment(|| "enemy01", || __C(1, "You've come far."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		cinematicHelper.Sleep(1.8),

		cinematicHelper.ShowComment(|| "enemy02", || __C(2, "But far is not enough."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy02"),"Speak")),
		cinematicHelper.Sleep(1.8),

		cinematicHelper.ShowComment(|| "enemy01", || __C(3, "And the change that we brought."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		cinematicHelper.Sleep(1.8),

		cinematicHelper.ShowComment(|| "enemy02", || __C(4, "Cannot be undone."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy02"),"Speak")),
		cinematicHelper.Sleep(1.8),

		cinematicHelper.ShowComment(|| "enemy01", || __C(5, "You'll not live to see the end."), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		cinematicHelper.Sleep(1.8),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos03")}, || 0.8),

		
		
		

		
		
		

		

		cinematicHelper.ShowComment(|| "Legend", || __C(6, "Do not falter!"), 1.6), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(1.4),

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
