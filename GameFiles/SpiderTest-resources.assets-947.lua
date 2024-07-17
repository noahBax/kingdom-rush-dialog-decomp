local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("prisonerHuman"), || "StandGoblin"),
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
		 								 || cinematicHelper.GetHeroTeamSpawnPositions(),
		 								 || true),
		cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

return encounterLogic;
