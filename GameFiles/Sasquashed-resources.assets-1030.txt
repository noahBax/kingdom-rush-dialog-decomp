


do 
	local quest = helper.QuestDefinition();
	quest.id = 'Sasquashed'
	quest.visual = "Sasquashed"
	quest.kindFlag = "Enigma"
	
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Sasquashed"),
						            text = || __D(2, "We come across the remains of several troll warriors.\n\nJudging by the large footprints beside their bodies, they were probably defeated by a sasquatch."),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_MountainAbandonedCamp",
							    		children = {
								        {
						    				type = DialogType.Response,
		                                    text = || __R(3, "Search\nthrough the\nremains."),
						    				onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "loot")
	                                    		table.insert(resultsAvailable, "weapons")
	                                    		table.insert(resultsAvailable, "healing")
	                                    		table.insert(resultsAvailable, "armor")
	                                    		table.insert(resultsAvailable, "exhausted")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                    children = { 
		                                    	{
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "loot",
										            text = || __D(4, "We rummaged through the trolls' remains and found a decent amount of loot.\n\nWe hope that will be enough to buy some soap and get rid of the troll stench."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.loot,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "weapons",
										            text = || __D(5, "We searched all around the place and managed to salvage a few daggers.\n\nThese trolls have no use for them anymore."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.weapons,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "healing",
										            text = || __D(6, "We found a few healing supplies scattered through the trolls' belongings.\n\nIt would take more than a simple potion to heal these trolls."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.healing,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "armor",
										            text = || __D(7, "We spent a while salvaging whatever the sasquatch hadn't trampled.\n\nWe ended up taking some armor reinforcements, which the trolls won't be needing anymore."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.armor,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "exhausted",
										            text = || __D(8, "We searched and searched the trolls' remains but couldn't find anything of value.\n\nWe ended up getting exhausted for nothing."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.exhausted,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        }
										    }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Rest\nand\nmove on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We stopped for a while to take a breather and then continued with our journey."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rest,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		loot= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		weapons= cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		healing= cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing" , quantity = || 1, slot = 1},
			})}
			}),
		armor= cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		exhausted= cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		rest= cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	
	
	
	

	helper.AddQuest(quest)
	
end
