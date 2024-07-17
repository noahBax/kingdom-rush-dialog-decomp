

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "KrumDebugPanel")
	cinematicHelper.InstantiateGenericPrefab("KrumAudienceController", "KrumAudienceController")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupKrumSounds")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicForestFightKrum")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("TURNMARKER")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "orc_cleaver_unlock_achievement_trait_modifier")
		 end),
		 cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "PlayAudience", "default")),
	     cinematicHelper.SetCinematicBarsVisibility(true),
	     cinematicHelper.CameraZoom("cinematic"),
	     

		 cinematicHelper.SetCurtain(true),
		 
		 
		 
		 
		 
		 
		 
		 
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("cameraPos2")),
		 
		 
		 
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
					cinematicHelper.MoveCinematicUnit("villager1", "introEnemyPos1", true),
			}),	
			cinematicHelper.Sequence({	
					cinematicHelper.MoveCinematicUnit("villager2", "introEnemyPos2", true),
			}),	
			cinematicHelper.Sequence({	
					cinematicHelper.MoveCinematicUnit("villager3", "introEnemyPos3", true),
			}),	
			cinematicHelper.Sequence({	
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 3),
			}),	
		 }),
		 
		
		 
		 

		 
		 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		 


		


		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.CameraZoom("IN_GAME"),
			}),
			cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("hero1","heroSpawn1", true),
				cinematicHelper.MoveCinematicUnit("hero2","heroSpawn2", true),
				cinematicHelper.MoveCinematicUnit("hero3","heroSpawn3", true),
				cinematicHelper.MoveCinematicUnit("hero4","heroSpawn4", true),
			}),
			cinematicHelper.Sequence({
				 cinematicHelper.Sleep(1),
				 
				cinematicHelper.ShowComment(|| "villager2", || __C(1, "The adventurers\nare coming!"), 2),
				
				cinematicHelper.Sleep(2.3),

				cinematicHelper.ShowComment(|| "Krum", || __C(2, "You've failed to\nstop my enemies!"), 2),

				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.5),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum"), || "Angry"),
				cinematicHelper.PlayUnitSound(|| "Krum", || "howl"),
				cinematicHelper.ShowComment(|| "Krum", || __C(3, "That can't go\nunpunished!"), 2),

				
				cinematicHelper.Sleep(2.5),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Attack")),
				cinematicHelper.PlayUnitSound(|| "Krum", || "roar"),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(function ()
					local unitView = cinematicHelper.FindCinematicUnit("telegraphFake")
					local unit = unitView.GetUnit()
					abilitiesHelper.ApplyModifier(unit, "krum_targets_modifier")
				 end),
				
				cinematicHelper.Sleep(0.5),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager1"), || "Fear"),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager2"), || "Angry"),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager3"), || "Fear"),
				cinematicHelper.ShowComment(|| "villager2", || __C(4, "Wait!"), 1),
				
				cinematicHelper.Sleep(1.3),
				cinematicHelper.ShowComment(|| "villager2", || __C(5, "We go back\nand capture!"), 2),
				
				cinematicHelper.Sleep(2.3),
				
				
				cinematicHelper.ShowComment(|| "Krum", || __C(6, "Too late..."), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.8),
			}),
			
		}),	

		
		 
		 
		 
		 
		 cinematicHelper.ShowComment(|| "Krum", || __C(7, "Thunderbolt!"), 1.5),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
		 cinematicHelper.Sleep(1.8),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"SpecialAttack")),

		 cinematicHelper.Sleep(0.5),
		 cinematicHelper.AddFxToPosition(|| "KrumLightningStrikeFXMega", || cinematicHelper.getUnitPositionFromView(cinematicHelper.FindCinematicUnit("villager2"))),
		 cinematicHelper.KillUnit("telegraphFake", true),
		 cinematicHelper.Sleep(0.5),
		 cinematicHelper.KillUnit("villager1", false),
		 cinematicHelper.KillUnit("villager2", false),
		 cinematicHelper.KillUnit("villager3", false),
		 cinematicHelper.Sleep(2),
		 cinematicHelper.ShowComment(|| "Krum", || __C(8, "Bwa-ha-ha!"), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),

		
		
		
		


		
		
		cinematicHelper.CameraZoom("cinematic"),
		
		cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.4),
			cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart1")),
			
			cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle4") ),
			cinematicHelper.ShakeCamera(0.1),
			
			cinematicHelper.Parallel({
				cinematicHelper.Parallel({
					cinematicHelper.MoveCinematicUnit("hero1","heroPos1", true),
					cinematicHelper.MoveCinematicUnit("hero2","heroPos2", true),
					cinematicHelper.MoveCinematicUnit("hero3","heroPos3", true),
					cinematicHelper.MoveCinematicUnit("hero4","heroPos4", true),
				}),
				cinematicHelper.Sequence({
					cinematicHelper.Parallel({
						cinematicHelper.Sequence({
							
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart2")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle5") ),
							cinematicHelper.ShakeCamera(0.1),
							
						}),	
						cinematicHelper.Sequence({
							
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart3")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel2") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle2") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle3") ),
							cinematicHelper.ShakeCamera(0.1),
							
						}),	
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(0.5),
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart4")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle1") ),
							cinematicHelper.KillUnit("introGoblin3", false),
							cinematicHelper.ShakeCamera(0.1),
							
							
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart5")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle7") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel3") ),
							cinematicHelper.KillUnit("introGoblin2", false),
							cinematicHelper.ShakeCamera(0.1),
							
							
						}),
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(0.7),
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart6")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel1") ),
							cinematicHelper.ShakeCamera(0.1),
							
						}),	
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(0.6),
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart7")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel5") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle8") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle15") ),
							cinematicHelper.KillUnit("introGoblin1", false),
							cinematicHelper.ShakeCamera(0.1),
							
							
						}),	
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(0.8),
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart8")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle6") ),
							cinematicHelper.ShakeCamera(0.1),
							
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart9")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel4") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle9") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle10") ),
							cinematicHelper.ShakeCamera(0.1),
							
						}),
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(1),
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart10")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel7") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle11") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle12") ),
							cinematicHelper.ShakeCamera(0.1),
							
						}),
						cinematicHelper.Sequence({
							cinematicHelper.Sleep(1),
							cinematicHelper.AddFxToPosition(|| "KrumWoodBreakFXMega", || cinematicHelper.FindCinematicPos("introPart11")),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("barrel6") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle13") ),
							cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("obstacle14") ),
							cinematicHelper.ShakeCamera(0.1), 	
							
							
						}),	
					}),
				}),
			}),
			
			
		}),

		
		


		
		
		
		
		
		
		
		
		
		cinematicHelper.Sequence({

				cinematicHelper.SpawnCinematicUnit("OrcWarrior", cinematicHelper.FindCinematicPos("orcSpawn6"), {"orc6"}, "Idle"),

				cinematicHelper.ShowComment(|| "Krum", || __C(9, "I'm glad you've\nmade it this far."), 2),

				cinematicHelper.SpawnCinematicUnit("OrcChampion", cinematicHelper.FindCinematicPos("orcSpawn1"), {"orc1"}, "Idle"),

				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.3),

				cinematicHelper.SpawnCinematicUnit("OrcShaman", cinematicHelper.FindCinematicPos("orcSpawn2"), {"orc2"}, "Idle"),

				cinematicHelper.ShowComment(|| "Krum", || __C(10, "But..."), 0.8),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(0.9),

				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum"), || "Angry"),
				cinematicHelper.PlayUnitSound(|| "Krum", || "howl"),
				cinematicHelper.Sleep(0.2),
				cinematicHelper.ShowComment(|| "Krum", || __C(11, "You shall not pass!"), 2),
				cinematicHelper.Sleep(2),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum")),
				cinematicHelper.Sleep(0.3),
				cinematicHelper.SpawnCinematicUnit("OrcWarrior", cinematicHelper.FindCinematicPos("orcSpawn3"), {"orc3"}, "Idle"),

				cinematicHelper.ShowComment(|| "Legend", || __C(12, "Come down\nand face us!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.Sleep(2.3),

				cinematicHelper.SpawnCinematicUnit("OrcArcher", cinematicHelper.FindCinematicPos("orcSpawn4"), {"orc4"}, "Idle"),


				cinematicHelper.ShowComment(|| "Krum", || __C(13, "Ha!"), 1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.3),

				cinematicHelper.SpawnCinematicUnit("OrcArcher", cinematicHelper.FindCinematicPos("orcSpawn5"), {"orc5"}, "Idle"),


				cinematicHelper.ShowComment(|| "Krum", || __C(14, "And deny my clan\na show?"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),

				
				
				
				
				
				
				cinematicHelper.SpawnCinematicUnit("OrcArcher", cinematicHelper.FindCinematicPos("orcSpawn7"), {"orc7"}, "Idle"),
				cinematicHelper.FromCinematicToUnit("orc1",UnitGroup.BadSide),
				cinematicHelper.FromCinematicToUnit("orc2",UnitGroup.BadSide),
				cinematicHelper.FromCinematicToUnit("orc3",UnitGroup.BadSide),
				cinematicHelper.FromCinematicToUnit("orc4",UnitGroup.BadSide),
				cinematicHelper.FromCinematicToUnit("orc5",UnitGroup.BadSide),
				cinematicHelper.FromCinematicToUnit("orc6",UnitGroup.BadSide),
				cinematicHelper.FromCinematicToUnit("orc7",UnitGroup.BadSide),

				cinematicHelper.Sleep(2.5),
		}),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Left"),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero2")}, || "Left"),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero3")}, || "Left"),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero4")}, || "Left"),
		cinematicHelper.PlayUnitSound(|| "Krum", || "victory"),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 1),
		cinematicHelper.Parallel({
			
			
			
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc1", "enemyPos1", true),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc2", "enemyPos2", true),
			}),		
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc3", "enemyPos3", true),
			}),		
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc4", "enemyPos4", true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc5", "enemyPos5", true),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc6", "enemyPos6", true),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("orc7", "enemyPos7", true),
			}),	
			cinematicHelper.Sequence({	
				
				
			}),		
		}),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc1"), || "Angry"),
		
		cinematicHelper.ShowComment(|| "orc1", || __C(15, "Clan demands\nblood!"), 2),
		cinematicHelper.Sleep(1.6),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc1")),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
		
		cinematicHelper.ShowComment(|| "Krum", || __C(16, "And Krum'Thak\ngives blood\nto clan!"), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
		cinematicHelper.Sleep(2.7),

		
		
				
				
		
		
		

		
		
		
		
		cinematicHelper.ShowComment(|| "Legend", || __C(18, "Come and get it!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 0.4),
		
		
		
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibility(true);
		cinematicHelper.StartFight(),
		cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		


		
		
		
		
		
		
		
		
		



		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		cinematicHelper.FinishCinematicSkip(),
		
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Legend")}, || 0.5),
		
		
		
		cinematicHelper.NextMusicInPlayList(),
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.ShowComment(|| "Legend", || __C(19, "Krum'Thak's\nreign of terror\nis over!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2.5),

		cinematicHelper.ShowComment(|| "Legend", || __C(20, "Time to continue\nour adventure!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.ShowComment(|| "Legend", || __C(21, "Our adventure..."), 1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(1),
		
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.Sleep(0.5),
		
		
		
		cinematicHelper.ShowComment(|| "Legend", || __C(22, "HAS JUST BEGUN!"), 2),
		
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2),
		
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.GoodSide), || {"Victory"}),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.Parallel({
			
			
			
			
			
			

			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.Parallel({
					cinematicHelper.FadeScreenFX(false),
					cinematicHelper.Sleep(1)
				}),
				cinematicHelper.GoToVictoryScreen(),
				cinematicHelper.WaitUntil(|| false) 

				
			}),
		}),
		
		
		
		
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		
		cinematicHelper.PlayUnitSound(|| "Krum", || "victory"),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 0.5),
		cinematicHelper.ShowComment(|| "Krum", || __C(23, "Sad..."), 1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "Krum", || __C(24, "I was\nstarting to\nhave fun."), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.PlayUnitSound(|| "Krum", || "victory"),
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

encounterLogic.AddCinematic("KrumFocus",cinematicHelper.Cinematic({
		
		
		
		cinematicHelper.ConditionalIfElse(|| cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") > 0.5,cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
			}),
		cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.5)
			})
		),
	}))

encounterLogic.AddCinematic("KrumDialog",cinematicHelper.Cinematic({
		
		
		cinematicHelper.FinishCinematicSkip(),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum"), || "Angry"),
		cinematicHelper.PlayUnitSound(|| "Krum", || "howl"),
		cinematicHelper.ShowComment(|| "Krum", || __C(25, "Thunderbolt!"), 1),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum")),
		
		cinematicHelper.Sleep(0.4),
		cinematicHelper.PlayUnitSound(|| "Krum", || "cheer")
		
		
		
		
		
	}))

encounterLogic.AddCinematic("KrumDialogGoDown",cinematicHelper.Cinematic({
		
		
		
		cinematicHelper.FinishCinematicSkip(),
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum"), || "Angry"),
		cinematicHelper.PlayUnitSound(|| "Krum", || "howl"),
		cinematicHelper.ShowComment(|| "Krum", || __C(26, "Enough!"), 1.2),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Krum")),
		
		
		cinematicHelper.Sleep(0.2)
	}))

encounterLogic.AddCinematic("KrumFinishedLightning",cinematicHelper.Cinematic({
		
		

		cinematicHelper.ConditionalIfElse(|| cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 1.5,cinematicHelper.Sequence({
				
				
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(27, "It's time\nto call..."), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.5),
				cinematicHelper.ShowComment(|| "Krum", || __C(28, "My true allies!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.5),
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),

					})
				end),

				cinematicHelper.Sleep(0.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),

					})
				end),
				
				cinematicHelper.PlayUnitSound(|| "Krum", || "victory"),
				cinematicHelper.Sleep(0.5),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(29, "Shocking, huh?"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.8),
				cinematicHelper.ShowComment(|| "Krum", || __C(30, "And now,\nI shall have..."), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "Krum", || __C(31, "my own fun!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.5),
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibilityFixed(true),
			})
		),
		cinematicHelper.ConditionalIfElse(|| (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") > 2.5) and (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 3.5),cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(32, "Abomination,\nI choose you!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.8),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"SpawnPos1", "SpawnPos2","SpawnPos3"})))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAbomination",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				cinematicHelper.Sleep(0.5)
				
			})
		),
		cinematicHelper.ConditionalIfElse(|| (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") > 4.5) and (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 5.5),cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(33, "Unblinded,\nopen their eyes!"), 2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				cinematicHelper.Sleep(0.5)

			})
		),
		cinematicHelper.ConditionalIfElse(|| (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") > 5.5) and (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 6.5),cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(34, "Get them!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.8),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"SpawnPos1", "SpawnPos2","SpawnPos3"})))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAbomination",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				cinematicHelper.Sleep(0.5)
			})
		),
		cinematicHelper.ConditionalIfElse(|| (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") > 7.5) and (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 8.5),cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(35, "Fulfill\nyour end of\nthe deal!"), 2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(2.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				cinematicHelper.Sleep(0.5)
			})
		),
		cinematicHelper.ConditionalIfElse(|| (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") > 8.5) and (cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 9.5),cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
				cinematicHelper.ShowComment(|| "Krum", || __C(36, "Last chance!"), 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
				cinematicHelper.Sleep(1.8),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"SpawnPos1", "SpawnPos2","SpawnPos3"})))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAbomination",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				
				cinematicHelper.PlayUnitSound(|| "Krum", || "cheer"),
				cinematicHelper.Sleep(0.5)
			})
		)
	}))
		


return encounterLogic;
