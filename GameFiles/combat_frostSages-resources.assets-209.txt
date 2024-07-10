


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),

		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01"), || "Fear"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll02"), || "Fear"),
		 cinematicHelper.Sleep(0.9),

		cinematicHelper.Sequence({
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("exalted"),"Speak")),
			 cinematicHelper.ShowComment(|| "exalted", || __C(1, "Fear not, this\nwon't hurt..."), 2), 
			 cinematicHelper.Sleep(2.4),
			 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("exalted"),"Speak")),
			 cinematicHelper.ShowComment(|| "exalted", || __C(2, "...that much."), 1.6), 
			 cinematicHelper.Sleep(1.2),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("priest01"), || "SpecialAttack"),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("priest02"), || "SpecialAttack"),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted"), || "SpellCastB"),
			 cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("morphPos01")),
			 cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("morphPos02")),
			 cinematicHelper.Sleep(2),
			 cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("morphPos01")),
			 cinematicHelper.AddFxToPosition(|| "RitualSummonFXMega", || cinematicHelper.FindCinematicPos("morphPos02")),

			 cinematicHelper.Parallel({
			 	 cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
				 cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
				 cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
				 cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			 	 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
				 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("priest01")),
				 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("priest02")),
			 }), 

			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted")),
		}),

		cinematicHelper.Sequence({
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted"), || "Angry"),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("startCameraPos")}, || 1.2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll01")),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll01")}, || "Left"),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("troll02")),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("troll02")}, || "Left"),
			
			cinematicHelper.ShowComment(|| "exalted", || __C(3, "For the Glare's\nsake!"), 1.8),  
			cinematicHelper.Sleep(2),
			cinematicHelper.ShowComment(|| "exalted", || __C(4, "Mind your own\nbusiness!"), 2), 
			cinematicHelper.Sleep(1.8),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("exalted")),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.6),
		}),

		cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),
				cinematicHelper.Sleep(0.2),
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
