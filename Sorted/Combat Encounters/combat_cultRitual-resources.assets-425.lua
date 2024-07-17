

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({


	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		cinematicHelper.Sleep(0.6),
		cinematicHelper.Sequence({	
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
			cinematicHelper.ShowComment(|| "cultist1", || __C(1, "Everything\nis set for\nthe ritual."), 2.6),
			cinematicHelper.Sleep(2.8),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist2"),"Speak")),
			cinematicHelper.ShowComment(|| "cultist2", || __C(2, "We shall become\nunstoppable!"), 2),
			cinematicHelper.Sleep(2.2),
		}),

		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos1")}, || 0.8),
		}),

		cinematicHelper.Sleep(0.2),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 0.8),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist1"), || "Angry"),
		}),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.Sequence({	
			cinematicHelper.ShowComment(|| "cultist1", || __C(3, "Seriously?"), 1.2),
			cinematicHelper.Sleep(1.5),
			cinematicHelper.ShowComment(|| "cultist1", || __C(4, "We should\nfire our\nguards..."), 2.2),
			cinematicHelper.Sleep(2.2),
			cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 0.8),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("cultist1")),
			}),
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
