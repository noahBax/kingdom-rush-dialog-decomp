

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Shrooms'
	
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Shrooms!"),
						            text = || __D(2, "While walking through the forest, we find a fallen tree trunk teeming with colorful mushrooms."),
						    		icon = || "Asst_Shrooms",
						    		who = || "mapCinematicId",
						    		onEnter = function(d,n)
						            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
						            end,
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Collect\nsome\nmushrooms."),
						    				onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "healing")
	                                    		table.insert(resultsAvailable, "energy")
	                                    		table.insert(resultsAvailable, "food")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)

		                                    	d.data.outcome = randomOutcome
		                                    end,
						    				challenge = {
						    					requirements =  |t| t("ct_wisdom")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| (d.challenge.result == "success") and (d.data.outcome == "healing"),
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "The mushrooms turned out to be of the healing kind.\n\nWe smashed them up and made a healing potion out of them."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.healing,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| (d.challenge.result == "success") and (d.data.outcome == "energy"),
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(5, "The mushrooms turned out to have energetic properties.\n\nWe smashed them up and made an invigorating potion out of them."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.energy,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| (d.challenge.result == "success") and (d.data.outcome == "food"),
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "The mushrooms turned out to be edible.\n\nWe stored some to eat later on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.food,
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
										            text = || __D(7, "We picked some random mushrooms and took a few bites out of them.\n\nThe horrible stomach cramps that followed evidenced that the mushrooms were poisonous!"),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Move on."),
										   	exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {
		healing = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "healthPotion", amount = 1},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		energy = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "invigoratingPotion", amount = 1},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		food = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "food", amount = 2},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		failure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	quest.canHaveInterrupt = false;

	
	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	quest.maxInstancesInGame = 1;
	quest.maxInstancesInAdventure = 1;

	helper.AddQuest(quest)
end
