


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicSilveroakFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),
		 
		cinematicHelper.ShowComment(|| "enemy01", || __C(1, "These outsiders\njust keep on coming..."), 2.4), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy01"),"Speak")),
		cinematicHelper.Sleep(2.2),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
		 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
		 	cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
		 	cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		cinematicHelper.ShowComment(|| "Legend", || __C(2, "Get ready,\neveryone!"), 1.5), 
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(1.2),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.8),
		}),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

encounterLogic.AddCinematic("OnEndTurn",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("ENDTURN-" .. cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber"))),
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 4, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn01"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Warlock",
								position = spawnPosition01,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy01")}, || "Right"),
						cinematicHelper.Sleep(0.4),
						
						
						
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn02"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition02,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy02"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy02")}, || "Right"),
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn03"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "Vinepaw",
								position = spawnPosition03,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SilveroakSummonFXMega",
								tags = {"extraEnemy03"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("extraEnemy03")}, || "Right"),
						cinematicHelper.Sleep(0.4),
						
						
						
						
						
						
						
					})
				end),
		})),
	}))

return encounterLogic;
