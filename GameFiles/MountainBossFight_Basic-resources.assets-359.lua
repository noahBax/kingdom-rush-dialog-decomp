local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.ShowComment(|| "HarbingerBoss", || "Noooooo!", 3),
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


encounterLogic.AddCinematic("AnimTest",cinematicHelper.Cinematic({
		cinematicHelper.Instant(function ()
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("HeroUnit"),
				animId = "SpecialAttack",
				fx = "MagicBoltCastFXMega",
				events = {
					
					AbilityAction = function (u)
						cinematicHelper.FireProjectileI({
							projectile = "ArcaneTowerSuperBeamRayProjectile",
							source = cinematicHelper.UnitAttachPos(u,"CastPoint"),
							target = cinematicHelper.FindCinematicPos("cameraPos2"),
							onReached = || print("TEST_FINISHED")
						})
					end
				}
			})
		end)
		
	}))

encounterLogic.AddCinematic("SpawnTest",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")}, || 1),
		cinematicHelper.Wrap(function ()
			local spawnPosition = cinematicHelper.FindCinematicPos("cameraPos2")
			return cinematicHelper.Sequence({
				cinematicHelper.Instant(function ()
					local unit = cinematicHelper.SpawnUnitI(
						{
						unitId = "MBFUlgukHai",
						position = spawnPosition,
						unitGroup = UnitGroup.BadSide,
						tags = {"UlgukHaiBoss"},
						spawnFX = "MBFIceBreakExplosionFXMega",
						animId = "Spawn"
						})
				end),
				cinematicHelper.Sleep(3),
				cinematicHelper.Sequence({	
					cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("UlgukHaiBoss"), || cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("UlgukHaiSpawnPos")), || true),
				}),
			})
		end),
		
	}))

encounterLogic.AddCinematic("TowerFireTest",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("HarbingerTransitionPosition")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("shootIce", 0)),
			cinematicHelper.UseSkillOnUnit(
				||cinematicHelper.FindCinematicUnit("GlareTower"),
				|| "mbf_glare_tower_break_ice_attack" ,
				||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
				|| { onHit = || encounterLogic.encounterContext.SetFloat("shootIce", 1) }
			),
			cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("shootIce") == 1.0),
		}),
		cinematicHelper.Sleep(5)
	}))

encounterLogic.AddCinematic("EndingTest",cinematicHelper.Cinematic({
		
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("outroCam")}, || 1),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos1"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudHighSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				spawnFX = "SummonCultistSmokeFXMega",
				tags = {"outroHighSorcerer"}
				})
		end),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos2"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				spawnFX = "SummonCultistSmokeFXMega",
				tags = {"outroSorcerer1"}
				})
		end),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos3"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				spawnFX = "SummonCultistSmokeFXMega",
				isFlipped= true,
				tags = {"outroSorcerer2"}
				})
		end),
		cinematicHelper.Sleep(2),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("outroHighSorcerer")}, || 0.8),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.PlaySound(||"krl_sfx_combatBF_win"),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"Speak")),
			cinematicHelper.ShowComment(|| "outroHighSorcerer", || __C(39, "We can help\nwith that!"), 2), 
		}),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"Speak")),
		cinematicHelper.ShowComment(|| "outroHighSorcerer", || __C(40, "Get in the portal!"), 1.5), 
		cinematicHelper.Sleep(2),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("outroCam")}, || 0.8),
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Legend"),
					cinematicHelper.Sequence({
						cinematicHelper.MoveCinematicUnit("Legend", "portalPos", true),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Legend"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("Legend")),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero02"),
					cinematicHelper.Sequence({
						cinematicHelper.MoveCinematicUnit("hero02", "portalPos", true),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero02"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero02")),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero03"),
					cinematicHelper.Sequence({
						cinematicHelper.MoveCinematicUnit("hero03", "portalPos", true),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero03"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero03")),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero04"),
					cinematicHelper.Sequence({
						cinematicHelper.MoveCinematicUnit("hero04", "portalPos", true),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero04"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
						cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero04")),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				cinematicHelper.AddFxToPosition(|| "PortalSorceressFXMega", || cinematicHelper.FindCinematicPos("portalPos")),
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				
				cinematicHelper.Sleep(1),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"SpellCastA")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"SpecialAttack")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"SpecialAttack")),
				
				cinematicHelper.Sleep(1),
				
			}),	
		}),
	}))

encounterLogic.AddCinematic("HarbingerDiedCast",cinematicHelper.Cinematic({
		cinematicHelper.Instant(function ()
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("HarbingerBoss"),
				animId = "Morph",
				
				debugEvents = "HARBINGERMORPH",
				events = {
					
					AbilityEnd = function (u)
						cinematicHelper.FireProjectileI({
							projectile = "MBFHarbingerMorphProjectile",
							source = cinematicHelper.UnitAttachPos(u,"CastPoint"),
							target = cinematicHelper.UnitAttachPos(cinematicHelper.FindCinematicUnit("GlareTower"),"GemPos"),
							onReached = || encounterLogic.encounterContext.SetFloat("harbingerReachedTower", 1)
						})
						if encounterLogic.encounterContext.GetFloat("harbingerShouldDie") == 1.0  then
							cinematicHelper.InstaKillUnitI("HarbingerBoss")
						end
					end
				}
			})
		end),
	}))

encounterLogic.AddCinematic("UlgukUnfreeze",cinematicHelper.Cinematic({
		cinematicHelper.Wrap(function ()
			local spawnPosition = cinematicHelper.FindCinematicUnitPos("UlgukHaiOnIce")
			local isFlipped = cinematicHelper.UnitIsFlipped("UlgukHaiOnIce")
			return cinematicHelper.Sequence({
				cinematicHelper.Sequence({
					cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("breakIce", 0)),
					cinematicHelper.UseSkillOnUnit(
						||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
						|| "mbf_ulgukhai_break_crystal" ,
						||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
						function ()
							return {
								onAction = function ()
									cinematicHelper.InstaKillUnitI("UlgukHaiOnIce")
									local unit = cinematicHelper.SpawnUnitI(
										{
										unitId = "MBFUlgukHai",
										position = spawnPosition,
										unitGroup = UnitGroup.BadSide,
										tags = {"UlgukHaiBoss"},
										spawnFX = "MBFIceBreakExplosionFXMega",
										isFlipped = isFlipped,
										animId = "Spawn",
										events = {
											AbilityEnd = function (u)
												encounterLogic.encounterContext.SetFloat("breakIce", 1)
											end
										}
									})
								end
							}
						end
					),
					
				}),
				cinematicHelper.Parallel({
						cinematicHelper.Sequence({	
							cinematicHelper.CameraZoom("IN_GAME"),
						}),
						cinematicHelper.Sequence({	
							cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosTransition")}, || 1),
						}),
				}),
				cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("breakIce") == 1.0),
			})
		end)
	}))
	

encounterLogic.AddCinematic("HarbingerDied",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		cinematicHelper.Sleep(1),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("HarbingerTransitionPosition")}, || 1),
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("HarbingerBoss"),||cinematicHelper.FindCinematicPos("HarbingerTransitionPosition")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HarbingerBoss")}, || "Left"),
			cinematicHelper.AddFxToPosition(|| "MBFTeleportFXMega" ,||cinematicHelper.FindCinematicPos("HarbingerTransitionPosition")),
			cinematicHelper.ShowComment(|| "HarbingerBoss",|| __C(0, "Yipee ka yay mfers"), 2),
			cinematicHelper.Sleep(2),
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("harbingerReachedTower", 0)),
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("harbingerShouldDie", 1)),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("HarbingerDiedCast")),
			cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("harbingerReachedTower") == 1.0),
		}),
		cinematicHelper.Sequence({
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("shootIce", 0)),
			cinematicHelper.UseSkillOnUnit(
				||cinematicHelper.FindCinematicUnit("GlareTower"),
				|| "mbf_glare_tower_break_ice_attack" ,
				||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
				|| { onHit = || encounterLogic.encounterContext.SetFloat("shootIce", 1) }
			),
			cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("shootIce") == 1.0),
		}),

		cinematicHelper.Sleep(0.3),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("UlgukUnfreeze")),
		
		cinematicHelper.Sleep(2),
		
		cinematicHelper.ShowComment(|| "UlgukHaiBoss", || "Wraaaaa!!!", 3),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibilityFixed(true),
	}))

encounterLogic.AddCinematic("GlareTowerFocus",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("TowerGlareCameraCenter")}, || 1),
		cinematicHelper.ReleaseCameraControl(),
	}))

encounterLogic.AddCinematic("HarbingerFocus",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("HarbingerBoss")}, || 1),
		
		cinematicHelper.ReleaseCameraControl()
	}))

encounterLogic.AddCinematic("UlgukHaiFocus",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("UlgukHaiBoss")}, || 1),
		
		cinematicHelper.ReleaseCameraControl()
	}))


return encounterLogic;
