


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01"), || "Angry"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03"), || "Angry"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02"), || "Angry"),
		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
		 
		 

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 cinematicHelper.ShowComment(|| "hero01", || __C(1, "Uhmm..."), 1.2), 
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 cinematicHelper.ShowComment(|| "hero01", || __C(2, "Does anybody\nhave a leash?"), 2), 
		 cinematicHelper.Sleep(1.8),

		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02")),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03")),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01")),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.Parallel({
		 	 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.6),

			 cinematicHelper.Sequence({
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf02"),"SpellCastA")),
				 cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
			 }),

			 cinematicHelper.Sequence({
				 cinematicHelper.Sleep(0.3),
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf01"),"SpellCastA")),
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf03"),"SpellCastA")),
				 cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
			 }),
		 }),

		 cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.6),
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
