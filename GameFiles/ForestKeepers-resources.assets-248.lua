


do 
	local quest = helper.QuestDefinition();
	quest.id = 'ForestKeepers'
	quest.encounters = {}
	quest.tags = {"Linked"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") > 0,
						            narrator = || __N(1, "The Forest Keepers"),
						            text = || __D(2, "A forest keeper emerges from the woods and stands before us.\n\n\"Your presence in these lands is welcomed. You truly are friends of the forest.\n\nCarry on with our gift, adventurers.\""),
						    		icon = || "Asst_StrayedDryad",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Receive the gift."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "A warm greenish light bathed us as our bodies felt the forest gift take root in our spirits.\n\nWe bowed in gratitude to the forest keeper and moved on."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.goodMorality,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                }
						        	}
						        },
						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") < 0,
						            narrator = || __N(5, "The Forest Keepers"),
						            text = || __D(6, "A forest keeper emerged from the woods and stood before us.\n\n\"Your actions toward the forest are no better than Krum'Thak's own.\n\nBegone! May our punishment rid these lands of your kind.\""),
						    		icon = || "Asst_StrayedDryad",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Receive the punishment."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "Suddenly, thin roots sprouted from the ground and pricked through our boot soles, sucking some of our life force out.\n\nOnce we were punished, the forest keeper disappeared into the woods."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.badMorality,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {

		goodMorality = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party() },
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		badMorality = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party() },
			}),
	}

	
	quest.interruptByChance = || helper.PriorityAndSlots(((cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") != 0) and cinematicMapHelper.RandomChance(0.25)) and 3 or 0, 3)
		
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
