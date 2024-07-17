


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Speak"),
		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.ShowComment(|| "villager01", || __C(1, "...then, at the next\ncrossroads, you -"), 2.4), 
		 cinematicHelper.Sleep(2.2),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),
		 cinematicHelper.Sleep(0.2),
		 
		 cinematicHelper.Parallel({
		 	cinematicHelper.ShakeCamera(0.4),
		 	cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("legend") != nil), cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("legend"),"TakeDamage"))),
		 	cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("hero01") != nil), cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"TakeDamage"))),
		 	cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("hero02") != nil), cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"TakeDamage"))),
		 	cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("hero03") != nil), cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero03"),"TakeDamage"))),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("villager01"),"TakeDamage")),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("villager02"),"TakeDamage")),
		 }),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager04"), || "Fear"),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager05"), || "Fear"),
		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.ShowComment(|| "villager02", || __C(2, "L-L-LOOK!"), 1.6), 
		 cinematicHelper.Sleep(1.6),
	 	 cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("legend") != nil), cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("legend")}, || "Right")),
	 	 cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("hero02") != nil), cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Right")),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("hero03") != nil), cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero03")}, || "Right")),
	 	 cinematicHelper.ConditionalIf(||(cinematicHelper.FindCinematicUnit("hero01") != nil), cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Right")),
		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Parallel({	
			cinematicHelper.MoveCinematicUnit("yeti01", "yetiPos01", true),
			cinematicHelper.MoveCinematicUnit("yeti02", "yetiPos02", true),
			cinematicHelper.MoveCinematicUnit("yeti03", "yetiPos03", true),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		}),

		 cinematicHelper.Sleep(0.4),

		 cinematicHelper.Sequence({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "Get ready, everyone!"), 2.4), 
			cinematicHelper.Sleep(2),
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 }),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
		}),
	}))



encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager04")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager04"), || "Victory"),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager03"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Victory"),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager05")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager05"), || "Victory"),
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))


return encounterLogic;
