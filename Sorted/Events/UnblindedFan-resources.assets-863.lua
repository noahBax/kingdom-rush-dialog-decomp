

do 
	local quest = helper.QuestDefinition();
	quest.id = 'UnblindedFan'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Unblinded Fan"),
						            text = || __D(2, "\"Wait!\"\n\nA traveler carrying lots of cult-related trinkets runs toward us.\n\n\"Is that ... is that a Mask of Sorrow?\" he says, trying to catch his breath.\n\n\"Please, sell it to me! I need it for my collection!\""),
						    		icon = || "Asst_CultFollower",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
											type = DialogType.Response,
											text = || __R(3, "Sell it\nfor\n35 crowns."),
											who = || "mapCinematicId",
											children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We decided to sell it for a decent price and got rid of the strange item.\n\nThe traveler pinned the mask to his backpack and walked away whistling with joy."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sellMask,
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
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Haggle."),
						    				challenge = {
						    					requirements =  |t| t("ct_social")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "We bargained for a while with the man and managed to sell it for a higher price.\n\nThe traveler pinned the mask to his backpack and walked away grumbling."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
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
										            text = || __D(7, "We tried bargaining for a long while but ended up selling it for a lower price, just to get rid of the man.\n\nThe traveler pinned the mask to his backpack and cheerfully walked away with a grin on his face."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
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
		                                    condition = || cinematicMapHelper.HeroByTag("ct_wisdom") != nil,
                           					who = || cinematicMapHelper.HeroByTag("ct_wisdom").GUID,
		                                    text = || __R(8, "Exchange it for intel."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We questioned the man about his knowledge of the cult, which made him spew details of the cult's doings and plans, to prove he was a real fan.\n\nOnce we had learned enough, we gave him the mask just to make him go away."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.wisdomSuccess,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    text = || __R(10, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(11, "We told the man to go away, and we resumed our journey.\n\nHe seemed pretty bummed out."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
												        cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												    end,
												    exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		sellMask = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 35},
			{type="item", itemId = "glareMask", amount = -1},
		}),

		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = 70},
			{type="item", itemId = "glareMask", amount = -1},
		}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="guild.attribute", kind = "loot", amount = 15},
			{type="item", itemId = "glareMask", amount = -1},
		}),

		wisdomSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "glareMask", amount = -1},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(cinematicMapHelper.HasItemInInventory("glareMask") and 5 or 0, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
