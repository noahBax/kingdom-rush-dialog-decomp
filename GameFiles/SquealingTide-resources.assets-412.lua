

do 
	local quest = helper.QuestDefinition();
	quest.id = 'SquealingTide'
	quest.visual = "DarkCave"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Squealing Tide"),
						            text = || __D(2, "We hear a loud squealing noise coming from a nearby cave, getting louder each second.\n\nShocked, we see countless starving rats rushing toward us."),
						    		icon = || "Asst_SquealingTide",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Run!"),
						    				challenge = {
						    					requirements =  |t| t("ct_athletics")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We hastily ran away from them until we reached a rift that wasn't an obstacle for us but was wide enough to keep them from chasing us further.\n\nWe laughed at them from the other side."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsSuccess,
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
										            text = || __D(5, "We barely managed to outrun the rodent horde, and we had to get rid of some rats that managed to get onto us and even deliver some bites."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
								        
								        {
						    				type = DialogType.Custom,
						    				subtype = "item",
						                    item = || "food",
						                    text = || __R(6, "Lure them away!"),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(7, "Feeling overwhelmed by their number, we tossed some of our food far away from us, to entertain them long enough for us to get away.\n\n\"Bon appétit!\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useFood,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
											    }
										     },
						    			},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Fend them off."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We fought them with all we had, but they just kept coming at us.\n\nAfter a long while, they started to retreat, leaving us exhausted and somewhat gnawed."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {},
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
		
		useFood = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="item", itemId = "food", amount = -1},
		}),
		
		athleticsSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),
		athleticsFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
