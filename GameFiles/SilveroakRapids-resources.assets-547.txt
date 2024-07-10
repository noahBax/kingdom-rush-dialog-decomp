


do 
	local quest = helper.QuestDefinition();
	quest.id = 'SilveroakRapids'
	
	
	quest.encounters = {}
	quest.tags = {"EMERGENT", "TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Silveroak Rapids"),
						            text = || __D(2, "We reach a small pier by the shores of a fast flowing river. It doesn't take much to understand that crossing it is going to be difficult.\n\nA lonely Sylvan elf sits on the pier, an anchored boat in front of him."),
						    		icon = || "Asst_SilveroakRapids",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 25,
		                                    text = || __R(3, "Ask for passage."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We asked the elf to take us to the other side of the river.\n\nHe did so for a price."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.askForPassage,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    condition = || (cinematicMapHelper.HeroByTag("WitchDoctor") != nil) or (cinematicMapHelper.HeroByTag("Sorceress") != nil),
		                                    text = || __R(5, "Ask the currents to slow down."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We knelt at the shore and whispered to the river.\n\nAfter mere moments, we realized that we had been heard.\nThe currents slowed enough for us to swim across without excessive effort.\n\nWe thanked the river and marched on."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.askCurrentsToSlow,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    item = || "rope",
		                                    text = || __R(7, "Cross the river."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We improvised a hook and tied the rope to a tree across the river.\n\nWith confidence, we crossed without hindrance."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useRope,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    text = || __R(9, "Swim across."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We decided to brave the currents by ourselves.\n\nThe waters proved overwhelming, and we were swept away by the waves.\n\nWe emerged far from the pier, shaking but alive, and tangled up with a backpack full of armor-repairing materials."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.swimAcross,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		askForPassage = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="guild.attribute", kind = "loot", amount = -25 },
			}),
		askCurrentsToSlow = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		useRope = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "rope", amount = -1},
			}),
		swimAcross = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "armorersKit", amount = 1},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
