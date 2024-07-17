local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup(cinematicHelper.RandomItem({"DynamicSoundGroupHUDMusicQuickPlayArena1", "DynamicSoundGroupHUDMusicQuickPlayArena2", "DynamicSoundGroupHUDMusicQuickPlayArena3"}))
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupArenaSounds")
	cinematicHelper.OverrideCinematicOrtoSize(3.45)
	cinematicHelper.InstantiateGenericPrefab("KrumAudienceController", "KrumAudienceController")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
		cinematicHelper.Instant(|| print("Loading Default Arena Cinematic")),
		cinematicHelper.Instant(|| cinematicHelper.SendMessage(cinematicHelper.FindGO("KrumAudienceController"), "PlayAudience", "default")),
	    cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
		cinematicHelper.CameraZoom("cinematic"),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowFightResume(),
	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowDefeated(),
	}))


return encounterLogic;
