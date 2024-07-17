

do 
	local quest = helper.QuestDefinition();
	quest.id = 'GoldFever'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Gold Fever"),
						            text = || __D(2, "A brief but strong tremor surprises us as we are walking along a narrow ledge.\n\nWe manage to stay safe, but many of our belongings fall down onto a rocky platform in a lava river right below us."),
						    		icon = || "Asst_Landslide",
						    		who = || "mapCinematicId",
						            children = {
							    		{
											type = DialogType.Custom,
											subtype= "rewards",
											rewards= || quest.results.loseGold,
						    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
								            children = {
												{
							    				type = DialogType.Dialog,
							                    text = || __D(3, "What should we do?"),
							                    who = || "mapCinematicId",
							    				children = {
											    		{
										    				type = DialogType.Custom,
										    				subtype = "diceChallenge",
										    				text = || __R(4, "Jump down to recover them!"),
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
														            text = || __D(5, "In an amazing display of acrobatic skills, one of us swiftly jumped down to the platform, threw our belongings back up to us, and jumped back to safety before the nearby heat could affect them."),
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
														            text = || __D(6, "One of us jumped down to retrieve the items, but their clumsiness resulted in a sprained ankle, after which lots of our goods fell back down into the lava as our companion tried to throw them up to us."),
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
										    				subtype = "item",
										                    item = || "rope",
										                    text = || __R(7, "Descend safely!"),
										    				children = {
																{ 
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "Using one of our ropes, we managed to safely get to the platform below and retrieve some of our goods.\n\nSadly, some of our goods fell back down into the lava on the way up."),
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
						                                    text = || __R(9, "Let it go."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "We thought it wasn't worth risking our health to recover some goods, so we accepted the loss and moved on."),
														    		who = || "mapCinematicId",
														    		exit = true
																    
																}
													        }
						                                }
					                                }
						    					}
					    					}
					    				}
						        	}
						        }
						    })

	quest.results = {
		
		athleticsSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
		}),
		athleticsFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = {params.hero}},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
		}),

		useRope = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "rope", amount = -1},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
		}),


		loseGold = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -config.rewards.loot.high()},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
