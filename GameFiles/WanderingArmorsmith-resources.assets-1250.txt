do 
	local quest = helper.QuestDefinition();
	quest.id = 'WanderingArmorsmith'
	quest.visual = "WanderingArmorsmith"
	quest.kindFlag = "Store"
	quest.encounters = {}
	quest.tags = {"STORE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			{type="unit.attribute", kind = "armor_max", amount = 1, targets = {params.hero}},
			{type="guild.attribute", kind = "loot", amount = -50 },
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowBuffStore("armor"),	
								}))
	helper.AddQuest(quest)
	quest.shouldRun = || true
	quest.canReenter = || true
	quest.consumesDay = || not cinematicMapHelper.IsReenter()

	quest.revealDistance = 2

	do
		local quest = helper.CloneQuestDefinition("WanderingArmorsmith")
		quest.id = "WanderingArmorsmith2"
		helper.AddQuest(quest)
	end
end
