

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetTeamUnitsStartPosition(),
	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
				cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
			 								 || cinematicHelper.GetHeroTeamSpawnPositions(),
			 								 || true),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 3),
 			}),	
			
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(4.0),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf03"),"Angry")),
				cinematicHelper.Sleep(2.0),
				cinematicHelper.Parallel({
					cinematicHelper.MoveCinematicUnit("wolf07", "ePos07", true),
					cinematicHelper.Sequence({
						cinematicHelper.Sleep(0.5),
						cinematicHelper.MoveCinematicUnit("wolf06", "ePos06", true),
					}),	
					cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wolf02"),"Angry")),
					cinematicHelper.Sequence({
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("wolf05")}, || "Left"),
						cinematicHelper.Sleep(0.2),
					}),	
				}),	
			}),	
		}),

		cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "Let the hunt begin!"), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
		cinematicHelper.Sleep(1.2),
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

encounterLogic.AddCinematic("OnEndTurn6",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("HeroUnit")}, || 2),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "Wait! What is that howl?!"), 3),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos2")},|| 1.5),
		cinematicHelper.Sequence({
			cinematicHelper.SpawnCinematicUnit("Warg", cinematicHelper.FindCinematicPos("wargPos1"), {"EnemyUnit", "Warg"}, "SpellCastA"),
			cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("Warg"), || cinematicHelper.FindCinematicPos("wargPos2"), || false),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Warg"),"Angry")),
		}),
		cinematicHelper.FromCinematicToUnit("Warg",UnitGroup.BadSide),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("HeroUnit"), cinematicHelper.FindCinematicUnitPos("Warg")}, || 2),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(3, "Uh-oh! Mommy is here..."), 3),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.SetCinematicBarsVisibility(false)
}))

return encounterLogic;
