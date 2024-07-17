


do 
	local quest = helper.QuestDefinition();
	quest.id = 'PagranExiles'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Pagran Exiles"),
						            text = || __D(2, "We meet a group of Pagran Exiles looking for shelter.\n\n\"Pardon me, travelers. We've been escaping Krum'Thak's orcs for a long time with barely any rest.\"\n\n\"Do you happen to have a tent we could buy?\""),
						    		icon = || "Asst_PagranExiles",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "tent",
		                                    text = || __R(3, "Sell for 100 Loot."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "\"Thank you! It's not much but it's what we can spare during our travels,\"\n\nsaid the leader of the group, taking the tent and handing us a pouch of gold."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sellTent,
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
		                                    text = || __R(5, "Gift them the tent."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "\"Oh, may blessings find your way, travelers!\" said the leader of the group, taking the tent and bowing in gratitude before moving on."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.giftTent,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") +2))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "We have none to sell."),
		                                    onChoose = function(d,n)
								            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
								            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") -2))
								            end,
										    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {

		sellTent = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "tent", amount = -1 },
			{type="guild.attribute", kind = "loot", amount = 100 },
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
		giftTent = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "tent", amount = -1 },
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
			
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
	}

	
	quest.interruptByChance = || helper.PriorityAndSlots(cinematicMapHelper.HasItemInInventory("tent") and 3 or 0, 5)
		
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
