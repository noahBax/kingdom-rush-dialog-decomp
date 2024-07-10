

do 
	local quest = helper.QuestDefinition();
	quest.id = 'PreBossSalesman'
	quest.visual = "WandererTraveler"
	quest.kindFlag = "Store"
	quest.encounters = {}
	quest.tags = {"STORE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Wandering Salesman"),
						            text = || __D(2, "The salesman greets us from his big cart filled with goods.##\"Best goods 'round these parts, fellas. Take a look!\" the salesman says, showing his wares."),
						    		icon = || "WanderingSalesmanBig",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Trade."),
		                                    exit = true
		                                },
						        	}
						        }
						    })
	local theDialogExit =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(4, "Wandering Salesman"),
						            text = || __D(5, "The salesman thanks us for our time and bids us farewell."),
						    		icon = || "WanderingSalesmanBig",
						    		who = || "mapCinematicId",
						            exit = true
						        }
						    })

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowStoreNew(|| {

										
										
										
										
										

										lootTable = {
										

											{type = "item", id = "healthPotion", quantity = || 3, slot = 1},
											{type = "item", id = "coffee", quantity = ||1, chanceSlots = 2},
											{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 3},
											{type = "item", id = "bandage", quantity = || 2, slot = 1},
										}

									}),
								}))
	helper.AddQuest(quest)
	
	

	quest.consumesDay = || false

	quest.revealDistance = 2

	quest.revealDistance = 0
end
