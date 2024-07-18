

do 
	local quest = helper.QuestDefinition();
	quest.id = 'RoadBarter'
	quest.visual = "Wanderer"
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Road Barter"),
						            text = || __D(2, "A traveler with a big bag on his back approaches us.\n\n\"Hello! I've got medicines to spare, but I'm looking for tools for my journey. Wanna trade?\""), 
						    		icon = || "Asst_MountainWanderer",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "pick",
		                                    text = || __R(3, "Get 2 healing potions."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We gave our pick in exchange for some potions.\n\n\"This is great. Thanks!\" he said, before walking away."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.givePick,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "torch",
		                                    text = || __R(5, "Get an invigorating potion."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We gave our torch in exchange for a potion.\n\n\"This is great. Thanks!\" he said, before walking away."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.giveTorch,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "tent",
		                                    text = || __R(7, "Get an elixir of life."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We gave our tent in exchange for an elixir.\n\n\"This is great. Thanks!\" he said, before walking away."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.giveTent,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "No, thanks!"),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We thanked the traveler for the offer but kept our items as they were."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }

						        	}
						        }
						    })

	quest.results = {

		givePick = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "pick", amount = -1},
			{type="item", itemId = "healthPotion", amount = 2},
		}),

		giveTorch = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = -1},
			{type="item", itemId = "invigoratingPotion", amount = 1},
		}),

		giveTent = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "tent", amount = -1},
			{type="item", itemId = "elixirOfLife", amount = 1},
			}),

	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	
	

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
