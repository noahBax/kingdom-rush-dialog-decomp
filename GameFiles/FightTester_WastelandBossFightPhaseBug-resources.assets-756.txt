local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "WastelandBossFightDebugPanel")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowDefeated(),
		cinematicHelper.ShowMoveForwardButton(),
	}))

encounterLogic.AddCinematic("OnEndTurn1",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn2",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn3",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn4",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn5",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn6",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn7",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn8",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

encounterLogic.AddCinematic("OnEndTurn9",cinematicHelper.Cinematic({
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1")),
	}))

	

encounterLogic.AddCinematic("IrizaDied1",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(1),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("RespawnFocusPos")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Iriza"),||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
			cinematicHelper.AddFxToPosition(|| "WBFTeleportLandFXMega" ,||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.ShowComment(|| "Iriza",|| __C(0, "Yipee ka yay mfers"), 2),
			cinematicHelper.Sleep(2),
		}),

		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1CustomContent")),
	
		cinematicHelper.UseSkillOnUnit(
				||cinematicHelper.FindCinematicUnit("Iriza"),
				|| "wbf_iriza_phase2_telegraph" ,
				||cinematicHelper.FindCinematicUnit("Heroe"),
				|| {}
		),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("Iriza")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_phase2_modidfier")
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_gone_modidfier")
		end),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibilityFixed(true),
	}))

encounterLogic.AddCinematic("IrizaDied1CustomContent",cinematicHelper.Cinematic({
		
	}))

encounterLogic.AddCinematic("IrizaDied2",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(1),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("RespawnFocusPos")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Iriza"),||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
			cinematicHelper.AddFxToPosition(|| "WBFTeleportLandFXMega" ,||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.ShowComment(|| "Iriza",|| __C(0, "Saca Screenshot plis!"), 2),
			cinematicHelper.Sleep(2),
		}),

		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied2CustomContent")),
	
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("Iriza")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_phase3_modidfier")
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_gone_modidfier")
		end),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibilityFixed(true),
	}))

encounterLogic.AddCinematic("IrizaDied2CustomContent",cinematicHelper.Cinematic({
		
	}))

return encounterLogic;
