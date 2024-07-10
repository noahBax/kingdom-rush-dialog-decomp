


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.Instant(function ()
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("TURNMARKER").GetUnit(), "fast_town_brawl_trolls_achievement_modifier")
		 end),

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager04"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager05"), || "Fear"),
		 cinematicHelper.Sleep(0.5),

		 cinematicHelper.Sequence({
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01"), || "Speak"),
			cinematicHelper.ShowComment(|| "troll01", || __C(1, "Move, weaklings!"), 1.8), 
			cinematicHelper.Sleep(2), 
			cinematicHelper.ShowComment(|| "troll01", || __C(2, "This town will\nbe ours!"), 2.4), 
			cinematicHelper.Sleep(2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01")),
		 }),

		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Sequence({ 
		 	 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			 cinematicHelper.ShowComment(|| "Legend", || __C(3, "Over our dead bodies!"), 2.4), 
			 cinematicHelper.Sleep(2.5),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"TakeDamage")), 
			 cinematicHelper.ShowComment(|| "hero02", || __C(4, "*gulp*"), 1.2), 
			 cinematicHelper.Sleep(1.6),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			 cinematicHelper.ShowComment(|| "Legend", || __C(5, "Figuratively,\nof course."), 1.8),  
		 	 cinematicHelper.Sleep(1.8),
		 	 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.4),
		 }),


		 
		 
		 
		 
		 
		 
		 

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
		}),
	}))



encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager04")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager04"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03"), || "Victory"),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager05")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager05"), || "Victory"),
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
		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 3, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos01"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistPriest",
								position = spawnPosition01,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist01"}
								})
						end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist01")}, || "Left"),
						cinematicHelper.Sleep(0.4),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"Speak")),
						cinematicHelper.ShowComment(|| "cultist01", || __C(6, "Surprise!"), 1.2), 
						cinematicHelper.Sleep(1),
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos02"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition02,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist02"}
								})
						end),
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos03"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition03}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition03,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist03"}
								})
						end),
						cinematicHelper.Sleep(0.4),
					})
				end),
			cinematicHelper.Wrap(function ()
					local spawnPosition04 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos04"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
								{
								unitId = "CultistAcolyte",
								position = spawnPosition04,
								unitGroup = UnitGroup.BadSide,
								isAI = true,
								initiativeOrder = 1,
								spawnFX = "SummonCultistSmokeFXMega",
								tags = {"cultist04"}
								})
						end),
						
						
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist04"),"Speak")),
						cinematicHelper.ShowComment(|| "cultist04", || __C(7, "Over here!\nHa ha ha!"), 1.6), 
						cinematicHelper.Sleep(1.2),
					})
				end),

		})),

		cinematicHelper.ConditionalIf(|| cinematicHelper.EncounterLogic().encounterContext.GetInt("turnNumber") == 5, cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos05"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),
						cinematicHelper.Instant(function ()
							abilitiesHelper.RemoveModifier(cinematicHelper.FindCinematicUnit("TURNMARKER").GetUnit(), "fast_town_brawl_trolls_achievement_modifier")
							local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "StormcloudHighSorcerer",
									position = spawnPosition01,
									unitGroup = UnitGroup.GoodSide,
									isAI = false,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"sorcerer01"}
									})
							end),
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("sorcerer01")}, || "Left"),
						cinematicHelper.Sleep(0.4),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("sorcerer01"),"Speak")),
						cinematicHelper.ShowComment(|| "sorcerer01", || __C(8, "Hold on,\nmy friends!"), 1.8), 
						cinematicHelper.Sleep(1.6),
					})
				end),
		}))
	}))

return encounterLogic;
