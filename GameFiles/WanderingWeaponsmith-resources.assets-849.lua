do 
	local quest = helper.QuestDefinition();
	quest.id = 'WanderingWeaponsmith'
	quest.visual = "WanderingWeaponsmith"
	quest.kindFlag = "Store"
	quest.encounters = {}
	quest.tags = {"STORE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="guild.attribute", kind = "loot", amount = -100 },
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowBuffStore("damage"),	
								}))
	helper.AddQuest(quest)
	quest.shouldRun = || true
	quest.canReenter = || true
	quest.consumesDay = || not cinematicMapHelper.IsReenter()

	quest.revealDistance = 2
	do
		local quest = helper.CloneQuestDefinition("WanderingWeaponsmith")
		quest.id = "WanderingWeaponsmith2"
		helper.AddQuest(quest)
	end
end
