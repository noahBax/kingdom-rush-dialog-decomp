


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("cameraPos01")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Angry"),
		 
		 
		 cinematicHelper.Sleep(1),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(1, "First those\npesky demons"), 1.8), 
		 cinematicHelper.Sleep(2),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(2, "and now these\ndamned heroes?"), 1.8), 
		 cinematicHelper.Sleep(1.8),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),
		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"SpellCastA")),
		 cinematicHelper.ShowComment(|| "cultist01", || __C(3, "Just leave us\nalone!"), 1.8), 
		 cinematicHelper.Sleep(2),


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
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 2, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("demonPos01"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "DemonSpawn",
								position = spawnPosition01,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"demon01"}
								})
						end),
						cinematicHelper.Sleep(0.4),
					})
				end),

			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("demonPos02"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "DemonSpawn",
								position = spawnPosition02,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"demon02"}
								})
						end),
						cinematicHelper.Sleep(0.4),

					})
				end),

			cinematicHelper.Wrap(function ()
					local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("demonPos03"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "DemonSpawn",
								position = spawnPosition03,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"demon03"}
								})
						end),
						cinematicHelper.Sleep(0.4),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demon01"),"Speak")),
						cinematicHelper.ShowComment(|| "demon01", || __C(4, "We're back!"), 1.2), 
						cinematicHelper.Sleep(1.2),
					})
				end),
		}))
	}))

return encounterLogic;
