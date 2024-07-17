

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CozyFarm'
	quest.visual = "Farm"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") >= 2,
						            narrator = || __N(1, "The Cozy Farm"),
						            text = || __D(2, "A family of farmers greets us by the farm's entrance.\n\n\"Oh, blessed be the eyes that see such heroes!\n\nPlease, join us at our table, rest on our beds, it's the least we could do for you after you've been such a help to us villagers.\""),
						    		icon = || "Asst_TheOrcFarm",
						    		who = || "mapCinematicId",
	                                children = {
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Rest at the farm."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We spent the day resting at the farm, eating freshly caught salmon and pea pottage.\n\nWe thanked the family and promised to continue our fight against the orcs.\n\nThey even offered us some food for the road."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.goodMorality,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") == 0 or cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") == 1,
						            narrator = || __N(5, "The Cozy Farm"),
						            text = || __D(6, "A family of farmers greets us by the farm's entrance.\n\n\"Hello, are you looking for a place to rest?\n\nYou can rest here, if you cover your expenses, that is.\""),
						    		icon = || "Asst_TheOrcFarm",
						    		who = || "mapCinematicId",
	                                children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 30,
		                                    text = || __R(7, "Pay for the trouble."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We handed a pouch of gold to the farmers and spent the day resting there.\n\nWe thanked the family and continued our journey."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.payLoot,
										    				rewardsParams = |d,n| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "food",
		                                    text = || __R(9, "Pay with some food."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We gave some of our supplies to the farmers and spent the day resting there.\n\nWe thanked the family and continued our journey."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.payFood,
										    				rewardsParams = |d,n| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Move on."),
										    who = || "mapCinematicId",
								    		exit = true
		                                }
						        	}
						        },
						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") < 0,
						            narrator = || __N(12, "The Cozy Farm"),
						            text = || __D(13, "We reach a farm with a couple of farmers by the door.\n\n\"You? What brings your lot here?\n\nWe've heard about how you go around paying no mind to us common folk. Move along then, we don't want your kind here.\""),
						    		icon = || "Asst_TheOrcFarm",
						    		who = || "mapCinematicId",
	                                children = {
		                                 {
		                                    type = DialogType.Response,
		                                    text = || __R(14, "Keep going."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(15, "Apparently, our bad reputation among the villagers preceded us, and we had no choice but to let the farmers be and move on."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {

		goodMorality = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party() },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "food", amount = dice(1,2)},
			}),
		payLoot = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party() },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = -30},
			}),
		payFood = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party() },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "food", amount = -1},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
