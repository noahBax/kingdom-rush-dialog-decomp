


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Instant(function ()
							local unitView = cinematicHelper.FindCinematicUnit("barbarian02")
							local unit = unitView.GetUnit()
							abilitiesHelper.ApplyModifier(unit, "modifier_new_freeze")
						end),
		cinematicHelper.Instant(function ()
							local unitView = cinematicHelper.FindCinematicUnit("barbarian03")
							local unit = unitView.GetUnit()
							abilitiesHelper.ApplyModifier(unit, "modifier_new_freeze")
						end),

		cinematicHelper.Sleep(0.5),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("barbarian01"),"Speak")),
		cinematicHelper.ShowComment(|| "barbarian01", || __C(1, "Hurry!"), 1.2), 
		cinematicHelper.Sleep(1.4),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("barbarian01"),"Speak")),
		cinematicHelper.ShowComment(|| "barbarian01", || __C(2, "They took\nmy friends!"), 2), 
		cinematicHelper.Sleep(2.2),

		cinematicHelper.Parallel({
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1.2),
			cinematicHelper.MoveCinematicUnit("barbarian01","barbarianPos", true),
		}),

		cinematicHelper.Sleep(0.2),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian01"), || "Angry"),
		cinematicHelper.Sleep(0.2),

		cinematicHelper.Parallel({
			cinematicHelper.ShowComment(|| "barbarian01", || __C(3, "Grrr..."), 1.6), 
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			cinematicHelper.MoveCinematicUnit("troll01","trollPos01", true),
			cinematicHelper.MoveCinematicUnit("troll02","trollPos02", true),
			cinematicHelper.MoveCinematicUnit("troll03","trollPos03", true),
		}),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("barbarian01")),

		cinematicHelper.Sleep(0.2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("barbarian01"),"Speak")),
		cinematicHelper.ShowComment(|| "barbarian01", || __C(4, "You will pay,\ntusk-faces!"), 1.8), 
		cinematicHelper.Sleep(1.4),



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
