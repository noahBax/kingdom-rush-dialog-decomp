local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
		cinematicHelper.RemoveSkill("shield_of_retribution"),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

encounterLogic.AddCinematic("OnEndTurn",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowNotification("NotificationRanged2"),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))


return encounterLogic;
