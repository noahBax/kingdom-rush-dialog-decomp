

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Timber'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Timberrr!"),
						            text = || __D(2, "We hear a loud wood cracking sound and notice a huge tree about to fall on top of us."),
						    		icon = || "Asst_Timber",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Dodge the tree trunk!"),
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
										            text = || __D(4, "We jumped out of harm's way in the nick of time.\n\nThe adrenaline rush got us pumped up and ready to keep going."),
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
										            text = || __D(5, "We tried running away, but we kept running in the same direction that the tree was falling, instead of side-stepping it.\n\nThe massive tree fell on top of us, almost crushing us to death."),
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
		                                    text = || __R(6, "Oops!"),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_athletics") == nil,
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(7, "We simply stared at the falling tree, unable to react in time.\n\nThe massive tree trunk fell on top of us, almost crushing us to death."),
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
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		failure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
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
