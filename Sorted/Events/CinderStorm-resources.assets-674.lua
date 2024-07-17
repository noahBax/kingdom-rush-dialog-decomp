

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CinderStorm'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Cinder Storm"),
						            text = || __D(2, "A gust of wind brings a noxious cloud of cinders upon us.\n\nIt won't be healthy to be caught in it!"),
						    		icon = || "Asst_Cinderstorm",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Seek shelter!"),
						    				challenge = {
						    					requirements =  |t| t("ct_survival")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We quickly found a rock shelter and ran under it to protect ourselves until the dense cloud went away."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalSuccess,
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
										            text = || __D(5, "We couldn't find a shelter quickly enough, and some of us ended up breathing a fistful of ashes before the cloud went away."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalFailure,
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
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Craft a cover!"),
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
										            text = || __D(7, "Using what we had at hand, we created a cover sturdy enough to shroud us until the noxious cloud of ashes went away.\n\nWe decided to keep it for future use."),
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
										            text = || __D(8, "We rushed to craft a cover but ended up with a tent too flimsy to resist the strong winds, making us breathe some of the ashes for a while."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.craftFailure,
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
		                                    text = || __R(9, "Hide behind rocks."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We hid behind a big rock pillar, and although we avoided the strong winds, we got to inhale some of the scattered ashes nonetheless."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
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
		
		survivalSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),
		survivalFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(2)},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		craftSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "tent", amount = 1},
		}),
		craftFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},
		}),
	}


	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
