

local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicForestFightInside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.Parallel({
					cinematicHelper.Sequence({	
						cinematicHelper.AddFxToPosition(|| "GenericReviveFXMega", || cinematicHelper.FindCinematicPos("heroPos1")),
						cinematicHelper.AddFxToPosition(|| "GenericReviveFXMega", || cinematicHelper.FindCinematicPos("heroPos2")),
						cinematicHelper.AddFxToPosition(|| "GenericReviveFXMega", || cinematicHelper.FindCinematicPos("heroPos3")),
						cinematicHelper.AddFxToPosition(|| "GenericReviveFXMega", || cinematicHelper.FindCinematicPos("heroPos4")),
						
					}),
				}),
 			}),	
		}),

		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(1, "What?"), 1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(1.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HeroUnit")}, || "Left"),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HeroUnit")}, || "Right"),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HeroUnit")}, || "Left"),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(2, "Where are we?"), 1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(1.8),
		cinematicHelper.ShowComment(|| "Legend", || __C(3, "We shouldn't\nhave messed with\nthat book."), 2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		cinematicHelper.Sleep(2.8),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(4, "It can't get\nany worse\nthan this..."), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(3),
		cinematicHelper.ShakeCamera(1),

		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos1"), {"Zombie1"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie1",UnitGroup.BadSide),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.3),
				cinematicHelper.SpawnCinematicUnit("ZombieWarrior", cinematicHelper.FindCinematicPos("enemyPos2"), {"Zombie2"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie2",UnitGroup.BadSide),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.5),
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos3"), {"Zombie3"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie3",UnitGroup.BadSide),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Zombie3")}, || "Left"),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.7),
				cinematicHelper.SpawnCinematicUnit("ZombieWarrior", cinematicHelper.FindCinematicPos("enemyPos4"), {"Zombie4"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie4",UnitGroup.BadSide),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Zombie4")}, || "Left"),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.2),
				cinematicHelper.SpawnCinematicUnit("ZombieWarrior", cinematicHelper.FindCinematicPos("enemyPos5"), {"Zombie5"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie5",UnitGroup.BadSide),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Zombie5")}, || "Left"),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.9),
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos6"), {"Zombie6"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie6",UnitGroup.BadSide),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.4),
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos7"), {"Zombie7"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie7",UnitGroup.BadSide),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Zombie4")}, || "Left"),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.6),
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos8"), {"Zombie8"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie8",UnitGroup.BadSide),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.3),
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos9"), {"Zombie9"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie9",UnitGroup.BadSide),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Zombie9")}, || "Left"),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.6),
				cinematicHelper.SpawnCinematicUnit("ZombieFarmer", cinematicHelper.FindCinematicPos("enemyPos10"), {"Zombie10"}, "Spawn"),
				cinematicHelper.FromCinematicToUnit("Zombie10",UnitGroup.BadSide),
			}),
		}),

		cinematicHelper.Sleep(2),
		cinematicHelper.ShowComment(|| "HeroUnit", || __C(5, "Ok,\nI take that back."), 2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Speak")),
		cinematicHelper.Sleep(3),

		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.StartFight(),	
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
