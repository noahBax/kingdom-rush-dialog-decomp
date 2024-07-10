


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AnUnexpectedFeast'
	quest.visual = "SilveroakSylvanOutpost"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "An Unexpected Feast"),
						            text = || __D(2, "While making our way through the woods, we end up following a delicious, almost otherworldly scent.\n\nAmidst the trees, we find three Sylvan elves setting a table full of exotic delicacies.\n\n\"Come, take a seat,\" they say with a warm smile."),
						    		icon = || "Asst_UnexpectedFeast",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                type = DialogType.Response,
		                                text = || __R(3, "Inspect the food."),
		                                condition = || cinematicMapHelper.HeroByTag("ct_perception") != nil,
		                                who = || cinematicMapHelper.HeroByTag("ct_perception").GUID,
		                                children = {
									   		{
									   			type = DialogType.Dialog,
							                   	text = || __D(4, "We poked at the food in disbelief. A feast in the middle of the corrupted forest? That sounded too good to be true.\n\nThere was something weird about the smell of the fruit; it was far too sweet, but it still looked really inviting. Maybe we were being too cautious."),
									    		who = || "mapCinematicId",
									    		children = {
									    			{
						    							type = DialogType.Custom,
						    							subtype = "diceChallenge",
						    							text = || __R(5, "Look for traces of magic."),
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
										           				text = || __D(6, "Our magic revealed that the feast was actually the rotten carcasses of various forest fauna.\n\nTheir trick being exposed, the elves shrieked, revealing themselves as evil witches!\n\nWe fought them off and escaped unscathed."),
										           				who = || "mapCinematicId",
										           				children = {
												       				{
										    							type = DialogType.Custom,
										    							subtype = "rewards",
										    							rewards = || quest.results.magicSuccess,
										    							rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            			text = || __D(7, "We didn't find anything that seemed amiss at first glance, so we proceeded. We only managed to eat a little before the elves shrieked in rage, revealing themselves as evil witches!\n\nWe barely managed to repel their attack and escape, but not without some injury."),
										            			who = || "mapCinematicId",
										            			children = {
												        			{
										    							type = DialogType.Custom,
										    							subtype = "rewards",
										    							rewards = || quest.results.magicFailure,
										    							rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    					exit = true
																	}
												    			}
										        			}
						    							}
							    					},
									    			{
									    				type = DialogType.Response,
		                                   				text = || __R(8, "Eat anyways."),
		                                    			who = || "mapCinematicId",
		                                    			children = {
															{
																type = DialogType.Dialog,
							                   					text = || __D(9, "We ate with caution. After a while, the food started to taste sour and stink. The feelings of nausea were tolerable, but we soon passed out.\n\nWe woke up hours later, feeling battered. There was no sign of the elves and their table."),
									    						who = || "mapCinematicId",
									    						children = {
																	{
									    								type = DialogType.Custom,
									    								subtype = "rewards",
									    								rewards = || quest.results.eatAnyways,
									    								rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    						exit = true
											    					}
											    				}		
															}
														}
													},
													{
		                              					type = DialogType.Response,
		                                				text = || __R(10, "Leave."),
		                                				who = || "mapCinematicId",
									   					children = {
															{
																type = DialogType.Dialog,
							                   					text = || __D(11, "We couldn't get past our suspicions, so we decided to take our leave. Our hosts insisted that we stay with them, but we paid no heed.\n\nWe went back to the path with our stomachs empty."),
									    						who = || "mapCinematicId",
									    						children = {
																	{
									    								type = DialogType.Custom,
									    								subtype = "rewards",
									    								rewards = || quest.results.leave,
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
		                                text = || __R(12, "Enjoy the feast."),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(13, "We ate like our lives depended on it. After a short while, the food started to taste sour and stink. We felt sick and nauseated, and everything went dark.\n\nWe woke up hours later, battered and weakened. There was no sign of the elves and their table."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.enjoyFeast,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
													}
												}
											}
										}
						            },
						            {
		                                type = DialogType.Response,
		                                text = || __R(14, "Decline the invitation."),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(15, "We declined the elves' invitation as we had to press on to reach the heart of the forest.\n\nWe left the hosts to enjoy their meal."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.declineInvitation,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                }
						        	}
						        },
						    })

	quest.results = {
		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		eatAnyways = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			}),
		leave = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		enjoyFeast = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			
			}),
		declineInvitation = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
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
