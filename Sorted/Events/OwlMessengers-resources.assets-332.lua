

do 
	local quest = helper.QuestDefinition();
	quest.id = 'OwlMessengers'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Owl Messengers"),
						            text = || __D(2, "Deep inside the mountain wood, a cultist is tending to a parliament of messenger owls.\n\nEven though we could charge in head on, alerting the cultist would result in him dispatching the owls."), 
						    		icon = || "Asst_MessengerOwls",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Stealthily\ntake out\nthe cultist."),
						    				challenge = {
						    					requirements =  |t| t("ct_stealth")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "Sneaking from bush to bush, we took out the cultist without being detected.\n\nAfter reviewing the messages, we learned that the owls were supposed to call for cultist reinforcements."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthSuccess,
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
										            text = || __D(5, "We attempted to sneak toward the messenger post, but stepping on a branch gave our position away.\n\nThe cultist immediately dispatched the owls and then vanished in a cloud of purple smoke."),
										            who = || "mapCinematicId",
										            onChoose = function()
										            	cinematicMapHelper.Guild().context.SetInt("linked.owlsSent", 1)
										            	print (cinematicMapHelper.Guild().context.GetInt("linked.owlsSent"))
										            end,
										            exit = true
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Snipe at the cultist."),
						    				challenge = {
						    					requirements =  |t| t("ct_ranged")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "Hiding amongst the trees, we shot at the cultist, expertly bringing him down.\n\nAfter reviewing the messages, we learned that the owls were supposed to call for cultist reinforcements."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedSuccess,
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
										            text = || __D(8, "We tried sniping at the cultist, but our aim was untrue.\n\nAlerted, the cultist immediately dispatched the owls and vanished in a cloud of purple smoke."),
										            who = || "mapCinematicId",
										            onChoose = function()
										            	cinematicMapHelper.Guild().context.SetInt("linked.owlsSent", 1)
										            	print (cinematicMapHelper.Guild().context.GetInt("linked.owlsSent"))
										            end,
										            exit = true
										        }
						    				}
							    		},
							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "torch",
		                                    text = || __R(9, "Set\nthe post\nablaze."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We tossed in a torch and set one of the cages on fire.\n\nOnce the cultist was distracted, we sneaked closer and took him out.\n\nWe then learned that the owls were supposed to call for cultist reinforcements."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useTorch,
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
			                                    	text = || __D(12, "We decided not to bother with a simple cultist and moved on."),
										    		who = || "mapCinematicId",
										    		onChoose = function()
										            	cinematicMapHelper.Guild().context.SetInt("linked.owlsSent", 1)
										            	print (cinematicMapHelper.Guild().context.GetInt("linked.owlsSent"))
										            end,
										            exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		stealthFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		stealthSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		rangedSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		rangedFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			}),
		useTorch = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "torch", amount = -1},
			}),
		detour = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
