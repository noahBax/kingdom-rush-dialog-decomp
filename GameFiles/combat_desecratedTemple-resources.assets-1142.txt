


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.Parallel({
				
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),

				cinematicHelper.Sequence({
					cinematicHelper.Sleep(0.6),
		 			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
				}),
			}),
		 cinematicHelper.Sequence({
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(1, "Stop right there!"), 1.8),	
			cinematicHelper.Sleep(1.6),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist01")}, || "Left"),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("abomination01")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("abomination02")}, || "Left"),
			cinematicHelper.Sleep(0.1),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01"), || "Angry"),
			cinematicHelper.ShowComment(|| "cultist01", || __C(2, "How did you\nget here?"), 2), 
			cinematicHelper.Sleep(2.2),
			cinematicHelper.SpawnCinematicUnit("CultistAcolyte", cinematicHelper.FindCinematicPos("cultistPos01"), {"cultist02"}, "Idle"),
			cinematicHelper.SpawnCinematicUnit("CultistAcolyte", cinematicHelper.FindCinematicPos("cultistPos02"), {"cultist03"}, "Idle"),
			cinematicHelper.SpawnCinematicUnit("CultistAcolyte", cinematicHelper.FindCinematicPos("cultistPos03"), {"cultist04"}, "Idle"),
			cinematicHelper.Sleep(0.1),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist03"), || "Crippled"),
		 }),

		 cinematicHelper.Parallel({
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1),
			 cinematicHelper.MoveCinematicUnit("cultist02","cultistPos04", true),
			 cinematicHelper.MoveCinematicUnit("cultist04","cultistPos05", true),
		 }),

 		cinematicHelper.Sequence({
			 cinematicHelper.ShowComment(|| "cultist03", || __C(3, "S-s-sorry, boss..."), 1.6), 
			 cinematicHelper.Sleep(1.8),
			 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
			 cinematicHelper.ShowComment(|| "cultist01", || __C(4, "I'll deal\nwith you later...."), 2), 
			 cinematicHelper.Sleep(1.8),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist01")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist03")),
		}),

 		cinematicHelper.FromCinematicToUnit("cultist02",UnitGroup.BadSide),
 		cinematicHelper.FromCinematicToUnit("cultist03",UnitGroup.BadSide),
 		cinematicHelper.FromCinematicToUnit("cultist04",UnitGroup.BadSide),


 		
		 
		 


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
