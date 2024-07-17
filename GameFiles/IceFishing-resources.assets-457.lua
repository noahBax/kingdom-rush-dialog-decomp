


do 
	local quest = helper.QuestDefinition();
	quest.id = 'IceFishing'
	quest.visual = "Glaciar"
	quest.kindFlag = "Enigma"
	
	
	quest.encounters = {}
	quest.tags = {"STORE","EASY","TERRAIN_PLAINS","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Ice Fishing"),
						            text = || __D(2, "We encounter a series of ice-fishing holes with tools next to them.\n\nFishing here could provide us with some savory fish, but we could also use some of the tools to improve our equipment."),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_IceFishing",
							    		children = {
								        {
						    				type = DialogType.Response,
						    				text = || __R(3, "Fish."),
						    				onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "noLuck1")
	                                    		table.insert(resultsAvailable, "noLuck2")
	                                    		table.insert(resultsAvailable, "ok1")
	                                    		table.insert(resultsAvailable, "ok2")
	                                    		table.insert(resultsAvailable, "ok3")
	                                    		table.insert(resultsAvailable, "ok4")
	                                    		table.insert(resultsAvailable, "ok5")
	                                    		table.insert(resultsAvailable, "good1")
	                                    		table.insert(resultsAvailable, "good2")
	                                    		table.insert(resultsAvailable, "great")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                    children = { 
		                                    	{
										            type = DialogType.Dialog,
										            condition = |d| (d.data.outcome == "noLuck1") or (d.data.outcome == "noLuck2") ,
										            text = || __D(4, "We spent a couple of hours by the fishing holes but ended up empty-handed.\n\nWe hope to have better luck next time."), 
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.noLuck,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| (d.data.outcome == "ok1") or (d.data.outcome == "ok2") or (d.data.outcome == "ok3") or (d.data.outcome == "ok4") or (d.data.outcome == "ok5"),
										            text = || __D(5, "After a couple hours fishing, we ended up catching a few crappies and a perch.\n\nEven though it's not impressive, it'll make a decent meal."), 
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.ok,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| (d.data.outcome == "good1") or (d.data.outcome == "good2"),
										            text = || __D(6, "Our fishing adventure sure was profitable!\n\nWe ended up catching some valuable bluegills.\n\nNot only will they make a decent meal, but we even got a few extra to sell."), 
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.good,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "great",
										            text = || __D(7, "At first we thought the fishing holes had no bounty underneath them, but as we were about to give up, we ended up catching a massive northern pike!\n\nWe feasted on our prize!"), 
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.great,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										    }
		                                },
		                                {
						    				type = DialogType.Response,
						    				text = || __R(8, "Improve your weapons."),
						    				children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(9, "We took some of the tools used to maintain the fishing gear and managed to improve our weapons before moving on."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sharpen,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		noLuck= cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		ok= cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		good= cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		great= cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		sharpen= cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	
	
	
	

	helper.AddQuest(quest)
	
end
