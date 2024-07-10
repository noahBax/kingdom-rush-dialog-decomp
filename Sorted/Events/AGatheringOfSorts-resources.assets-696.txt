

do 
	local quest = helper.QuestDefinition();
	quest.id = 'AGatheringOfSorts'
	quest.visual = "WandererMage"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "A Gathering of Sorts"),
						            text = || __D(2, "We came across the campground of another group of adventurers, lost in the middle of the forest."),
						    		icon = || "Asst_GatheringForest",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                type = DialogType.Response,
		                                text = || __R(3, "Talk to the group."),
		                                who = || "mapCinematicId",
									   	children = {
									   		{
									   			type = DialogType.Dialog,
							                   	text = || __D(4, "We decided to engage the adventurers in a straightforward conversation and ended up setting camp together."),
									    		who = || "mapCinematicId",
									    		children = {
									    			{
									    				type = DialogType.Response,
		                                   				text = || __R(5, "Share stories."),
		                                    			who = || "mapCinematicId",
		                                    			children = {
															{
																type = DialogType.Dialog,
							                   					text = || __D(6, "We spent the night bonding and sharing stories and tactics. In the morning, we parted ways as friends."),
									    						who = || "mapCinematicId",
									    						children = {
																	{
									    								type = DialogType.Custom,
									    								subtype = "rewards",
									    								rewards = || quest.results.shareStories,
									    								rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    						exit = true
											    						}
											    					}		
																}
															}
														},
														{
															type = DialogType.Custom,
		                                    				subtype = "item",
		                                    				item = || "food",
		                                   					text = || __R(7, "Share provisions."),
		                                    				who = || "mapCinematicId",
		                                    				children = {
																{
																	type = DialogType.Dialog,
							                   						text = || __D(8, "Seeing that they were a little light on provisions, we decided to use some of our food to prepare a meal for everyone and replenish our strength."),
									    							who = || "mapCinematicId",
									    							children = {
																		{
									    									type = DialogType.Custom,
									    									subtype = "rewards",
									    									rewards = || quest.results.shareProvisions,
									    									rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    							exit = true
											    						}
											    					}		
																}
															}
														}
													}
												}
											}
						                },
						                {
		                                type = DialogType.Response,
		                                text = || __R(9, "Ignore them."),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(10, "We avoided engaging in conversation, as they looked suspicious to us. We left them behind on their own."),
									    		who = || "mapCinematicId",
									    		exit = true
											}
										}
						            },
						        }
						    },
						})

	quest.results = {
		shareStories = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		shareProvisions = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "food", amount = -1 },
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		ignoreThem = cinematicMapHelper.Result(|params| {
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end)		
								}))
	helper.AddQuest(quest)

	
end
