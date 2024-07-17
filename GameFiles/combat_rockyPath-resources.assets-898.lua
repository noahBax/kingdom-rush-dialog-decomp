


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Sleep(0.6),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("trollMain"),"Speak")),
		 cinematicHelper.ShowComment(|| "trollMain", || __C(1, "Now left!"), 1.2), 
		 cinematicHelper.Sleep(0.6),

		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll03"),"Attack")),
				 cinematicHelper.Sleep(0.5),
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll04"),"Dodge")),
			}), 
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll01"),"Attack")),
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll02"),"Dodge")),
			}),	
		 }),	
		 
		 cinematicHelper.Sleep(0.6),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("trollMain"),"Speak")),
		 cinematicHelper.ShowComment(|| "trollMain", || __C(2, "Right!"), 1.2), 
		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Parallel({

			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll02"),"Attack")),
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll01"),"Dodge")),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll04"),"Attack")),
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("troll03"),"Dodge")),
			}),	
		 }),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Parallel({
		 		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
		 }),

		 cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
		 	cinematicHelper.MoveCinematicUnit("trollMain","trollMainPos", true),
		 }),

		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("trollMain"),"Speak")),
		 cinematicHelper.ShowComment(|| "trollMain", || __C(3, "Training is over!"), 1.6), 
		 cinematicHelper.Sleep(0.8),

		 cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("troll01","trollPos01", true),
				cinematicHelper.MoveCinematicUnit("troll02","trollPos02", true),
				cinematicHelper.MoveCinematicUnit("troll03","trollPos03", true),
				cinematicHelper.MoveCinematicUnit("troll04","trollPos04", true),
		 }),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("trollMain"),"Speak")),
		cinematicHelper.ShowComment(|| "trollMain", || __C(4, "Time for\nreal fight!"), 1.6), 
		cinematicHelper.Sleep(1.2),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),

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
