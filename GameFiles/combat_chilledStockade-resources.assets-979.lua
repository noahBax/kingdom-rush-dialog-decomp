


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),


		cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
				cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		cinematicHelper.Sequence({
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("chieftain"), || "Speak"),
				cinematicHelper.ShowComment(|| "chieftain", || __C(1, "STOP!"), 1.8), 
				cinematicHelper.Sleep(2),
				cinematicHelper.ShowComment(|| "chieftain", || __C(2, "Ha'kraj rule\nhere now!"), 1.2), 
				cinematicHelper.Sleep(1),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("chieftain")),
		}),

		cinematicHelper.Sequence({
			cinematicHelper.Sleep(0.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "Not for long!"), 2), 
			cinematicHelper.Sleep(1.8),
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
