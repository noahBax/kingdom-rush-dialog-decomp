

do 
	local quest = helper.QuestDefinition();
	quest.id = 'LethalLandslide'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Lethal Landslide"),
						            text = || __D(2, "We are carefully walking along a rocky ledge when the ground beneath one of us crumbles away, falling into the lava pit below!"),
						    		icon = || "Asst_Landslide",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Grab and lift!"),
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
										            text = || __D(4, "Without wasting a second, we caught the airborne hero just in time to prevent a deadly fall into the lava below."),
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
										            text = || __D(5, "We caught the hero in time but struggled for a while to lift them back to safety.\n\nThe stress of the situation took its toll on us."),
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
						    				type = DialogType.Custom,
						    				subtype = "item",
						                    item = || "rope",
						                    text = || __R(6, "Throw a rope!"),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We threw a rope to the falling hero, who was able to clutch onto it until we lifted them back to safety."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useRope,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
										    				exit = true
														}
										        	}
											    }
										     },
						    			},
							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Oh no...."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We saw our hero fall toward the fiery pit, only to hear a sudden thump followed by a faint moan.\n\nLooking down, we saw them lying face-down on a lower ridge, bruised but not melted."),
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
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		useRope = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "rope", amount = -1},
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 3, targets = cinematicMapHelper.PartyRandom(1)},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)

	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
