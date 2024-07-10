

do 
	local quest = helper.QuestDefinition();
	quest.id = 'ShabbyGear'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Shabby Gear"),
						            text = || __D(2, "We notice our gear is in poor condition and in desperate need of repairs."),
						    		icon = || "Asst_ShabbyGear",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Repair it!"),
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
										            text = || __D(4, "We stopped for a while to mend our gear.\nIt was tricky, but we managed to get it back into fighting shape."),
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
										            text = || __D(5, "We paused our journey to work on our gear.\n\nAfter unsuccessfully fiddling with it for some time, we decided to call it a day and avoid wasting any more resources on it."),
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
		                                    text = || __R(6, "Keep going!"),
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(7, "We chose to ignore the fact our gear was in bad shape and simply kept going."),
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
			{type="unit.attribute", kind = "armor_max", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="guild.attribute", kind = "loot", amount =  -config.rewards.loot.low()},
			}),
		default = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	
	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	quest.maxInstancesInGame = 1;
	quest.maxInstancesInAdventure = 1;

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
