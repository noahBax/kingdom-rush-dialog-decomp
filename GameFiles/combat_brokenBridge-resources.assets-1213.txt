


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		cinematicHelper.Parallel({
			
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		}),

		cinematicHelper.Sequence({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.6),

			cinematicHelper.Parallel({
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("exalted01"),"Speak")),
				cinematicHelper.ShowComment(|| "exalted01", || __C(1, "Going somewhere?"), 1.6), 
				cinematicHelper.MoveCinematicUnit("cultist01","cultistPos01", true),
				cinematicHelper.MoveCinematicUnit("cultist02","cultistPos02", true),
				cinematicHelper.MoveCinematicUnit("cultist03","cultistPos03", true),
				cinematicHelper.MoveCinematicUnit("cultist04","cultistPos04", true),
			}),
		}),
		

		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("troll01","trollPos01", true),
			cinematicHelper.MoveCinematicUnit("troll02","trollPos02", true),
			cinematicHelper.MoveCinematicUnit("troll03","trollPos03", true),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.6),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos03")}, || 1),
			}),
		}),

		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.ShowComment(|| "Legend", || __C(2, "Let's do this."), 1.6), 


		cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),				
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
