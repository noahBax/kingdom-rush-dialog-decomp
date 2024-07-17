


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
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02"), || "Angry"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03"), || "Angry"),
		 
		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		 cinematicHelper.ShowComment(|| "hero02", || __C(1, "Well, it could\nbe worse."), 2), 
		 cinematicHelper.Sleep(2.2),

		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01")),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf02"),"SpellCastA")),
		 cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
		 cinematicHelper.Sleep(0.5),

		 cinematicHelper.Parallel({	
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
			cinematicHelper.MoveCinematicUnit("troll01", "trollPos01", true),
			cinematicHelper.MoveCinematicUnit("troll02", "trollPos02", true),
		 }),

		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02")),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03")),

		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 cinematicHelper.ShowComment(|| "hero01", || __C(2, "You had to talk..."), 1.8), 
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.5),

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
