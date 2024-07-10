

do 
	local quest = helper.QuestDefinition();
	quest.id = 'IcingOnTheCrate'
	quest.visual = "MountainCamp"
	quest.kindFlag = "Enigma"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Icing on the Crate"),
						            text = || __D(2, "We discover the remains of a crashed cart with some valuable belongings.\n\nBelow the snow and debris, there is a sturdy closed crate."),
						    		icon = || "Asst_IcingOnTheCrate",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Response,
						    				text = || __R(3, "Grab some goods."),
						    				children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(4, "We grabbed what we thought could be useful for our adventure and resumed our journey."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.grabGoods,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		
							    		{
						    				type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "crowbar",
		                                    text = || __R(5, "Open the crate."),
										   	children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(6, "We managed to open the crate's lid and found a great amount of loot inside.\n\nWe took all of the loot and some of the other goods laying around, before moving on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useCrowbar,
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
		grabGoods = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),

		useCrowbar = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "crowbar", amount = -1},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "buffItem", quantity = || 1, slot = 1},
			})},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
	}
	

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
