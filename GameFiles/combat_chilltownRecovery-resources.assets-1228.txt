


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		
		 cinematicHelper.Sleep(0.6),
		 cinematicHelper.Sequence({
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		 	cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "Oh no!"), 1.2), 
		 	cinematicHelper.Sleep(1.3),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		 	cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "We're too late...."), 1.8), 
		 	cinematicHelper.Sleep(2),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll03"),"Speak")),
		 	cinematicHelper.ShowComment(|| "troll03", || __C(3, "No problem,\nwe can still fight!"), 1.8), 
		 	cinematicHelper.Sleep(1.6),
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll03"), || "Victory"),
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01"), || "Victory"),
		 	cinematicHelper.Sleep(0.4),
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll02"), || "Victory"),
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll04"), || "Victory"),
		 	cinematicHelper.Sleep(0.8),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 	cinematicHelper.ShowComment(|| "Legend", || __C(4, "Then come\nand get it!"), 1.2), 
		 	cinematicHelper.Sleep(1.8),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01")),
		 	cinematicHelper.Sleep(0.2),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll02")),
		 	cinematicHelper.Sleep(0.2),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll03")),
		 	cinematicHelper.Sleep(0.2),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll04")),
		 }),

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
