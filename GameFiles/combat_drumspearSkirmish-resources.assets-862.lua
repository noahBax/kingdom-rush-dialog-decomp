


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian01"), || "Angry"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian02"), || "Angry"),

		 cinematicHelper.Sleep(0.6),

		 cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("barbarian01","barbarianPos01", true),
			
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("barbarian02"),"Speak")),
			cinematicHelper.ShowComment(|| "barbarian02", || __C(1, "There they are!"), 1.8), 

		 }),
		 
		 
		 
			 	
			 	
			 	
			 	
		
		
		
		cinematicHelper.Sleep(0.6),

		 cinematicHelper.Parallel({

		 	 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian02")),
		 	 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian01")),
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
			 cinematicHelper.ShowComment(|| "barbarian01", || __C(2, "For our people!!"), 2.4), 
			 cinematicHelper.MoveCinematicUnit("barbarian01","avalanchePos01", true),
			 cinematicHelper.MoveCinematicUnit("barbarian02","avalanchePos02", true),

			 cinematicHelper.Sequence({
	 		 	 cinematicHelper.Sleep(1.4),
			 	 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("chieftain"),"SpellCastB")),

				 cinematicHelper.Sleep(0.8),
				 cinematicHelper.AddFxToPosition(|| "TrollAvalancheBeatHitFXMega", || cinematicHelper.FindCinematicPos("avalanchePos01")),
				 cinematicHelper.Instant(function ()
							local unitView = cinematicHelper.FindCinematicUnit("barbarian01")
							local unit = unitView.GetUnit()
							abilitiesHelper.ApplyModifier(unit, "modifier_new_freeze")
						end),
				 cinematicHelper.Sleep(0.4),
				 cinematicHelper.AddFxToPosition(|| "TrollAvalancheBeatHitFXMega", || cinematicHelper.FindCinematicPos("avalanchePos02")),
				 cinematicHelper.Instant(function ()
							local unitView = cinematicHelper.FindCinematicUnit("barbarian02")
							local unit = unitView.GetUnit()
							abilitiesHelper.ApplyModifier(unit, "modifier_new_freeze")
						end),
				 
				 
				 
					
					
					
					
			  }),
		 }),

		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("chieftain"),"Speak")),
		 cinematicHelper.ShowComment(|| "chieftain", || __C(3, "HA!\nPuny humans!"), 2), 
		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Parallel({
		 		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian02")),
		  		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("chieftain"), || "Victory"),
		  		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1.2),
		  		cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("chieftain")),
		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("chieftain"),"Speak")),
		 cinematicHelper.ShowComment(|| "chieftain", || __C(4, "You want sum too?!"), 2),  
		 cinematicHelper.Sleep(1.8),

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
