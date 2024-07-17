


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("soldier01"),
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier01"), || "Angry")
		 ),
		 cinematicHelper.Sleep(0.1),
		  cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("soldier02"),
		 	cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier02"), || "Angry")
		 ),

		cinematicHelper.Sleep(0.8),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.8),

		cinematicHelper.Sequence({	
			cinematicHelper.ConditionalIfElse(|| cinematicHelper.UnitExists("soldier02"),
			
			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("soldierMain"),"Speak")),
				cinematicHelper.ShowComment(|| "soldierMain", || __C(1, "Just in time!"), 1.8), 
				cinematicHelper.Sleep(2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.ShowComment(|| "Legend", || __C(2, "Let's show them."), 1.8), 
				cinematicHelper.Sleep(1.6),
			}),

			cinematicHelper.Sequence({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("soldierMain"),"Speak")),
				cinematicHelper.ShowComment(|| "soldierMain", || __C(3, "My friends..."), 1.6), 
				cinematicHelper.Sleep(1.8),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldierMain"), || "Angry"),
				cinematicHelper.ShowComment(|| "soldierMain", || __C(4, "YOU WILL PAY!"), 1.2), 
				cinematicHelper.Sleep(1.4),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
				cinematicHelper.ShowComment(|| "Legend", || __C(5, "We got your back!"), 1.5), 
				cinematicHelper.Sleep(1.4),
			})),
		}),

		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldierMain")),
		cinematicHelper.Sleep(0.1),

		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("soldier01"),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier01"))
		 ),

		 cinematicHelper.Sleep(0.1),
		  cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("soldier02"),
		 	cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("soldier02"))
		 ),


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
