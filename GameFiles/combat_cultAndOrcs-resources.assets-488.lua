

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({


	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		cinematicHelper.Sequence({	
					
					cinematicHelper.Sleep(0.6),
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
					cinematicHelper.ShowComment(|| "cultist1", || __C(1, "Any news\nof the heroes?"), 2),
					cinematicHelper.Sleep(2.2),
					cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc1"), || "Speak"),
					cinematicHelper.ShowComment(|| "orc1", || __C(2, "Yes ... they no stop."), 2),
					cinematicHelper.Sleep(2.2),
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"SpellCastA")),
					cinematicHelper.ShowComment(|| "cultist1", || __C(3, "Then make them stop!"), 2),
					cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("orc1")),
					cinematicHelper.Sleep(0.3),
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("orc1"),"TakeDamage")),
					cinematicHelper.Sleep(2.2),
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
					
					cinematicHelper.ShowComment(|| "cultist1", || __C(4, "That was your\npart of our deal."), 2.4),
		}),			
		
		cinematicHelper.Sleep(2.2),
		
		cinematicHelper.Parallel({
			cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPos2")}, || 1),
		}),

		cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.3),
				
				cinematicHelper.Sleep(0.2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
				cinematicHelper.ShowComment(|| "cultist1", || __C(5, "Here is your\nlast chance."), 2),
				cinematicHelper.Sleep(2.2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Speak")),
				cinematicHelper.ShowComment(|| "cultist1", || __C(6, "Don't fail us again!"), 1.8),
				cinematicHelper.Sleep(2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist1"),"Attack")),
				cinematicHelper.Sleep(0.8),
				cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", || cinematicHelper.FindCinematicPos("smokeFXPos")),
				cinematicHelper.KillMultipleGO(|| cinematicHelper.FindMultipleCinematicGO("cultist1")),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc1")}, || "Left"),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc2")}, || "Left"),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("orc3")}, || "Left")
		}),
			
		cinematicHelper.Sleep(0.4),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(0.1),
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
