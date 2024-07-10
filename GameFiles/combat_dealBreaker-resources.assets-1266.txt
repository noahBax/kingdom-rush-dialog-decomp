


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		 cinematicHelper.Instant(function ()
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("villager01").GetUnit(), "villager_survives_dealbreaker_achievement_modifier")
		 end),

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.5),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(1, "So ... do we have\na deal?"), 2), 
		 cinematicHelper.Sleep(2.2),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("villager01"),"Speak")),
		 cinematicHelper.ShowComment(|| "villager01", || __C(2, "I - I - I..."), 1.2),	
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("villager01")}, || "Left"),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("villager01"),"Speak")),
		 cinematicHelper.ShowComment(|| "villager01", || __C(3, "I'll think about it!"), 1.4), 
		 cinematicHelper.Sleep(1.4),

		 cinematicHelper.Sequence({
			 cinematicHelper.MoveCinematicUnit("villager01","villagerPos", true),
			 cinematicHelper.Parallel({
			 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
				cinematicHelper.ShowComment(|| "demonLord", || __C(4, "YOU'RE GOING\nNOWHERE!!!"), 2), 
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("villager01"),"TakeDamage")),
			 }),
		 }),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Fear"),
		 cinematicHelper.Sleep(1.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"SpellCastB")),

		 cinematicHelper.Sequence({
	 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
		 	cinematicHelper.Wrap(function ()
					local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn01"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition01)
							local unit = cinematicHelper.SpawnCinematicUnitI("DemonSpawn", spawnPosition01)
							cinematicHelper.FromCinematicToUnitI(unit,UnitGroup.BadSide)
							cinematicHelper.Sleep(0.8)
						end),
					})
			end),
		 	cinematicHelper.Sleep(0.2),

			cinematicHelper.Wrap(function ()
					local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn02"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition02)
							local unit = cinematicHelper.SpawnCinematicUnitI("DemonSpawn", spawnPosition02)
							cinematicHelper.FromCinematicToUnitI(unit,UnitGroup.BadSide)
							cinematicHelper.Sleep(0.8)
						end),
					})
			end),
			cinematicHelper.Sleep(0.2),

			cinematicHelper.Wrap(function ()
					local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("enemySpawn03"))
					return cinematicHelper.Sequence({
						
						cinematicHelper.Instant(function ()
							cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition03)
							local unit = cinematicHelper.SpawnCinematicUnitI("DemonFlareon", spawnPosition03)
							cinematicHelper.FromCinematicToUnitI(unit,UnitGroup.BadSide)
							cinematicHelper.Sleep(0.8)
						end),
					})
			end),
		 }),

		 cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(5, "Leave him alone!"), 2), 
		 cinematicHelper.Sleep(1.8),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),


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
