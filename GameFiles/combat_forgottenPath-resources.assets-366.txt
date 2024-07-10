


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		
		 cinematicHelper.Sleep(0.5),

		 cinematicHelper.Sequence({
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Speak"),
			 cinematicHelper.ShowComment(|| "cultist01", || __C(1, "And remember..."), 1.6), 
			 cinematicHelper.Sleep(1.8),
			 cinematicHelper.ShowComment(|| "cultist01", || __C(2, "if anything\nhappens to the\nobelisk"), 2.4), 
			 cinematicHelper.Sleep(2.6),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"SpellCastA")),
			 cinematicHelper.ShowComment(|| "cultist01", || __C(3, "you will pay\nwith your lives!"), 2), 
			 cinematicHelper.Sleep(2.2),
			 cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", || cinematicHelper.FindCinematicPos("smokeFXPos")),
			 cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("cultist01")),
		}),

		 cinematicHelper.Parallel({
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		 cinematicHelper.Sequence({
		 	 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll02")}, || "Left"),
		 	 cinematicHelper.Sleep(0.2),
		 	 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll02"),"Speak")),
			 cinematicHelper.ShowComment(|| "troll02", || __C(4, "Uh oh..."), 1.2), 
			 cinematicHelper.Sleep(0.8),
			 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll01")}, || "Left"),
			 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll03")}, || "Left"),
			 cinematicHelper.Sleep(0.8),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll02"),"Speak")),
			 cinematicHelper.ShowComment(|| "troll02", || __C(5, "Let's get 'em!"), 1.6), 
		 }),

		 cinematicHelper.Sleep(1.4),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),

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
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("cameraPos02"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistExalted",
								position = spawnPosition01,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist01")}, || "Right"),
						cinematicHelper.Sleep(0.4),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"Speak")),
						cinematicHelper.ShowComment(|| "cultist01", || __C(6, "What's\ngoing on?!"), 1.8), 
						cinematicHelper.Sleep(1.2),
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos02"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition02,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist02"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist02")}, || "Right"),
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos03"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition03,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist03"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist03")}, || "Right"),
						cinematicHelper.Sleep(0.4),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"SpellCastA")),
						cinematicHelper.ShowComment(|| "cultist01", || __C(7, "Argh!\nThose idiots!"), 2), 
						cinematicHelper.Sleep(1.6),
						
						
						
						
					})
				end),
		})),
	}))

return encounterLogic;
