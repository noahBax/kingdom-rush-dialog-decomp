


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		cinematicHelper.Sleep(0.8),
		cinematicHelper.Sequence({
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("HeroUnit"), || "Speak"),
		 	cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "How do we\nkeep getting"), 1.8), 
		 	cinematicHelper.Sleep(1.8),
		 	cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "into these\nsituations??"), 1.8), 
		 	cinematicHelper.Sleep(1.2),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("HeroUnit")),
		}),		 	

		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.2),				
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
			cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("sorcererPos01"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),
						cinematicHelper.Instant(function ()
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
					})
				end),

			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("sorcererPos02"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition02}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "StormcloudSorcerer",
									position = spawnPosition02,
									unitGroup = UnitGroup.GoodSide,
									isAI = false,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"sorcerer02"}
									})
							end),
						cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("sorcererPos01")}, || 0.8),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("sorcerer01"),"Speak")),
						cinematicHelper.ShowComment(|| "sorcerer01", || __C(3, "Heroes!\nLet us help you."), 1.8), 
						cinematicHelper.Sleep(2),
					})
				end),
		}))
	}))

return encounterLogic;
