local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "SilveroakBossFightDebugPanel")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightBoss")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("MainCinematicPos")),
		cinematicHelper.CameraZoom("IN_GAME"),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "zzz...\nzzz...\nzzz..."), 1.5),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "*yawns*"), 1.5),
		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "You got meeee\naaallll sleepy\n agaaaain!"), 2),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "Well...\nI was quite tired of\nyour blabbering."), 2.3),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "Enough!"), 1),
		cinematicHelper.Sleep(1.3),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "Don't make me\nchop down\nthis tree!"), 2.5),
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
		cinematicHelper.ShowComment(|| "Legend", || __C(0, "Mór-Ga-Nok!"), 1.5),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(0, "Your corruption of\nSilveroak has come\nto an end!"), 2.5),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(0, "We've come to face you!"), 2),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "Hey!\nYou're facing him,\nnot me..."), 2.5),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.ShowComment(|| "Morganok", || __C(0, "...rude."), 1.5),
		cinematicHelper.Sleep(2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero2"),"Speak")),
		cinematicHelper.ShowComment(|| "hero2", || __C(0, "Oh we didn't mean to..."), 2),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero1")}, || "Left"),
		cinematicHelper.Sleep(1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(0, "Seriously?"), 1),
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
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("AspectNok")}, || "Left"),
		cinematicHelper.Sleep(1.2),

		cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "Let's kill them."), 2),
		cinematicHelper.Sleep(2.5),
		
		cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Oh, I juuuust woke up..."), 2),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Let's have\ntea and squirrels\ninstead."), 2),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "NO!\nKILL THEM!."), 2),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "We kill them\nand THEN have\ntea and squirrels."), 2.5),
		cinematicHelper.Sleep(3),

		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Sounds good."), 2),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "DEAL!"), 2),
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
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5),cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("AspectGa")}, || 0.5),
			cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "Well.\nThat takes care\nof it."), 2.5),
			cinematicHelper.Sleep(2.8),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5),cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("AspectNok")}, || 0.5),
			cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "I was just warming up."), 2.5),
			cinematicHelper.Sleep(2.8),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5),cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("AspectMor")}, || 0.5),
			cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Now...\nwhere did I put\nthose squirrels?"), 2.5),
			cinematicHelper.Sleep(2.8),
		})),
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowDefeated(),
		cinematicHelper.ShowMoveForwardButton(),
	}))


encounterLogic.AddCinematic("AspectDied1Post",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("AspectDied1Post")),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5) and (cinematicHelper.UnitStat("Morganok","aspect_magic",0) > 0.5),cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "He was annoying..."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "But you will regret doing that."), 2),
				cinematicHelper.Sleep(2.5),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "Less talking.\nMore killing!"), 2),
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
								spawnFX = "SummonCultistSmokeFXMega"
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
								spawnFX = "SummonCultistSmokeFXMega",
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
								spawnFX = "SummonCultistSmokeFXMega"
								})
						end),
					})
				end),
				cinematicHelper.Sleep(0.6),
		})),
		cinematicHelper.ConditionalIf(|| (cinematicHelper.UnitStat("Morganok","aspect_physical",0) > 0.5) and (cinematicHelper.UnitStat("Morganok","aspect_summoner",0) > 0.5),cinematicHelper.Sequence({
				
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Hey!\nThat wasn't nice..."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "PREPARE TO DIE!"), 2),
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
								spawnFX = "SummonCultistSmokeFXMega",
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
								spawnFX = "SummonCultistSmokeFXMega"
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
								spawnFX = "SummonCultistSmokeFXMega",
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
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Well...\nMore squirrels\nfor me."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "Shut up\nand wake up\nalready."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "Ooo-kay.\nTime for reinforcements."), 2.5),
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
								spawnFX = "SummonCultistSmokeFXMega",
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
								spawnFX = "SummonCultistSmokeFXMega"
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
								spawnFX = "SummonCultistSmokeFXMega",
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
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos3")}, || 1),
				cinematicHelper.Sleep(1),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "It's up to me, huh?"), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectNok", || __C(0, "You should run."), 2),
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
								spawnFX = "SummonCultistSmokeFXMega"
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
								spawnFX = "SummonCultistSmokeFXMega",
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
				cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "It's a\nbattle of the wits\nthen..."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "...and\nI'm at my wits\nend!"), 2),
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
								spawnFX = "SummonCultistSmokeFXMega",
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
								spawnFX = "SummonCultistSmokeFXMega",
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
								spawnFX = "SummonCultistSmokeFXMega",
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
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "All this fighting..."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "really made me hungry."), 2),
				cinematicHelper.Sleep(2.3),
				cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "You look tasty enough."), 2),
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
								spawnFX = "SummonCultistSmokeFXMega"
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
								spawnFX = "SummonCultistSmokeFXMega",
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
								unitId = "Vinepaw",
								position = spawnPosition,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
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
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("AspectDied1Post")),
		
	}))

encounterLogic.AddCinematic("AspectDied2",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("MainCinematicPos")}, || 1),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.Instant(|| cinematicHelper.EncounterLogic().encounterContext.SetInt("stageLevel", 3)),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("SpawnAspects")),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("AspectDied2Post")),
	}))

encounterLogic.AddCinematic("AspectShieldActivated1",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId"))}, || 1),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.ShowComment(|| cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId"), || __C(0, "Aspects ASSEMBLE!"), 2),
		cinematicHelper.Sleep(2),
		cinematicHelper.ConditionalIf(|| cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")).CinematicIds.Matches("AspectMor"),cinematicHelper.Sequence({
			cinematicHelper.ShowComment(|| "AspectMor", || __C(0, "To Mor!"), 2),
		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")).CinematicIds.Matches("AspectGa"),cinematicHelper.Sequence({
			cinematicHelper.ShowComment(|| "AspectGa", || __C(0, "To Ga!"), 2),
		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.FindCinematicUnit(cinematicHelper.EncounterLogic().encounterContext.GetObject("aspectShieldActivatedUnitCinematicId")).CinematicIds.Matches("AspectNok"),cinematicHelper.Sequence({
			cinematicHelper.ShowComment(|| "AspectNok",  || __C(0, "To Nok!"), 2),
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

					cinematicHelper.EncounterLogic().encounterContext.SetInt("aspectSpawnAfter", unit.unitId)
				end),
				cinematicHelper.Sleep(0.5)
			})),
		}),
	}))


return encounterLogic;
