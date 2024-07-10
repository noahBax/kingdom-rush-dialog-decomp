


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicTutorialFight")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	  
		 

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({
		 	cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("Legend","legendPos", true),
			}),
			
			cinematicHelper.Sequence({	
				cinematicHelper.SetCinematicBarsVisibility(true),
		 		cinematicHelper.SetCurtain(true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.5),	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 3.5),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("Ranger","rangerPos", true),
			}),

	 	}),

		 cinematicHelper.Sequence({	
	 		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("guard")}, || "Left"),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.ShowComment(|| "guard", || __C(1, "End of the road,\nPaladin!"), 2.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard"),"Speak")),
			cinematicHelper.Sleep(2.8),
			cinematicHelper.ShowComment(|| "Legend", || __C(2, "These crates!"), 1.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1.8),
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "I can't\nget to them!"), 1.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(1.8),
			cinematicHelper.ShowComment(|| "Ranger", || __C(4, "I got it!"), 1.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Ranger"),"Speak")),
			cinematicHelper.Sleep(1.8),
			cinematicHelper.ShowComment(|| "Legend", || __C(5, "I'll use my\nretribution shield\nto protect us!"), 3), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(3.3),
			
		}),


		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),				
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(1),
				cinematicHelper.ShowNotification("NotificationRanged1"),

		}),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.Sleep(1),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))








		



encounterLogic.AddCinematic("OnEndTurn1",cinematicHelper.Cinematic({
		cinematicHelper.ShowNotification("NotificationRanged2"),
}))

return encounterLogic;
