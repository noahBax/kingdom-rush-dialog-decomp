


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Angry"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03"), || "Fear"),

		 
		
		
		
		
		
		 
		 
		 
		 
		 
		 

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier01"), || "Crippled"),
		 cinematicHelper.Sleep(0.05),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier03"), || "Crippled"),
		 cinematicHelper.Sleep(0.05),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier02"), || "Crippled"),

		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll02"),"Speak")),
		 cinematicHelper.ShowComment(|| "troll02", || __C(1, "You still fighting, huh?"), 2.4), 
		 cinematicHelper.Sleep(3),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll02"),"Speak")),
		 cinematicHelper.ShowComment(|| "troll02", || __C(2, "... cute."), 1.6), 
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier02")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier02"), || "Angry"),


		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 	
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 }),

		 cinematicHelper.Sequence({
		 	
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "Hey, punks!"), 2), 
			cinematicHelper.Sleep(1.4),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll07")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll04")}, || "Left"),
			cinematicHelper.Sleep(0.4),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll05")}, || "Left"),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll08")}, || "Left"),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll06")}, || "Left"),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(4, "Let's even the\nnumbers...."), 2),  
			cinematicHelper.Sleep(2.2),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(5, "Shall we?"), 1.6), 
			cinematicHelper.Sleep(1.2),

			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier01")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01")),
			cinematicHelper.Sleep(0.1),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier02")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll02")),
			cinematicHelper.Sleep(0.1),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier03")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll03")),

			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),


		 }),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
		}),
	}))


encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Sleep(0.8),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03"), || "Victory"),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Fear"),
		cinematicHelper.ShowDefeated(),
	}))















































return encounterLogic;
