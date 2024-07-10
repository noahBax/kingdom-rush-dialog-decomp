


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Sleep(0.4),
		 
		 cinematicHelper.Sequence({
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
			 cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "Awww..."), 1.6), 
			 cinematicHelper.Sleep(1.8),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
			 cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "Walking\nthe pups?"), 2), 
			 cinematicHelper.Sleep(1.8),
			 
			 cinematicHelper.Parallel({
			 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01"), || "Angry"),
			 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
			 }),
			 
			 cinematicHelper.ShowComment(|| "troll01", || __C(3, "Grrr..."), 1.2), 
			 cinematicHelper.Sleep(1.4),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01")),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll01"),"Speak")),
			 cinematicHelper.ShowComment(|| "troll01", || __C(4, "Get ready, boys!"), 1.8), 
			 cinematicHelper.Sleep(1.6),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf01"),"SpellCastA")),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf02"),"SpellCastA")),
			 cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
			 cinematicHelper.Sleep(0.1),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf03"),"SpellCastA")),
			 cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
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
