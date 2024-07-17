


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("HeroUnit"), || "Crippled"),
		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "Brrrr..."), 1.4), 
		 cinematicHelper.Sleep(1.2),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("HeroUnit")),
		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("HeroUnit"), || "Speak"),
		 cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "I could use some\nof that fur right\nnow!"), 2.8), 
		 cinematicHelper.Sleep(2.2),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("HeroUnit")),
		 cinematicHelper.Sleep(0.2),

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
