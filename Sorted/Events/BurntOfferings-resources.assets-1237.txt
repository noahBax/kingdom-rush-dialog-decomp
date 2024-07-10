


do 
	local quest = helper.QuestDefinition();
	quest.id = 'BurntOfferings'
	quest.visual = "WandererMage"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"EMERGENT", "TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Burnt Offerings"),
						            text = || __D(2, "Next to a tree, we found a rustic altar made of wood and bone.\n\nAt its center, there is a bowl with ashes inside."),
						    		icon = || "Asst_BurnOfferings",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                            	    type = DialogType.Response,
		                            	    text = || __R(3, "Examine it."),
		                            	    condition = || cinematicMapHelper.HeroByTag("ct_knowledge") != nil,
		                            	    who = || "mapCinematicId",
										   	children = {
									   			{
									   				type = DialogType.Dialog,
							                   		text = || __D(4, "We inspected the altar and discovered that the contents of the bowl were the remains of an offering.\nThe altar itself was of Ashervan craft."),
									    			who = || "mapCinematicId",
									    			children = {
									    				{
															type = DialogType.Custom,
		                                    				subtype = "item",
		                                    				item = || "food",
		                                   					text = || __R(5, "Make an offering."),
		                                    				who = || "mapCinematicId",
		                                    				children = {
																{
																	type = DialogType.Dialog,
							                   						text = || __D(6, "We burned some of our provisions at the altar.\nWe felt a warm breeze flow between us. It had been accepted."),
									    							who = || "mapCinematicId",
									    							children = {
																		{
									    									type = DialogType.Custom,
									    									subtype = "rewards",
									    									rewards = || quest.results.makeOffering,
									    									rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                   					text = || __R(7, "Disenchant the altar."),
		                                   					condition = || cinematicMapHelper.HeroByTag("ct_magic") != nil,
		                                  					who = || cinematicMapHelper.HeroByTag("ct_magic").GUID,
		                                    				children = {
																{
																	type = DialogType.Dialog,
							                   						text = || __D(8, "We disenchanted the altar in order to neutralize the Ashervan mystic forces at work.\n\nThe air felt lighter afterwards."),
									    							who = || "mapCinematicId",
									    							children = {
																		{
									    									type = DialogType.Custom,
									    									subtype = "rewards",
									    									rewards = || quest.results.disenchantAltar,
									    									rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                					text = || __R(9, "Leave."),
		                                					who = || "mapCinematicId",
									   						children = {
																{
																	type = DialogType.Dialog,
							                   						text = || __D(10, "We had no desire to meddle with unknown powers, so we left."),
									    							who = || "mapCinematicId",
									    							exit = true
																}
															}
						                				}
													}
												}
					                		}
						        		},	
					                	{
	                                		type = DialogType.Response,
	                                		text = || __R(11, "Destroy it."),
	                                		who = || "mapCinematicId",
								   			children = {
												{
													type = DialogType.Dialog,
						                   			text = || __D(12, "We didn't dare leave the altar standing.\n\nWe tore it apart so it couldn't be used by anybody else.\n\nThe wind whispered ominously as we departed."),
								    				who = || "mapCinematicId",
								    				children = {
														{
								    						type = DialogType.Custom,
								    						subtype = "rewards",
								    						rewards = || quest.results.destroyAltar,
								    						rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
	                                		text = || __R(13, "Ignore it."),
	                                		who = || "mapCinematicId",
								   			children = {
												{
													type = DialogType.Dialog,
						                   			text = || __D(14, "We had no desire to meddle with unknown powers, so we left."),
								    				who = || "mapCinematicId",
								    				exit = true
												}
											}
					                	},
						        	}
						    	}
							})

	quest.results = {
		makeOffering = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		disenchantAltar = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			}),
		destroyAltar = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
