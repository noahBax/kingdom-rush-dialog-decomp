


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicWastelandFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("demonLord"), || "Angry"),

		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(1, "Grrr..."), 1.2), 
		 cinematicHelper.Sleep(1.4),
		 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("demonLord")),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(2, "Let's find\nthose cultists!"), 2), 
		 cinematicHelper.Sleep(2),

		 cinematicHelper.Parallel({	
			
			cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		
		 
		 cinematicHelper.Sleep(0.4),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 1.2),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("demonLord")}, || "Left"),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(3, "Oh, for fire's sake..."), 1.6), 
		 cinematicHelper.Sleep(1.8),
		 
		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("demonLord"),"Speak")),
		 cinematicHelper.ShowComment(|| "demonLord", || __C(4, "Change of plans,\nmy minions!"), 2.4), 
		 cinematicHelper.Sleep(2.2),

		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),

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
