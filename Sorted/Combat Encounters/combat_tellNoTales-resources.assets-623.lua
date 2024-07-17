


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton01"), || "ReassembleIdle"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton02"), || "ReassembleIdle"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton03"), || "ReassembleIdle"),

		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),

		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(1.2),
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton01"),"ReassembleActive")),
		 		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton01")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton03"),"ReassembleActive")),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton03")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton02"),"ReassembleActive")),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton02")),
		 	}),
		 }),

		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton01"),"Reassemble")),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton01")),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton03"),"Reassemble")),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton03")),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton02"),"Reassemble")),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton02")),
		 cinematicHelper.Sleep(2),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("skeleton01","skeletonPos01", true),
		 	cinematicHelper.MoveCinematicUnit("skeleton02","skeletonPos02", true),

		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(0.8),
		 		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 		cinematicHelper.ShowComment(|| "Legend", || __C(1, "Let's put them down\nfor good!"), 2), 
		 	}),
		 }),
 		
 		cinematicHelper.Sleep(1.8),

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
