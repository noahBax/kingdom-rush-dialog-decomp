

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicForestFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider1"), || "Angry"),
		 cinematicHelper.Sleep(0.6),

		cinematicHelper.Parallel({

				cinematicHelper.ShowComment(|| "peasant", || __C(1, "Eaaasy, girl!"), 1.6),
				cinematicHelper.Sleep(1.8),
				
				cinematicHelper.Sequence({
					cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("spider2"), || cinematicHelper.FindCinematicPos("enemyPos2"), || true),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider2"), || "Angry")
				}),

				cinematicHelper.Sequence({
					cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("spider3"), || cinematicHelper.FindCinematicPos("enemyPos3"), || true),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider3"), || "Angry"),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider3")}, || "Right")
				}),

				cinematicHelper.Sequence({
					cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("spider4"), || cinematicHelper.FindCinematicPos("enemyPos4"), || true),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider4"), || "Angry"),
					cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider4")}, || "Right")
				}),
				
		}),
		cinematicHelper.Sleep(0.6),
						
						
		
		cinematicHelper.ShowComment(|| "peasant", || __C(2, "I'm not\nas tasty as\nI look."), 2),
		cinematicHelper.Sleep(2),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 1.2),
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(3, "Just in time!"), 1.8),
		cinematicHelper.Sleep(1.6),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 0.8),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider1")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider3")}, || "Left"),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider2")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider4")}, || "Left"),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider1")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider2")),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider3")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider4")),
		}),

		cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.2),				

		}),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("peasant"), || "Victory"),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

return encounterLogic;
