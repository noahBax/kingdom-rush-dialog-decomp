

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BlazingChasm'
	quest.visual = "LavaFissure"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"EMERGENT", "TERRAIN_WASTELAND", "BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Blazing Chasm"),
						            text = || __D(2, "A chasm interrupts our path, its bottom filled with flowing lava.\n\nLuckily for us, there's a big and heavy fallen tree trunk nearby."),
						    		icon = || "Asst_LavaFissure",
						    		who = || "mapCinematicId",
						            children = {
							    		
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Jump across the chasm."),
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
										            text = || __D(4, "We took some steps back and sprinted to jump to the other side of the chasm, where we landed unharmed."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsSuccess,
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
										            text = || __D(5, "We miscalculated our jump and barely made it to the edge on the other side, losing some of our valuables trying to climb up."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsFailure,
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
						    				text = || __R(6, "Use the tree trunk."),
						    				challenge = {
						    					requirements =  |t| t("ct_might")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "We managed to place the big trunk across the chasm, and we carefully crossed over it one by one."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
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
										            text = || __D(8, "The tree trunk was a lot heavier than expected, leaving us exhausted by the time we managed to place it across the chasm."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
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
		                                    text = || __R(9, "Take a detour."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We decided to find a safer way to our original path, which we did after many long hours wandering around."),
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
		
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		athleticsSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
		athleticsFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(2)},
			{type="guild.attribute", kind = "loot", amount = -15},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
	quest.canHaveInterrupt = false;
	quest.revealDistance = 1

end
