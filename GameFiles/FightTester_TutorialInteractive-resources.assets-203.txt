local encounterLogic = encounterHelper.CreateEncounterLogic()


encounterLogic.init = function ()
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
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
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
