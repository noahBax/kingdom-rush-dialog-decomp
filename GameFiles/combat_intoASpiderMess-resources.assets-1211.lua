

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicForestFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.Parallel({
				cinematicHelper.MoveCinematicUnit("spider01", "epos01", true),
				cinematicHelper.MoveCinematicUnit("spider03", "epos03", true),
				cinematicHelper.Sequence({
					cinematicHelper.Sleep(0.8),
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.6),

				}),
		}),			

		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider02")}, || "Left"),
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("spider04")}, || "Left"),
		 
		 cinematicHelper.Parallel({
		 		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
				cinematicHelper.ShowComment(|| "hero02", || __C(1, "Remind me ...\nwhy are we here?"), 2.0),
				cinematicHelper.MoveCinematicUnit("spider02", "epos02", true),
				cinematicHelper.MoveCinematicUnit("spider04", "epos04", true),
		}),

		 cinematicHelper.Sleep(0.2),

		 cinematicHelper.Sequence({
				 cinematicHelper.Parallel({
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider01"), || "Angry"),
						cinematicHelper.ShowComment(|| "spider01", || __C(2, "hsssss!"), 1),
				}),
				 cinematicHelper.Sleep(0.6),

 				 cinematicHelper.Parallel({
						cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider04"), || "Angry"),
						cinematicHelper.ShowComment(|| "spider04", || __C(3, "hsssss!"), 1),
				}),

				 cinematicHelper.Sleep(1.2),
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
				 cinematicHelper.ShowComment(|| "hero01", || __C(4, "Because with\ngreat power..."), 2.6), 
		}),

		cinematicHelper.Sleep(2.4),

		cinematicHelper.Sequence({
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
			cinematicHelper.ShowComment(|| "hero02", || __C(5, "Please don't."), 1.8),
			cinematicHelper.Sleep(0.6),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider01")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider03")),
			cinematicHelper.Sleep(0.05),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider02")),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("spider04")),
		}),
			

		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.8),				
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
