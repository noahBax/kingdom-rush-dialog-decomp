


do 
	local quest = helper.QuestDefinition();
	quest.id = 'PlayfulLights'
	quest.visual = "SilveroakTree"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Playful Lights"),
						            text = || __D(2, "In the dark of the night, we are surprised by glowing wisps flying around, as if they're trying to get us to follow them.\n\nTheir intentions are not really clear."),
						    		icon = || "Asst_PlayfulLights",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                	type = DialogType.Response,
		                                	text = || __R(3, "Follow the wisps."),
		                                	onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "a")
	                                    		table.insert(resultsAvailable, "b")
	                                    		table.insert(resultsAvailable, "c")
	                                    		table.insert(resultsAvailable, "d")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                	
									   		children = {
												{
													type = DialogType.Dialog,
							                   		text = || __D(4, "We followed the wisps for hours until they disappeared inside a cave behind a fallen tree, which we managed to move aside.\n\nThe thought of walking back to our path overshadowed any joy we felt for the goods we found inside."),
									    			condition = |d| d.data.outcome == "a",
									    			who = || "mapCinematicId",
									    			children = {
														{
									    					type = DialogType.Custom,
									    					subtype = "rewards",
									    					rewards = || quest.results.a,
									    					rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    			exit = true
														}
													}
												},

												{
													type = DialogType.Dialog,
							                   		text = || __D(5, "We followed the wisps until they disappeared into a decrepit cabin in the woods.\n\nInside, we found various goods that were at hand, but the roof above us suddenly collapsed.\n\nWe barely made it out alive."),
									    			condition = |d| d.data.outcome == "b",
									    			who = || "mapCinematicId",
									    			children = {
														{
									    					type = DialogType.Custom,
									    					subtype = "rewards",
									    					rewards = || quest.results.b,
									    					rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    			exit = true
														}
													}
												},

												{
													type = DialogType.Dialog,
							                   		text = || __D(6, "We followed the wisps until they disappeared over the top of a big fruit tree.\n\nOne of us managed to climb and throw down enough fruits for our journey, but the snap of a weak branch made for a quick, and painful, way down."),
									    			condition = |d| d.data.outcome == "c",
									    			who = || "mapCinematicId",
									    			children = {
														{
									    					type = DialogType.Custom,
									    					subtype = "rewards",
									    					rewards = || quest.results.c,
									    					rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    			exit = true
														}
													}
												},

												{
													type = DialogType.Dialog,
							                   		text = || __D(7, "We followed the wisps as they span around us emitting a peaceful melody that replenished our bodies and mind.\n\nUnfortunately, it also made us lose all sense of time and location, and getting back to our path wasn't an enjoyable ride."),
									    			condition = |d| d.data.outcome == "d",
									    			who = || "mapCinematicId",
									    			children = {
														{
									    					type = DialogType.Custom,
									    					subtype = "rewards",
									    					rewards = || quest.results.d,
									    					rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    			exit = true
														}
													}
												}

											}
						                },
						                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Forget about it."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "Although the wisps were amusing, we decided to focus on our mission and avoid any potential distractions."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		a = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "sharpeningStone", amount = 1 },
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		b = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "unidentifiedPotion", amount = 1 },
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot", quantity = || 1, slot = 1},
			})},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		c = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "food", amount = 3 },
			{type="doDamage", amount = 3, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		d = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end)		
								}))
	helper.AddQuest(quest)

	
end
