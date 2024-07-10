


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AnOldAlly'
	quest.visual = "WanderingGnomeStore"
	quest.kindFlag = "Store"
	quest.encounters = {}
	quest.tags = {"STORE","EASY","TUTORIAL"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "An Old Ally"),
						            text = || __D(2, "While running through the Linirean alleys, we notice a trader waving at us.\n\n\"Sir Gerald! I can't believe my eyes!\nTake a look at my wares. The Dark Army checks my records, so I can't give them out to you for free, but at least I'm willing to help an old ally out, even if you're now a fugitive.\""),
						    		icon = || "Asst_TutSalesman",
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
						            narrator = || __N(4, "An Old Ally"),
						            text = || __D(5, "The salesman thanks us for our time and bids us farewell."),
						    		icon = || "WanderingSalesmanBig",
						    		who = || "mapCinematicId",
						            exit = true
						        }
						    })

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.ShowStoreNew(|| {

										
										
										
										
										

										lootTable = {
										
											{type = "item", id = "healthPotion", quantity = || 2, slot = 1},
											{type = "item", id = "bandage", quantity = ||1, chanceSlots = 2},
											{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 3},
											{type = "item", id = "tent", quantity = || 1, slot = 2},
										}

									}),
								}))
	helper.AddQuest(quest)
	quest.shouldRun = || true
	quest.canReenter = || true

	quest.consumesDay = || not cinematicMapHelper.IsReenter()


	quest.revealDistance = 2
end
