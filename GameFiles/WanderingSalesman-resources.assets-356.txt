do 
	local quest = helper.QuestDefinition();
	quest.id = 'WanderingSalesman'
	quest.visual = "WanderingGnomeStore"
	quest.kindFlag = "Store"
	quest.encounters = {}
	quest.tags = {"STORE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowStoreNew(|| {

										
										
										
										
										

										lootTable = {
										

											{type = "oneOf", quantity = || 4, items = {
												{type = "oneOf", quantity = || 1, slot = 4, items = {
													{type = "item", id = "healthPotion", quantity = || 3, slot = 2},
													{type = "item", id = "healthPotion", quantity = || 2, slot = 1},
													{type = "item", id = "healthPotion", quantity = || 4, slot = 1},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "elixirOfLife", quantity = || 3, slot = 2},
													{type = "item", id = "elixirOfLife", quantity = || 2, slot = 1},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "bandage", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "invigoratingPotion", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "invigoratingPotion", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 1, items = {
													{type = "item", id = "blessedRing", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "blessedRing", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 1, items = {
													{type = "item", id = "ringOfVitality", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "ringOfVitality", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "coffee", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "coffee", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "bandage", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "unidentifiedPotion", quantity = ||2, chanceSlots = 2},
													{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 3},
												}},
												{type = "oneOf", quantity = || 1, slot = 1, items = {
													{type = "item", id = "pick", quantity = || 2, slot = 1},
													{type = "item", id = "rope", quantity = || 2, slot = 1},
													{type = "item", id = "torch", quantity = || 2, slot = 1},
													{type = "item", id = "crowbar", quantity = || 2, slot = 1},
												}},
												{type = "oneOf", quantity = || 1, slot = 1, items = {
													{type = "item", id = "sharpeningStone", quantity = || 2, slot = 1},
													{type = "item", id = "sharpeningStone", quantity = || 3, slot = 1},
												}},
												{type = "oneOf", quantity = || 1, slot = 1, items = {
													{type = "item", id = "armorersKit", quantity = || 2, slot = 1},
													{type = "item", id = "armorersKit", quantity = || 3, slot = 1},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "tent", quantity = || 2, slot = 2},
													{type = "item", id = "tent", quantity = || 3, slot = 1},
												}},
												{type = "oneOf", quantity = || 1, slot = 2, items = {
													{type = "item", id = "horn", quantity = || 1, slot = 1},
												}},
												
												
												
												
												
												
												
												
												
											}},
										}

									}),
								}))
	helper.AddQuest(quest)
	quest.shouldRun = || true
	quest.canReenter = || true

	quest.consumesDay = || not cinematicMapHelper.IsReenter()

	quest.revealDistance = 2
	do
		local quest = helper.CloneQuestDefinition("WanderingSalesman")
		quest.id = "WanderingSalesman2"
		helper.AddQuest(quest)
	end
end
