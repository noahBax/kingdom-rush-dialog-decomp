


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightOutside")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		 cinematicHelper.Instant(function ()
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("villager01").GetUnit(), "villagers_survive_cliffhanger_achievement_modifier")
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("villager02").GetUnit(), "villagers_survive_cliffhanger_achievement_modifier")
		 end),

	     cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({ 
		 	cinematicHelper.CameraZoom("IN_GAME"),
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02"), || "Fear"),
			 
			 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01"), || "Fear"),
		 }),
		 
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01"), || "Angry"),
		 cinematicHelper.Sleep(0.2),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03"), || "Angry"),
		 cinematicHelper.Sleep(0.1),
		 cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02"), || "Angry"),

		 cinematicHelper.Sleep(1.2),

		 cinematicHelper.Sequence({
			 
			 cinematicHelper.ShowComment(|| "villager02", || __C(1, "S-s-stay away!"), 1.6),  
			 cinematicHelper.Sleep(2.4),
			 
			 cinematicHelper.ShowComment(|| "villager01", || __C(2, "P-please...?"), 1.6),  
			 cinematicHelper.Sleep(1.8),
		 }),

		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 cinematicHelper.ShowComment(|| "hero01", || __C(3, "Look!\nWe have to save\nthem!"), 2), 
		 cinematicHelper.Sleep(1.8),

		 cinematicHelper.Parallel({
		 	cinematicHelper.MoveCinematicUnit("legend","legendPos", true),
			cinematicHelper.MoveCinematicUnit("hero01","heroPos01", true),
			cinematicHelper.MoveCinematicUnit("hero02","heroPos02", true),
			cinematicHelper.MoveCinematicUnit("hero03","heroPos03", true),
		 	cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 1.8),
		 }),

		 cinematicHelper.Sequence({
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero02"),"Speak")),
		 	cinematicHelper.ShowComment(|| "hero02", || __C(4, "Hear that?"), 1.6), 
		 	cinematicHelper.Sleep(1.6),
		 	cinematicHelper.SpawnCinematicUnit("WinterWulf", cinematicHelper.FindCinematicPos("spawnPos01"), {"wulf04"}, "Idle"),
		 	cinematicHelper.SpawnCinematicUnit("WinterWulf", cinematicHelper.FindCinematicPos("spawnPos02"), {"wulf05"}, "Idle"),


		 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Left"),
		 	cinematicHelper.Sleep(0.1),
		 	cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero01")}, || "Left"),
		 	cinematicHelper.CameraZoom("cinematic"),

		 	cinematicHelper.Parallel({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos01")}, || 0.8),
		 		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("wulf05"),"SpellCastA")),
				cinematicHelper.PlaySound(||"krl_sfx_combatGeneric_smallFaunaHowl"),
				cinematicHelper.MoveCinematicUnit("wulf04","wulfPos01", true),
				
			}),
			cinematicHelper.Sleep(0.8),

			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos02")}, || 0.8),
		 	cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("hero01"),"Speak")),
		 	cinematicHelper.ShowComment(|| "hero01", || __C(5, "Well, isn't\nthat great?"), 1.8), 

			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager01")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf01")),
			 cinematicHelper.Sleep(0.05),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager02")),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf02")),
			 cinematicHelper.Sleep(0.05),
			 cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("wulf03")),
			 cinematicHelper.FromCinematicToUnit("wulf04",UnitGroup.BadSide),
			 cinematicHelper.FromCinematicToUnit("wulf05",UnitGroup.BadSide),
		 	 cinematicHelper.Sleep(1.6),
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
