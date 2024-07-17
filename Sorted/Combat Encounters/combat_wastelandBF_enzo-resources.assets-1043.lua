local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "WastelandBossFightDebugPanel")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightBoss")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupWBFSounds")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("introCam")}, || 1),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.Parallel({
			
			
			
			
			
			
			cinematicHelper.MoveCinematicUnit("hero1", "heroPos1", true),
			cinematicHelper.MoveCinematicUnit("hero2", "heroPos2", true),
			cinematicHelper.MoveCinematicUnit("hero3", "heroPos3", true),

			cinematicHelper.MoveCinematicUnit("hero4", "heroPos4", true),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(2),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("introCam2")}, || 3),
			})		
		}),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero3")}, || "Left"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero2"), || "Victory"),
		cinematicHelper.ShowComment(|| "hero2", || __C(0, "We made it!"), 1.5),
		
		cinematicHelper.Sleep(1.5),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero2")),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Angry"),
		cinematicHelper.ShowComment(|| "Legend", || __C(0, "Let's end this!"), 1.5),
		
		cinematicHelper.Sleep(1.6),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Angry"),
		cinematicHelper.ShowComment(|| "Legend", || __C(0, "Nothing\nstands in\nour way!"), 2),
		
		cinematicHelper.Sleep(2.1),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
		cinematicHelper.Sleep(1),

		
		
		
		
		
		
		
		
		
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Left"),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Overseer")}, || 3.5),
			cinematicHelper.MoveCinematicUnit("hero1", "heroPos11", true),
			cinematicHelper.MoveCinematicUnit("hero2", "heroPos22", true),
			cinematicHelper.MoveCinematicUnit("hero3", "heroPos33", true),
			cinematicHelper.MoveCinematicUnit("hero4", "heroPos44", true),
		}),

		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Right"),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero2")}, || "Right"),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero3")}, || "Left"),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero4")}, || "Left"),
		cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Iriza"),||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
		cinematicHelper.AddFxToPosition(|| "WBFTeleportLandFXMega" ,||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),

		

		
		
		
		
		
		
		
		
		
		
		
		
		
		cinematicHelper.Sleep(1),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "Oh ... so naive!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(2.3),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza"), || "Angry"),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "You will not\nharm\nThe Overseer...."), 2.5),
		
		cinematicHelper.Sleep(2.8),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "Not under my watch"), 2),
		
		cinematicHelper.Sleep(2.3),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza")),
		cinematicHelper.ShowComment(|| "hero3", || __C(0, "Mind looking\nthe other way?"), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero3"),"Speak")),
		cinematicHelper.Sleep(2.0),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Right"),
		cinematicHelper.Sleep(0.8),

		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza"), || "Victory"),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "HAHAHAHAHA!"), 1.5),
		
		cinematicHelper.Sleep(1.5),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza")),
		cinematicHelper.Sleep(0.3),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "Last chance."), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "Either accept\nits ocular grace\nwithin you..."), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza"), || "Angry"),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "or I will break you!"), 2),
		cinematicHelper.Sleep(2),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza")),
		cinematicHelper.Sleep(0.5),

		cinematicHelper.ShowComment(|| "Legend", || __C(0, "You and what army?"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
		cinematicHelper.Sleep(0.8),

		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "You clearly can't see."), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(2.3),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "..."), 1),
		
		cinematicHelper.Sleep(1),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Iriza")}, || 1),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.CameraZoom("IN_GAME"),
			}),	
		}),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza"), || "Victory"),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "I am\nmy own army!"), 2),
		cinematicHelper.Sleep(2),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza")),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Sequence({	
			cinematicHelper.CameraZoom("cinematic"),
		}),	

		cinematicHelper.StartFight(),
	}))







encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.FinishCinematicSkip(),
		cinematicHelper.Sleep(1),
		cinematicHelper.SetCurtainOverWorld(false),
		cinematicHelper.ShowComic("ComicWastelandOutro"),
		cinematicHelper.StopPlayListMusic(),
		cinematicHelper.Sequence({
			cinematicHelper.Sleep(1),
			cinematicHelper.Parallel({
				cinematicHelper.FadeScreenFX(false),
				cinematicHelper.Sleep(1)
			}),
			cinematicHelper.GoToVictoryScreen(),
			cinematicHelper.WaitUntil(|| false) 
			
		})
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Overseer")}, || 1),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Overseer"), || "Victory"),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "Pathetic..."), 2.5),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowDefeated(),
		cinematicHelper.ShowMoveForwardButton(),
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
		cinematicHelper.Sleep(0.5),
		cinematicHelper.ShowComment(|| "Iriza", || __C(0, "Worry not,\nyour highness!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"Speak")),
		cinematicHelper.Sleep(2.3),
		cinematicHelper.Parallel({
			
			
			
			

			cinematicHelper.Sequence({
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza"), || "Angry"),
				cinematicHelper.ShowComment(|| "Iriza", || __C(0, "I have\na surprise\nfor them."), 2),
				cinematicHelper.Sleep(2),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Iriza")),
				cinematicHelper.Sleep(0.3),
			}),
		}),
	}))

encounterLogic.AddCinematic("IrizaDied1CustomContentPost",cinematicHelper.Cinematic({
		
		
		cinematicHelper.Sleep(1.5),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
				cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "And so do I!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
				cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("OverseerP1P2")),
				cinematicHelper.NextMusicInPlayList(),
				
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
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied2CustomContentPre")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaP2P3")),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("IrizaDied2CustomContentPost")),
			cinematicHelper.Sleep(0.5)
		}),
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
				
				fx = "WBFIrizaTransitionFXMega",
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
				
				fx = "WBFOverseerTransitionFXMega",
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
		cinematicHelper.Sleep(2),
		
		cinematicHelper.Sleep(1),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "No!"), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "There is still\ngreatness\nwithin you!"), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(3.8),
		
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.NextMusicInPlayList(),
		cinematicHelper.ShowComment(|| "Iriza",|| __C(0, "Arrrggghhhhhhh!!!"), 2),
		cinematicHelper.Sleep(2),
		
		cinematicHelper.Sleep(0.3),

	}))

encounterLogic.AddCinematic("IrizaDied2CustomContentPost",cinematicHelper.Cinematic({
		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "THIS..."), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "ENDS..."), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(1.8),
		
		
		
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "NOW!!!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
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
		
	}))

encounterLogic.AddCinematic("IrizaDied3",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(1),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("RespawnFocusPos")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Iriza"),||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Iriza")}, || "Left"),
			cinematicHelper.AddFxToPosition(|| "WBFTeleportLandFXMega" ,||cinematicHelper.FindCinematicPos("IrizaRespawnPos")),
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
				
				fx = "WBFIrizaTransitionFXMega",
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
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "but before losing..."), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Parallel({
			
			cinematicHelper.Sequence({
				cinematicHelper.ShowComment(|| "OverseerSpeaker", || __C(0, "I'M TAKING YOU\nWITH ME!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Overseer"),"Speak")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Iriza"),"SpeakPossessed")),
				cinematicHelper.Sleep(1.8),
				cinematicHelper.Parallel({
					cinematicHelper.Sequence({
						cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero4"),
							cinematicHelper.Sequence({
								cinematicHelper.Sleep(0.3),
								cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero4"), || "Fear"),
							 })),
						cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero1"),
							cinematicHelper.Sequence({
								cinematicHelper.Sleep(0.3),
								cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero1"), || "Fear"),
							 })),
						cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero2"),
							cinematicHelper.Sequence({
								cinematicHelper.Sleep(0.3),
								cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero2"), || "Fear"),
							 })),
						cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero3"),
							cinematicHelper.Sequence({
								cinematicHelper.Sleep(0.3),
								cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero3"), || "Fear"),
							 })),
						}),
					}),
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
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("outroCam")}, || 1),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos1"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudHighSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				isFlipped= true,
				spawnFX = "SummonCultistSmokeFXMega",
				tags = {"outroHighSorcerer"}
				})
		end),
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("outroCam")}, || 0.8),
				cinematicHelper.Sleep(0.3),
				
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"Speak")),
				cinematicHelper.ShowComment(|| "outroHighSorcerer", || __C(0, "We have to\nget you out of\nhere!"), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"Speak")),
				cinematicHelper.ShowComment(|| "outroHighSorcerer", || __C(0, "Hurry up!\nBefore it is\ntoo late!"), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.PlaySound(||"krl_sfx_combatBF_win"),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.ShakeCamera(7),
			}),
		}),

		cinematicHelper.Parallel({
			cinematicHelper.Parallel({
				cinematicHelper.Sequence({
					cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero4"),
						cinematicHelper.Sequence({
							cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero4")),
						 })),
					cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero1"),
						cinematicHelper.Sequence({
							cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero1")),
						 })),
					cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero2"),
						cinematicHelper.Sequence({
							cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero2")),
						 })),
					cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero3"),
						cinematicHelper.Sequence({
							cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("hero3")),
						 })),
					}),
				}),
			cinematicHelper.Sequence({
				
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("outroCam")}, || 0.8),
				cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
											 	 || {cinematicHelper.FindCinematicPos("outroCam"), 
											 	     cinematicHelper.FindCinematicPos("outroCam"), 
											 	     cinematicHelper.FindCinematicPos("outroCam"), 
											 	     cinematicHelper.FindCinematicPos("outroCam")},
											 	 || true),
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero4"),
					cinematicHelper.Sequence({
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero4"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero4")),
					 })),
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero1"),
					cinematicHelper.Sequence({
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero1"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero1")),
					 })),
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero2"),
					cinematicHelper.Sequence({
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero2"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero2")),
					 })),
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero3"),
					cinematicHelper.Sequence({
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero3"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero3")),
					 })),
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
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				
				
				cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Parallel({
					
					
					
					
					
					
					
					
					cinematicHelper.Sequence({
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("outroHighSorcerer")),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("outroHighSorcerer"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
					}),
					cinematicHelper.Sequence({
						cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("outroCam")),
						cinematicHelper.Sleep(1),
						
						
						
						
					}),
				}),
					
			}),	

		}),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Overseer")}, || 0.35),
		cinematicHelper.ForceGrabCameraControl(),
	}))

return encounterLogic;




		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	








































































