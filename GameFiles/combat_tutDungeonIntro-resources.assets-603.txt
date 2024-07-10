


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicTutorialFight")
	cinematicHelper.InstantiateGenericPrefab("TutorialHighlight", "TutorialHighlight")

end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("TURNMARKER")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "tutorial_first_fight_trait_end_turn_modifier")
			abilitiesHelper.ApplyModifier(unit, "tutorial_first_fight_trait_first_movement_modifier")
			abilitiesHelper.ApplyModifier(unit, "tutorial_first_fight_trait_melee_movement_modifier")
		 end),
	  
		 

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("Legend","legendPos", true),
				cinematicHelper.Sequence({
					 cinematicHelper.Sleep(1.6),
					 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 1.2),
					 
			 		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("guard")}, || "Left"),
					 cinematicHelper.Sleep(0.2),

				}),

				cinematicHelper.Sequence({	
					cinematicHelper.SetCinematicBarsVisibility(true),
			 		cinematicHelper.SetCurtain(true),
				}),
		}),
 			
 		cinematicHelper.Sequence({

			cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("guard","guardPos", true),
				cinematicHelper.Sequence({
					cinematicHelper.Sleep(0.4),
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 1),
				}),
			}),

			cinematicHelper.ShowComment(|| "guard", || __C(1, "Where do you\nthink you're\ngoing?!"), 2.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard"),"Speak")),
			cinematicHelper.Sleep(2.8),
			cinematicHelper.ShowComment(|| "Legend", || __C(2, "Far away from\nthis prison!"), 2.4), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(2.8),
			
			
			
			
			
			
			
			
			
			
		}),



		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),				
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.RemoveSkill("shield_of_retribution"),
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

encounterLogic.AddCinematic("OnEndTurn",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("ENDTURN-" .. cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber"))),
		
		
		

		
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 3, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.ShowNotification("NotificationDungeon3"),
			

		})),

	}))

encounterLogic.AddCinematic("EndTurnTutorial",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("TutorialHighlight"), "ShowEndTurn")),
	    
	}))

encounterLogic.AddCinematic("FirstMovementTutorial",cinematicHelper.Cinematic({
		cinematicHelper.Sleep(1.0),
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("TutorialHighlight"), "ShowMovementSingle", "TutorialMovePos1")),
	    
	}))

encounterLogic.AddCinematic("MeleeMovementTutorial",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("TutorialHighlight"), "ShowMovementMeleeRangeSimple", "TutorialMovePos2")),
	    
	}))


encounterLogic.AddCinematic("MeleeAttackTutorial",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("TutorialHighlight"), "ShowMeleeAttackSimple", "TutorialAttackPos")),
	    
	}))

return encounterLogic;
