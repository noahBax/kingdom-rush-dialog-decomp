


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		
		 cinematicHelper.Parallel({
			 cinematicHelper.MoveCinematicUnit("highSorcerer01","highSorcererPos", true),
			 cinematicHelper.Sequence({
					cinematicHelper.Sleep(0.8),
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.8),
				}),
		}),

		cinematicHelper.Sequence({
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted"), || "Speak"),		
			cinematicHelper.ShowComment(|| "exalted", || __C(1, "Coming back for\nmore, old man?"), 2.6), 
			cinematicHelper.Sleep(2.2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted")),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("highSorcerer01"),"Speak")),
			cinematicHelper.ShowComment(|| "highSorcerer01", || __C(2, "You've defeated\nme once."), 2.4), 
			cinematicHelper.Sleep(2.6),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("highSorcerer01"),"Speak")),
			cinematicHelper.ShowComment(|| "highSorcerer01", || __C(3, "But this time..."), 1.8), 
			cinematicHelper.Sleep(2),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("highSorcerer01"), || "Victory"),	
			
			cinematicHelper.ShowComment(|| "highSorcerer01", || __C(4, "I'm not alone!"), 1.6), 
			cinematicHelper.Sleep(1.4),

			cinematicHelper.Parallel({
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted"), || "Angry"),	
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1.2),
			}),

			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("highSorcerer01")),
			cinematicHelper.Wrap(function ()
					local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("sorcererPos"))
					return cinematicHelper.Sequence({
						cinematicHelper.CameraLooksAtPositions(|| {spawnPosition}, || 1),
						cinematicHelper.Instant(function ()
							local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "StormcloudSorcerer",
									position = spawnPosition,
									unitGroup = UnitGroup.GoodSide,
									isAI = false,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"sorcerer01"}
									})
							end),
						cinematicHelper.Sleep(0.8)
					})
				end),

			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted")),
			cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
				cinematicHelper.MoveCinematicUnit("exalted","exaltedPos", true),
			}),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("exalted")}, || "Left"),
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
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))


return encounterLogic;
