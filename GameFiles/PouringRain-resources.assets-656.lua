

do 
	local quest = helper.QuestDefinition();
	quest.id = 'PouringRain'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Pouring Rain"),
						            text = || __D(2, "Suddenly, a storm breaks out and heavy rains start pouring down on us.\n\nMoving forward under these conditions looks like a nightmarish task."),
						    		icon = || "Asst_PouringRain",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Look for shelter."),
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
										            text = || __D(4, "After a short while in the rain, we found a decent place to wait out the downpour."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success,
										    				rewardsParams = |d| {hero = d.data.hero},
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
										            text = || __D(5, "We weren't able to find any type of shelter.\n\nAs the storm died down, we noticed we were sneezing and trembling from the cold."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure,
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
		                                    text = || __R(6, "Keep moving."),
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(7, "We decided to keep traveling regardless of the heavy rains.\n\nAs the storm died down, we noticed we were sneezing and trembling from the cold."),
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

		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
		failure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			}),
		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	
	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	quest.maxInstancesInGame = 1000;
	quest.maxInstancesInAdventure = 1000;

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
