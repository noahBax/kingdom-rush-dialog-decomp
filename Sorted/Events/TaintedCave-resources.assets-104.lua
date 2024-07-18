


do 
	local quest = helper.QuestDefinition();
	quest.id = 'TaintedCave'
	quest.visual = "GlareTaint"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Tainted Cave"),
						            text = || __D(2, "After a long while walking through a cave, we find our way blocked by countless wiggling tentacles coming out of the floor and walls.\n\nAs soon as we get close, they start trying to grab us."),
						    		icon = || "Asst_TentacleCave",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "\"Cut 'em down!\""),
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
										            text = || __D(4, "We slashed our way past the various tentacles and kept moving forward as they quickly started to grow back behind us.\n\nIt was an invigorating escape."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
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
										            text = || __D(5, "We tried cutting the tentacles, but they kept quickly growing back and entangling us.\n\nIt took a while to finally get out of the cave."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
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
						                    item = || "torch",
						                    text = || __R(6, "Fend them off!"),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(7, "The heat from our torch seemed to keep the tentacles at bay, allowing us to reach the exit of the cave without major inconvenience."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useTorch,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
											    }
										     },
						    			},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Power through!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "Although the tentacles weren't exactly dangerous by themselves, walking past a number of them proved to be a harder ordeal than we thought, as they kept entangling us and pulling us back.\n\nEventually, we made it out of the cave."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.powerThrough,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
												}
									        }
		                                },

		                               	{
		                                    type = DialogType.Response,
		                                    text = || __R(10, "Turn back."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(11, "Walking through the mass of tentacles seemed like a bad idea, so we went back to where we came from and tried to find another way forward ... which sadly took a lot longer than we expected."),
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
		                                },
						        	}
						        }
						    })

	quest.results = {
		
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		mightFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		useTorch = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "torch", amount = -1},
		}),

		powerThrough = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party(1)},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)

	quest.canHaveInterrupt = false;
	quest.revealDistance = 1

end
