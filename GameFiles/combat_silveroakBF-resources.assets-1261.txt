



local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "SilveroakBossFightDebugPanel")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightBoss")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("TURNMARKER")
			local unit = unitView.GetUnit()
			abilitiesHelper.ApplyModifier(unit, "silveroak_sbf_aspect_kill_achievements_modifier")
		 end),
		cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("MainCinematicPos")),
		cinematicHelper.CameraZoom("IN_GAME"),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("MainCinematicPos")}, || 0.1),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.Sleep(2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesMor"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerMor", || __C(1, "zzz...\nzzz...\nzzz..."), 1.5), 
		cinematicHelper.Sleep(1.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesMor"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerMor", || __C(2, "*yawns*"), 1.5), 
		cinematicHelper.Sleep(2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesMor"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerMor", || __C(3, "You got meeee\naaallll sleepy\n agaaaain!"), 2), 
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesGa"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerGa", || __C(4, "Well ...\nI was quite tired of\nyour blabbering."), 2.3), 
		cinematicHelper.Sleep(2.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesNok"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerNok", || __C(5, "Enough!"), 1), 
		cinematicHelper.Sleep(1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesNok"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerNok", || __C(6, "Don't make me\nchop down\nthis tree!"), 2.5), 
		cinematicHelper.Sleep(2.8),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.5),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 2),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.5),
				cinematicHelper.CameraZoom("cinematic"),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.MoveCinematicUnit("hero1", "heroPos1", true),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Right"),
			}),		
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero2", "heroPos2", true),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero2")}, || "Right"),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero3", "heroPos3", true),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero3")}, || "Right"),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero4", "heroPos4", true),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero4")}, || "Right"),
			})
		}),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(7, "Mór-Ga-Nok!"), 1.5), 
		cinematicHelper.Sleep(1.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(8, "Your corruption of\nSilveroak has come\nto an end!"), 2.5), 
		cinematicHelper.Sleep(2.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(9, "We've come to face you!"), 2), 
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesMor"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerMor", || __C(10, "Hey!\nYou're facing him,\nnot me..."), 2.5), 
		cinematicHelper.Sleep(2.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesMor"),"Speak")),
		cinematicHelper.ShowComment(|| "SpeakerMor", || __C(11, "...rude."), 1.5),
		cinematicHelper.Sleep(2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero2"),"Speak")),
		cinematicHelper.ShowComment(|| "hero2", || __C(12, "Oh, we didn't mean to..."), 2), 
		cinematicHelper.Sleep(1.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Left"),
		cinematicHelper.Sleep(1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(13, "Seriously?"), 1), 
		cinematicHelper.Sleep(1.5),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesMor"),"Fading")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesGa"),"Fading")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("EyesNok"),"Fading")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("EyesMor"), || "Faded"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("EyesGa"), || "Faded"),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("EyesNok"), || "Faded"),

		cinematicHelper.Sleep(1.5),
	    
		

		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("AspectInit")),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.5),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Right"),
			})
		}),
		cinematicHelper.Sleep(0.5),
		
		cinematicHelper.Sleep(0.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("AspectNok")}, || "Left"),
		cinematicHelper.Sleep(1.2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
		cinematicHelper.ShowComment(|| "AspectNok", || __C(14, "Let's kill them."), 2), 
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
		cinematicHelper.ShowComment(|| "AspectMor", || __C(15, "Oh, I juuuust woke up...."), 2),  
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
		cinematicHelper.ShowComment(|| "AspectMor", || __C(16, "Let's have\ntea and squirrels\ninstead."), 2), 
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
		cinematicHelper.ShowComment(|| "AspectNok", || __C(17, "NO!\nKILL THEM!"), 2), 
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
		cinematicHelper.ShowComment(|| "AspectGa", || __C(18, "We kill them\nand THEN have\ntea and squirrels."), 2.5), 
		cinematicHelper.Sleep(3),

		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(19, "Sounds good."), 2), 
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(20, "DEAL!"), 2), 
			})
		}),

		

		cinematicHelper.Sleep(2.5),
		
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("AspectInitTeleport")),

		cinematicHelper.Sleep(2),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("SBFArenaCenter")}, || 1),
		cinematicHelper.Sleep(2),

		cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.FinishCinematicSkip(),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Legend")}, || 0.5),
		cinematicHelper.ShowComment(|| "Legend", || __C(21, "That's the last of them."), 2), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2.5),


		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Angry"),
		cinematicHelper.ShowComment(|| "Legend", || __C(22, "Begone, evil weed!"), 2), 
		
		cinematicHelper.Sleep(1),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.1)
			}),
			cinematicHelper.Sequence({
				cinematicHelper.ShakeCamera(1.1),
			}),
		}),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
		cinematicHelper.Sleep(0.5),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
		cinematicHelper.Sleep(1),
		
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("PurifyTree")),
		cinematicHelper.Sleep(1),
		cinematicHelper.NextMusicInPlayList(),
		cinematicHelper.Sleep(1),

		
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("HeroUnit")}, || 0.5),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(23, "The Argentree..."), 1.5), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(24, "...it looks pure again!"), 2.5), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(25, "Also..."), 1.5), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.PlaySound(||"krl_sfx_combatSBF_squirrelsReturning"),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(26, "Looks like\nthe squirrels are\nreturning."), 3), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(3.1),



		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.GoodSide), || {"Victory"}),
		cinematicHelper.Sleep(1.5),
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
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5),cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("AspectGa")}, || 0.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
			cinematicHelper.ShowComment(|| "AspectGa", || __C(27, "Well.\nThat takes care\nof it."), 2.5), 
			cinematicHelper.Sleep(2.8),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5),cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("AspectNok")}, || 0.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
			cinematicHelper.ShowComment(|| "AspectNok", || __C(28, "I was just warming up."), 2.5), 
			cinematicHelper.Sleep(2.8),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5),cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("AspectMor")}, || 0.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
			cinematicHelper.ShowComment(|| "AspectMor", || __C(29, "Now ...\nwhere did I put\nthose squirrels?"), 2.5), 
			cinematicHelper.Sleep(2.8),
		})),
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowDefeated(),
	}))


encounterLogic.AddCinematic("AspectDied1Post",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("AspectDied1Post")),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5) and (cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("AspectNok")}, || "Left"),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(30, "He was annoying..."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(31, "But you will regret doing that."), 2), 
				cinematicHelper.Sleep(2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(32, "Less talking.\nMore killing!"), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Sleep(0.8),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Enchantress",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos4"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Warlock",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy01")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Trunk",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5) and (cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("AspectNok")}, || "Left"),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(33, "Hey!\nThat wasn't nice..."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(34, "PREPARE TO DIE!"), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos4"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Enchantress",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy01")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy02"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy02")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5) and (cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("AspectGa")}, || "Left"),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(35, "Well...\nMore squirrels\nfor me."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(36, "Shut up\nand wake up\nalready."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(37, "Ooo-kay.\nTime for reinforcements."), 2.5), 
				cinematicHelper.Sleep(2.8),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos4"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Warlock",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy01")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy02"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy02")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),
	}))

encounterLogic.AddCinematic("AspectDied2Post",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("AspectDied2Post")),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(38, "It's up to me, huh?"), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(39, "You should run."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Enchantress",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos4"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Enchantress",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy03"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy03")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(40, "It's a\nbattle of wits,\nthen..."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(41, "...and\nI'm at my wits'\nend!"), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Warlock",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos4"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Warlock",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy03"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy03")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Trunk",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy04"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy04")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(42, "All this fighting..."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(43, "really made me hungry."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(44, "You look tasty enough."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos1"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 0.8),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Trunk",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos2"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Trunk",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy03"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy03")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("SpawnPos3"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy04"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy04")}, || "Left"),
						cinematicHelper.Sleep(0.5),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),


	}))




encounterLogic.AddCinematic("PurifyTree",cinematicHelper.Cinematic({
		
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.InstaKillUnit("EyesMor"),
				cinematicHelper.InstaKillUnit("EyesGa"),
				cinematicHelper.InstaKillUnit("EyesNok"),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Morganok"),"Healing")),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Morganok"), || "Healed"),
				cinematicHelper.AddFxToUnit(|| "SBFMorganokHealFXMega" ,|| cinematicHelper.FindCinematicUnit("Morganok").GetUnit())
			}),
			cinematicHelper.Sequence({
				cinematicHelper.ShakeCamera(1.5),
			}),
		}),
	}))



encounterLogic.AddCinematic("AspectInit",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.EncounterLogic().encounterContext.SetInt("stageLevel", 1)),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("SpawnAspects")),
	}))

encounterLogic.AddCinematic("AspectInitTeleport",cinematicHelper.Cinematic({
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),
				cinematicHelper.UseSkillOnUnit(
					||cinematicHelper.FindCinematicUnit("AspectMor"),
					|| "sbf_aspect_teleport_cinematic" ,
					||cinematicHelper.FindCinematicUnit("AspectMor"),
					|| {}
				),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.9),
				cinematicHelper.UseSkillOnUnit(
					||cinematicHelper.FindCinematicUnit("AspectGa"),
					|| "sbf_aspect_teleport_cinematic" ,
					||cinematicHelper.FindCinematicUnit("AspectGa"),
					|| {}
				),
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1.8),
				cinematicHelper.UseSkillOnUnit(
					||cinematicHelper.FindCinematicUnit("AspectNok"),
					|| "sbf_aspect_teleport_cinematic" ,
					||cinematicHelper.FindCinematicUnit("AspectNok"),
					|| {}
				),
			}),
		}),
	}))


encounterLogic.AddCinematic("AspectDied1",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("MainCinematicPos")}, || 1),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(|| cinematicHelper.EncounterLogic().encounterContext.SetInt("stageLevel", 2)),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("SpawnAspects")),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("AspectDied1Post")),
		
	}))

encounterLogic.AddCinematic("AspectDied2",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("MainCinematicPos")}, || 1),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(|| cinematicHelper.EncounterLogic().encounterContext.SetInt("stageLevel", 3)),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("SpawnAspects")),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("AspectDied2Post")),
	}))

encounterLogic.AddCinematic("AspectShieldActivated1",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId"))}, || 1),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")),"Speak")),
		cinematicHelper.ShowComment(|| cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId"), || __C(45, "Brothers, shield me!"), 2), 
		cinematicHelper.Sleep(2),

		cinematicHelper.ConditionalIf(|| cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")).CinematicIds.Matches("AspectMor"),cinematicHelper.Sequence({
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectMor"),"Speak")),
			cinematicHelper.ShowComment(|| "AspectMor", || __C(46, "I can't die\non an empty\nstomach!"), 2), 
		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")).CinematicIds.Matches("AspectGa"),cinematicHelper.Sequence({
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectGa"),"Speak")),
			cinematicHelper.ShowComment(|| "AspectGa", || __C(47, "You'll be\nclueless\nwithout me!"), 2), 
		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")).CinematicIds.Matches("AspectNok"),cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.5),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("AspectNok"),"Speak")),
			cinematicHelper.ShowComment(|| "AspectNok",  || __C(48, "You fools\nwill regret this!"), 2), 
		})),
		cinematicHelper.Sleep(1)
	}))


encounterLogic.AddCinematic("SpawnAspects",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnNumber", 1)),
		cinematicHelper.Instant(|| cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnAfter", cinematicHelper.ActiveUnit().unitId)),
		cinematicHelper.Sequence({
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5,cinematicHelper.Sequence({
				cinematicHelper.Instant(function ()
					local level = cinematicHelper.EncounterLogic().encounterContext.GetInt("stageLevel")
					local spawnNumber = cinematicHelper.EncounterLogic().encounterContext.GetInt("aspectSpawnNumber")
					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnNumber", spawnNumber + 1)
					local spawnPosId = "aspectSpawn" .. level .. spawnNumber
					print("Spawning aspect in " .. spawnPosId)
					local spawnPos = cinematicHelper.FindCinematicPos(spawnPosId)
					local spawnAfter = cinematicHelper.EncounterLogic().encounterContext.GetInt("aspectSpawnAfter")
					local unit = cinematicHelper.SpawnUnitI(
						{
						unitId = "SBFAspectSummonnerLvl" .. level,
						position = spawnPos,
						useRawPosition = true,
						unitGroup = UnitGroup.BadSide,
						isAI = true,
						initiativeOrder = 0,
						spawnAfterUnitId = spawnAfter,
						animId = "TeleportIn",
						
						})
					if level > 1 then
						unit.stats.SetStatValue("already_attacked", 1)
					end
					cinematicHelper.PlaySoundI("krl_sfx_combatSBF_summonerTeleportIn")
					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnAfter", unit.unitId)
				end),
				cinematicHelper.Sleep(0.5)
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5,cinematicHelper.Sequence({
				cinematicHelper.Instant(function ()
					local level = cinematicHelper.EncounterLogic().encounterContext.GetInt("stageLevel")
					local spawnNumber = cinematicHelper.EncounterLogic().encounterContext.GetInt("aspectSpawnNumber")
					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnNumber", spawnNumber + 1)
					local spawnPos = cinematicHelper.FindCinematicPos("aspectSpawn" .. level .. spawnNumber)
					local spawnAfter = cinematicHelper.EncounterLogic().encounterContext.GetInt("aspectSpawnAfter")
					local unit = cinematicHelper.SpawnUnitI(
						{
						unitId = "SBFAspectMagicLvl" .. level,
						position = spawnPos,
						useRawPosition = true,
						unitGroup = UnitGroup.BadSide,
						isAI = true,
						initiativeOrder = 0,
						spawnAfterUnitId = spawnAfter,
						animId = "TeleportIn",
						
						})
					if level > 1 then
						unit.stats.SetStatValue("already_attacked", 1)
					end
					cinematicHelper.PlaySoundI("krl_sfx_combatSBF_magicalTeleportIn")
					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnAfter", unit.unitId)
				end),
				cinematicHelper.Sleep(0.5)
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5,cinematicHelper.Sequence({
				cinematicHelper.Instant(function ()
					local level = cinematicHelper.EncounterLogic().encounterContext.GetInt("stageLevel")
					local spawnNumber = cinematicHelper.EncounterLogic().encounterContext.GetInt("aspectSpawnNumber")
					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnNumber", spawnNumber + 1)
					local spawnPos = cinematicHelper.FindCinematicPos("aspectSpawn" .. level .. spawnNumber)
					local spawnAfter = cinematicHelper.EncounterLogic().encounterContext.GetInt("aspectSpawnAfter")
					local unit = cinematicHelper.SpawnUnitI(
						{
						unitId = "SBFAspectPhysicalLvl" .. level,
						position = spawnPos,
						useRawPosition = true,
						unitGroup = UnitGroup.BadSide,
						isAI = true,
						initiativeOrder = 0,
						spawnAfterUnitId = spawnAfter,
						animId = "TeleportIn",
						
						})
					if level > 1 then
						unit.stats.SetStatValue("already_attacked", 1)
					end
					cinematicHelper.PlaySoundI("krl_sfx_combatSBF_physicalTeleportIn")
					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnAfter", unit.unitId)
				end),
				cinematicHelper.Sleep(0.5)
			})),
		}),
	}))


return encounterLogic;
