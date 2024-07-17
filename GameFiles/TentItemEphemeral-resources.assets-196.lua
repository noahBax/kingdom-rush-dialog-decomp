

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TentItemEphemeral'
	
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Tent Rest"),
						            text = || __D(2, "We ready our tent to spend the night."),
						    		icon = || "Asst_Campgrounds",
						    		who = || "mapCinematicId",
						    		children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Rest."),
		                                    onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "normal")
		                                    	table.insert(resultsAvailable, "normal")
		                                    	table.insert(resultsAvailable, "normal")
		                                    	table.insert(resultsAvailable, "normal")
	                                    		table.insert(resultsAvailable, "soundSleep")
	                                    		table.insert(resultsAvailable, "soundSleep")
	                                    		table.insert(resultsAvailable, "interruptedSleep")
	                                    		table.insert(resultsAvailable, "interruptedSleep")
	                                    		table.insert(resultsAvailable, "scatteredBelongings")
	                                    		table.insert(resultsAvailable, "excellentRest")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                    children = { 
		                                    	{
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "normal",
										            text = || __D(4, "The night was uneventful.##We licked our wounds and readied ourselves to move on."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.normal,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "soundSleep",
										            text = || __D(5, "We slept soundly.##Our night's rest sure was invigorating."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.soundSleep,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "interruptedSleep",
										            text = || __D(6, "The constant howling of beasts interrupted our sleep.##Even though we managed to sleep, it was not as refreshing as we would have wished."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.interruptedSleep,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "scatteredBelongings",
										            text = || __D(7, "We woke up and found our belongings scattered around the tent.##Apparently something or someone went through our gear as we slept."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.scatteredBelongings,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "excellentRest",
										            text = || __D(8, "We had an excellent night's sleep.##We woke up feeling revitalized."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.excellentRest,
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

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),		
								}))

	quest.results = {
		normal = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets =  cinematicMapHelper.Party()},
			}),
		soundSleep = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets =  cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		interruptedSleep = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets =  cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		scatteredBelongings = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets =  cinematicMapHelper.Party()},
			{type="guild.attribute", kind = "loot", amount = -25 },
			}),
		excellentRest = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets =  cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			}),

	}

	quest.consumesDay = || false

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
