


do 
	local quest = helper.QuestDefinition();
	quest.id = 'LostAndFoundPit'
	quest.visual = "SilveroakBlightThorns"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Lost and Found Pit"),
						            text = || __D(2, "We come across a stone pit overrun by thorny brushwood. It doesn't look special, but a glint catches our attention.\n\nWe approach it with caution. It appears that there is loot hidden inside."),
						    		icon = || "Asst_ThornsPit",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                	type = DialogType.Custom,
		                                	subtype = "item",
		                                	item = || "rope",
		                                	text = || __R(3, "Climb into the pit."),
		                                	who = || "mapCinematicId",
									   		children = {
									   			{
									   				type = DialogType.Dialog,
									   				text = || __D(4, "We carefully used a rope to get into the pit. The objects near the surface weren't too impressive, but we grabbed some of them nonetheless."),
													who = || "mapCinematicId",
								            		children = {
									   					{
											   				type = DialogType.Custom,
											   				subtype = "rewards",
															rewards= || quest.results.climbIntoPit,
						    								rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    			children = {
											    				{
												    				type = DialogType.Dialog,
													   				text = || __D(5, "When we started to climb up, golden reflections from beneath the thorny vines blinded us.\n\nThere was more loot in the depths of the pit, but it seemed risky to try to reach it."),
												    				who = || "mapCinematicId",
												            		children = {
													    				{
													    					type = DialogType.Response,
						                                   					text = || __R(6, "Go for it."),
						                                    				who = || "mapCinematicId",
						                                    				children = {
																				{
																					type = DialogType.Dialog,
											                   						text = || __D(7, "We disregarded the thorns and roots piercing our skin, and we practically dived toward the bottom of the pit.\n\nWe climbed out moments later with our pouches full, despite some injuries."),
													    							who = || "mapCinematicId",
													    							children = {
																						{
													    									type = DialogType.Custom,
													    									subtype = "rewards",
													    									rewards = || quest.results.goForIt,
													    									rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															    							exit = true
														    							}
														    						}		
																				}
																			}
																		},
																		{
																			type = DialogType.Response,
					                                   						text = || __R(8, "Give up."),
					                                    					who = || "mapCinematicId",
					                                    					children = {
																				{
																					type = DialogType.Dialog,
										                   							text = || __D(9, "We decided that climbing down further was not worth the risk and left, satisfied with the loot we got."),
												    								who = || "mapCinematicId",
												    								children = {
																						{
												    										type = DialogType.Custom,
												    										subtype = "rewards",
												    										rewards = || quest.results.giveUp,
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
														}
													}
							        			}
					        				}
				        				},
				        				{
                                    		type = DialogType.Response,
                                    		text = || __R(10, "Move on."),
								   			exit = true
	                                	}
				        			}
			        			}
			        		})

	quest.results = {
		climbIntoPit = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midItems", quantity = || 1, slot = 1},
			})},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		goForIt = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "rope", amount = -1 },
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "highItems", quantity = || 1, slot = 1},
			})},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			}),
		
			
			
			
			
		giveUp = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "rope", amount = -1 },
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
