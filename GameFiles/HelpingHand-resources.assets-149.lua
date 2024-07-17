

do 
	local quest = helper.QuestDefinition();
	quest.id = 'HelpingHand'
	quest.visual = "MountainWanderer"
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Helping Hand"),
						            text = || __D(2, "We spot a villager in front of a destroyed cart and decide to get closer.\n\n\"Those damned trolls robbed me! Now I won't be able to get back home before nightfall!\""),
						    		icon = || "Asst_CrashedCart",
						    		who = || "mapCinematicId",
						            children = {

								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Repair the cart."),
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
										            text = || __D(4, "We expertly managed to repair the vehicle before night fell.\n\nThe villager didn't have much to give in return, but her joyous attitude was enough to lift our spirits."),
										            who = || "mapCinematicId",
										            children = {
										            	{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.craftSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
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
										            text = || __D(5, "Though we tried our best, the task proved too heavy for us, and we kept working on it until the next morning.\n\nDespite that, the woman was still grateful for our efforts."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.craftFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "tent",
		                                    text = || __R(6, "Offer a tent."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We offered her a tent so she could endure the cold night and fix the cart in the morning.\n\nShe seemed to be very grateful for our aid."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.giftTent,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },

										{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Not much\nto do..."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "There wasn't much we could do to help in this situation.\n\nWe tried comforting the woman and promised to make the trolls pay for their mischief."),
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
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="item", itemId = "food", amount = 2},
			{type="giveXP", amount = config.rewards.starXp.eMid()},
			}),
		craftFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="item", itemId = "food", amount = 1},
			}),

		giftTent = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "tent", amount = -1},
			{type="item", itemId = "food", amount = 2},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
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
