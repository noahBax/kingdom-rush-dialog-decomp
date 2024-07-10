


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton01"), || "ReassembleIdle"),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton02"), || "ReassembleIdle"),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton03"), || "ReassembleIdle"),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton04"), || "ReassembleIdle"),
		 }),

		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),

			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.8),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.ShowComment(|| "Legend", || __C(1, "Wait!"), 1.6), 
				cinematicHelper.Sleep(2),
			}),
		}),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(2, "Something feels\noff here...."), 2.4), 
		 cinematicHelper.Sleep(2.6),

		 cinematicHelper.Sequence({
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton01"),"Reassemble")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton01")),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton03"),"Reassemble")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton03")),
			 cinematicHelper.Sleep(0.2),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton02"),"Reassemble")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton02")),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("skeleton04"),"Reassemble")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("skeleton04")),
		 }), 

		 cinematicHelper.Sleep(1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 cinematicHelper.ShowComment(|| "hero01", || __C(3, "Uh-oh..."), 1.6), 
		 cinematicHelper.Sleep(1.4),

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
