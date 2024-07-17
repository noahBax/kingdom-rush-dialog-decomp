


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.8),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend"), || "Speak"),
		 cinematicHelper.ShowComment(|| "Legend", || __C(1, "Out of the\nway, punks!"), 1.6), 
		 cinematicHelper.Sleep(1.2),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("Legend")),
		 cinematicHelper.Sleep(0.6),
		 
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("chieftain"), || "Speak"),
		 cinematicHelper.ShowComment(|| "chieftain", || __C(2, "We no move!"), 1.2), 
		 cinematicHelper.Sleep(1.6),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("chieftain")),

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
