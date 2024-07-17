local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "KrumDebugPanel")
	cinematicHelper.InstantiateGenericPrefab("KrumAudienceController", "KrumAudienceController")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupKrumSounds")
	
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "PlayAudience", "default")),
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "StopSound")),
		cinematicHelper.PlayUnitSound(|| "Krum", || "defeat"),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "StopSound")),
		cinematicHelper.PlayUnitSound(|| "Krum", || "victory"),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
		cinematicHelper.ShowMoveForwardButton(),
	}))


encounterLogic.AddCinematic("KrumFocus",cinematicHelper.Cinematic({
		
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Krum")}, || 1),
	}))

encounterLogic.AddCinematic("KrumDialog",cinematicHelper.Cinematic({
		
		
		cinematicHelper.Sleep(1),
		cinematicHelper.ShowComment(|| "Krum", || "Hi!", 3),
		cinematicHelper.PlayUnitSound(|| "Krum", || "roar"),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
		cinematicHelper.Sleep(2)
	}))

encounterLogic.AddCinematic("KrumDialogGoDown",cinematicHelper.Cinematic({
		
		
		cinematicHelper.Sleep(1),
		cinematicHelper.ShowComment(|| "Krum", || "Bye!", 3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Krum"),"Speak")),
		cinematicHelper.Sleep(2)
	}))



encounterLogic.AddCinematic("KrumTriggerLightning",cinematicHelper.Cinematic({
		
		
		cinematicHelper.Sleep(1),
		cinematicHelper.ShowComment(|| "Krum", || "BOOM!", 3),
		cinematicHelper.ShakeCamera(1),
		cinematicHelper.Sleep(1)

	}))

encounterLogic.AddCinematic("KrumSelectLightning",cinematicHelper.Cinematic({
		
		
		cinematicHelper.Sleep(1),
		cinematicHelper.ShowComment(|| "Krum", || "Cargandoooo!", 3),
		cinematicHelper.Sleep(2)
	}))

encounterLogic.AddCinematic("KrumFinishedLightning",cinematicHelper.Cinematic({
		
		

		cinematicHelper.ConditionalIfElse(|| cinematicHelper.FindCinematicUnit("Krum").GetUnit().stats.GetStatValue("downIteration") < 1.5, cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "PlayAudience", "angry")),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"CustomSpawnPos1", "CustomSpawnPos2", "CustomSpawnPos3"})))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnCinematicUnitI("CultistAcolyte", spawnPosition)
							cinematicHelper.FromCinematicToUnitI(unit,UnitGroup.BadSide)
							cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition)
						end),
					})
				end),
				cinematicHelper.Sleep(3)
			}),
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "PlayAudience", "angry")),
				cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"CustomSpawnPos1", "CustomSpawnPos2", "CustomSpawnPos3"})))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnCinematicUnitI("CultistAbomination", spawnPosition)
							cinematicHelper.FromCinematicToUnitI(unit,UnitGroup.BadSide)
							cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition)
						end),
					})
				end),
				cinematicHelper.Sleep(3)
			})
		)
	}))

return encounterLogic;
