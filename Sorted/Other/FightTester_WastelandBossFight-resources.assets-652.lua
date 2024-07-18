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

encounterLogic.AddCinematic("PossessedSpeak",cinematicHelper.Cinematic({
		cinematicHelper.Sequence({
			cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "And so do I!"), 2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		}),
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
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1CustomContentPre")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaP1P2")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied1CustomContentPost")),
			cinematicHelper.Sleep(0.5)
		}),
		cinematicHelper.UseSkillOnUnit(
				||cinematicHelper.FindCinematicUnit("Iriza"),
				|| "wbf_iriza_phase2_telegraph_cinematic" ,
				||cinematicHelper.FindCinematicUnit("Heroe"),
				|| {}
		),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("Iriza")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_gone_modidfier")
		end),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibilityFixed(true),
	}))

encounterLogic.AddCinematic("IrizaP1P2",cinematicHelper.Cinematic({
		cinematicHelper.Sequence({
			cinematicHelper.Instant(function ()
				local unitView = cinematicHelper.FindCinematicUnit("Iriza")
				local unit = unitView.GetUnit()
				abilitiesHelper.ApplyModifier(unit, "wbf_iriza_phase2_modidfier")
			end),
		}),
		cinematicHelper.Instant(function ()
			encounterLogic.encounterContext.SetFloat("irizaP1P2Complete",0.0)
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("Iriza"),
				animId = "TransitionP1P2",
				fx = "WBFIrizaTransitionFXMega",
				debugEvents = "IrizaP1P2",
				events = {
					
					AbilityEnd = function (u)
						encounterLogic.encounterContext.SetFloat("irizaP1P2Complete",1.0)
						u.PlayIdleAnimation()
						print "AbilityEnd"
					end
				}
			})
		end),
		cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("irizaP1P2Complete") > 0.5),
	}))

encounterLogic.AddCinematic("OverseerP1P2",cinematicHelper.Cinematic({
		cinematicHelper.Sequence({
			cinematicHelper.Instant(function ()
				local unitView = cinematicHelper.FindCinematicUnit("Overseer")
				local unit = unitView.GetUnit()
				abilitiesHelper.ApplyModifier(unit, "wbf_overseer_phase2_modidfier")
			end),
		}),
		cinematicHelper.Instant(function ()
			encounterLogic.encounterContext.SetFloat("overseerP1P2Complete",0.0)
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("Overseer"),
				animId = "P1P2",
				fx = "WBFOverseerTransitionFXMega",
				debugEvents = "OverseerP1P2",
				events = {
					
					AbilityEnd = function (u)
						encounterLogic.encounterContext.SetFloat("overseerP1P2Complete",1.0)
						u.PlayIdleAnimation()
						print "AbilityEnd"
					end
				}
			})
		end),
		cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("overseerP1P2Complete") > 0.5),
	}))

encounterLogic.AddCinematic("IrizaDied1CustomContentPre",cinematicHelper.Cinematic({
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "Worry not,\nyour highness!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(2.3),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.5),
				cinematicHelper.ShakeCamera(0.8),
			}),

			cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "Iriza", || __C(0, "I have\na surprise\nfor them."), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
				cinematicHelper.Sleep(2.3),
			}),
		}),
	}))

encounterLogic.AddCinematic("IrizaDied1CustomContentPost",cinematicHelper.Cinematic({
		
		
		cinematicHelper.Sleep(1.5),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "And so do I!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
				cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("OverseerP1P2")),
				
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayLoopeableSoundI("krl_sfx_combatWBF_fallingRocks_rumble_loop","rumble_sound")),
				cinematicHelper.ShakeCamera(0.8),
				cinematicHelper.Instant(|| cinematicHelper.StopLoopeableSoundI("rumble_sound")),
				cinematicHelper.CameraZoom("cinematic"),
			}),
		
		}),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.5),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),		
			cinematicHelper.Sequence({
				cinematicHelper.ShakeCamera(2.5),
			}),	
		}),
		cinematicHelper.Sleep(1.1),
		cinematicHelper.CameraZoom("IN_GAME"),
	}))

encounterLogic.AddCinematic("IrizaDied2",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(1),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("RespawnFocusPos")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Iriza"),||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
			cinematicHelper.AddFxToPosition(|| "WBFTeleportFXMega" ,||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied2CustomContentPre")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaP2P3")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied2CustomContentPost")),
			cinematicHelper.Sleep(0.5)
		}),
		cinematicHelper.UseSkillOnUnit(
				||cinematicHelper.FindCinematicUnit("Iriza"),
				|| "wbf_iriza_phase2_telegraph_cinematic" ,
				||cinematicHelper.FindCinematicUnit("Heroe"),
				|| {}
		),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("Iriza")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_gone_modidfier")
		end),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibilityFixed(true),
	}))

encounterLogic.AddCinematic("IrizaP2P3",cinematicHelper.Cinematic({
		cinematicHelper.Sequence({
			cinematicHelper.Instant(function ()
				local unitView = cinematicHelper.FindCinematicUnit("Iriza")
				local unit = unitView.GetUnit()
				abilitiesHelper.ApplyModifier(unit, "wbf_iriza_phase3_modidfier")
			end),
		}),
		cinematicHelper.Instant(function ()
			encounterLogic.encounterContext.SetFloat("irizaP2P3Complete",0.0)
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("Iriza"),
				animId = "TransitionP2P3",
				
				debugEvents = "IrizaP2P3",
				events = {
					
					AbilityEnd = function (u)
						encounterLogic.encounterContext.SetFloat("irizaP2P3Complete",1.0)
						u.PlayIdleAnimation()
						print "AbilityEnd"
					end
				}
			})
		end),
		cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("irizaP2P3Complete") > 0.5),
	}))

encounterLogic.AddCinematic("OverseerP2P3",cinematicHelper.Cinematic({
		cinematicHelper.Sequence({
			cinematicHelper.Instant(function ()
				local unitView = cinematicHelper.FindCinematicUnit("Overseer")
				local unit = unitView.GetUnit()
				abilitiesHelper.ApplyModifier(unit, "wbf_overseer_phase3_modidfier")
			end),
		}),
		cinematicHelper.Instant(function ()
			encounterLogic.encounterContext.SetFloat("overseerP2P3Complete",0.0)
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("Overseer"),
				animId = "P2P3",
				
				debugEvents = "OverseerP2P3",
				events = {
					
					AbilityEnd = function (u)
						encounterLogic.encounterContext.SetFloat("overseerP2P3Complete",1.0)
						u.PlayIdleAnimation()
						print "AbilityEnd"
					end
				}
			})
		end),
		cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("overseerP2P3Complete") > 0.5),
	}))

encounterLogic.AddCinematic("IrizaDied2CustomContentPre",cinematicHelper.Cinematic({
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "I - I - I\nfailed you!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(2.3),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "No!"), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "There is still\ngreatness\nwithin you!"), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(3.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.ShowComment(|| "Iriza",|| __C(0, "Aggghhhhhhh!!!"), 2),
		cinematicHelper.Sleep(2),

	}))

encounterLogic.AddCinematic("IrizaDied2CustomContentPost",cinematicHelper.Cinematic({
		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "THIS..."), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "ENDS..."), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(1.8),
		
		
		
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "NOW!!!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
				cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("OverseerP2P3")),
				cinematicHelper.Sleep(1.8),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayLoopeableSoundI("krl_sfx_combatWBF_fallingRocks_rumble_loop","rumble_sound")),
				cinematicHelper.ShakeCamera(0.8),
				cinematicHelper.Instant(|| cinematicHelper.StopLoopeableSoundI("rumble_sound")),
				cinematicHelper.CameraZoom("cinematic"),
			}),
		
		}),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.5),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.7),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.2),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.5),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.7),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.8),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),		
			cinematicHelper.Sequence({
				cinematicHelper.ShakeCamera(3.5),
			}),	
		}),
		cinematicHelper.Sleep(1.1),
		cinematicHelper.CameraZoom("IN_GAME"),
	}))

encounterLogic.AddCinematic("IrizaDied3",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(1),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("RespawnFocusPos")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Iriza"),||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
			cinematicHelper.AddFxToPosition(|| "WBFTeleportFXMega" ,||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied3CustomContentPre")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaP3Death")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied3CustomContentPost")),
		})
	}))


encounterLogic.AddCinematic("IrizaP3Death",cinematicHelper.Cinematic({
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("Iriza")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "wbf_iriza_phase4_modidfier")
		end),
		cinematicHelper.Instant(function ()
			encounterLogic.encounterContext.SetFloat("irizaP3DeathComplete",0.0)
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("Iriza"),
				animId = "Death",
				
				debugEvents = "IrizaP3Death",
				events = {
					
					AbilityEnd = function (u)
						encounterLogic.encounterContext.SetFloat("irizaP3DeathComplete",1.0)
						u.PlayIdleAnimation()
						u.GetUnit().states.Enable("NO_CHECK_END_FIGHT")
						print "AbilityEnd"
					end
				}
			})
		end),
		cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("irizaP3DeathComplete") > 0.5),
	}))

encounterLogic.AddCinematic("IrizaDied3CustomContentPre",cinematicHelper.Cinematic({
		cinematicHelper.Sleep(1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.ShowComment(|| "Iriza",|| __C(0, "Just as I..."), 1.5),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.ShowComment(|| "Iriza",|| __C(0, "foresaw."), 2),
		cinematicHelper.Sleep(2.5),
	}))

encounterLogic.AddCinematic("IrizaDied3CustomContentPost",cinematicHelper.Cinematic({
		cinematicHelper.Sleep(1.5),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "You think\nyou've won..."), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "but before losing..."), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Parallel({
			
			cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "I'M TAKING YOU\nWITH ME!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
				cinematicHelper.Sleep(1.8),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayLoopeableSoundI("krl_sfx_combatWBF_fallingRocks_rumble_loop","rumble_sound")),
				cinematicHelper.ShakeCamera(0.8),
				cinematicHelper.Instant(|| cinematicHelper.StopLoopeableSoundI("rumble_sound")),
				cinematicHelper.CameraZoom("cinematic"),
			}),
		
		}),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.5),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.7),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.2),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.5),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.7),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.8),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.4),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.6),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.8),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.0),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.2),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.5),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.6),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.8),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.0),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.4),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.6),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.7),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(3.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(4.1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(4.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(4.4),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(4.6),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(4.8),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(4.9),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(5.1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(5.3),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"transPos1", "transPos2","transPos3","transPos4", "transPos5","transPos6","transPos7", "transPos8","transPos9"}))),
			}),		
			cinematicHelper.Sequence({
				cinematicHelper.ShakeCamera(7),
			}),	
			
		}),
		
		
		
		
		
		
		
		
		

		
		
		
		
		
	}))

return encounterLogic;
