


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.8),
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
			}),
		 }),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Speak"),
		 cinematicHelper.ShowComment(|| "Legend", || __C(1, "Out of the way,\nfiends!"), 2), 
		 cinematicHelper.Sleep(2.4),
		 cinematicHelper.ShowComment(|| "Legend", || __C(2, "Our world is\nat stake!"), 2.4), 
		 cinematicHelper.Sleep(1.8),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
		 cinematicHelper.Sleep(1),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(3, "Oh, really?"), 1.6), 
		 cinematicHelper.Sleep(2),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(4, "I couldn't\ncare less."), 2.4), 
		 cinematicHelper.Sleep(2),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"SpellCastC")),
		 cinematicHelper.Sleep(0.8),


		 cinematicHelper.Sequence({
	 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 	cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn01"))
					return cinematicHelper.Sequence({
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "DemonHound",
								position = spawnPosition01,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "DemonicDuplicationSummonFXMega",
								tags = {"demon01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("demon01")}, || "Right"),
					})
			end),
		 	cinematicHelper.Sleep(0.2),

			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn02"))
					return cinematicHelper.Sequence({
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "DemonSpawn",
								position = spawnPosition02,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "DemonicDuplicationSummonFXMega",
								tags = {"demon02"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("demon02")}, || "Right"),
					})
			end),
		 }),
		 
		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(5, "So be it, then."), 1.8), 
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


return encounterLogic;
