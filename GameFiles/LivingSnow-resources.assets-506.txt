

do 
	local quest = helper.QuestDefinition();
	quest.id = 'LivingSnow'
	quest.visual = "MountainTree"
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Living Snow"),
						            text = || __D(2, "A pair of cultists appear in front of us, casting a spell.\n\nAs we prepare to face them, the snow beneath our feet suddenly takes the form of various tentacles that start to trap us."),
						    		icon = || "Asst_SnowTentacles",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Melt them!"),
						    				challenge = {
						    					requirements =  |t| t("ct_magic")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We cast a fireball quickly enough to melt most of the tentacles, and we got out without getting hurt.\n\nSurprised by our explosive escape, the cultists vanished."),
										            who = || "mapCinematicId",
										            children = {
										            	{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicSuccess,
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
										            text = || __D(5, "We carelessly cast an explosive fireball that melted the tentacles but hurt us in the process.\n\nSeeing we were still alive, the cultists grumbled and vanished."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "torch",
		                                    text = || __R(6, "Create a hole."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We lit a torch and melted a hole big enough for us to escape through.\n\nSeeing we were still alive, the cultists grumbled and vanished."),
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
		                                    text = || __R(8, "Try to escape."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We tried fighting back the snow tentacles, but they kept regenerating and suffocating us.\n\nExhausted and injured, we eventually made it out."),
										    		who = || "mapCinematicId",
										    		children = {
										    			{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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

		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
		}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(3)},
		}),

		useTorch = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = -1},
			{type="giveXP", amount = config.rewards.starXp.eMid()},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
