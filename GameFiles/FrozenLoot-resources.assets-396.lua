

do 
	local quest = helper.QuestDefinition();
	quest.id = 'FrozenLoot'
	quest.visual = "MountainCave"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Frozen Loot"),
						            text = || __D(2, "Inside the cave, a myriad of valuable items are frozen inside ice blocks."),
						    		icon = || "Asst_Cave",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Break the ice."),
						    				challenge = {
						    					requirements =  |t| t("ct_might")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We repeatedly struck the ice blocks with our weapons until the valuables trapped inside broke loose."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(5, "We spent a good while trying to break the ice using our weapons, yet in doing so we just managed to end up chipping our weapons."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Search for weak spots."),
						    				challenge = {
						    					requirements =  |t| t("ct_craft")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "Investigating the blocks revealed some fissures, and a few precise strikes were all it took to dislodge the trapped valuables."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.craftSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(8, "We investigated the ice blocks for a good while, trying to find any weak spots, but we weren't able to find any.\n\nWe decided to give up and move on."),
										            who = || "mapCinematicId",
										            exit = true
										        }
						    				}
							    		},
							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "pick",
		                                    text = || __R(9, "Use a pick."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "Using one of our picks, we freed the frozen valuables."), 
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.usePick,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "We decided to disregard the frozen valuables and moved on."), 
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		craftSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			}),
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			}),
		mightFailure = cinematicMapHelper.Result(|params| {
			
			{type="unit.attribute", kind = "baseDamage", amount = -1, targets = {params.hero}},
			}),
		usePick = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="item", itemId = "pick", amount = -1},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
