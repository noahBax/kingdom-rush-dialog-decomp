


do 
	local quest = helper.QuestDefinition();
	quest.id = 'DialogueWithTheStars'
	quest.visual = "SilveroakAshTent"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "A Dialogue with the Stars"),
						            text = || __D(2, "The moon is shining bright when we find the remains of a destroyed Ashervan Coven altar. At its feet lies an Ashervan witch."),
						    		icon = || "Asst_DyingEnchantress",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                type = DialogType.Response,
		                                text = || __R(3, "Examine the Ashervan witch."),
		                                who = || "mapCinematicId",
									   	children = {
									   		{
									   			type = DialogType.Dialog,
							                   		text = || __D(4, "We were surprised to find that the witch was still alive, mumbling, with her eyes fixed on the sky."),
									    			who = || "mapCinematicId",
									    			children = {
									    				{
									    					type = DialogType.Response,
		                                   					text = || __R(5, "Listen to her ramblings."),
		                                    				who = || "mapCinematicId",
		                                    				children = {
																{
																	type = DialogType.Dialog,
							                   						text = || __D(6, "We stared, puzzled, at the witch as she repeated the same words over and over, each time quieter than the last.\n\nNot being able to understand a word of it, we could not help but feel unsettled about the event and moved on."),
									    							who = || "mapCinematicId",
									    							children = {
																		{
									    									type = DialogType.Custom,
									    									subtype = "rewards",
									    									rewards = || quest.results.listenRamblings,
									    									rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    							exit = true
											    						}
											    					}		
																}
															}
														},
														{
		                                 					type = DialogType.Response,
		                                    				condition = || cinematicMapHelper.HeroByTag("ct_knowledge") != nil,
		                                   					who = || cinematicMapHelper.HeroByTag("ct_knowledge").GUID,
		                                    				text = || __R(7, "Translate her ramblings."),
										   					children = {
																{
																	type = DialogType.Dialog,
			                                    					text = || __D(8, "\"Back to where we belong,\nhearth and heart of bark and moss.\nRiding on the back of starlight beasts\nthat will never mourn our loss.\nDive deep in the sky and\nlet the world follow its course.\"||The witch repeated these words until she breathed no more and her body got covered by a layer of grass and moss, leaving behind a golden amulet.\n\nWhile the meaning was not clear to us, we took the amulet and walked away feeling like we had gained some insight into the Coven."),
										    						who = || "mapCinematicId",
										    						children = {
																		{
										    								type = DialogType.Custom,
										    								subtype = "rewards",
										    								rewards = || quest.results.translateRamblings,
										    								rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    						exit = true
																		}
										        					}
																}
									        				}
		                                				},
													}
												}
											}
						                },
						                {
		                                type = DialogType.Response,
		                                text = || __R(9, "Search the remains for loot."),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(10, "We disregarded the witch and focused on finding any useful valuables.\n\nBy the time we were done, the witch was covered by a layer of thick grass and moss. We carried on, puzzled by the event."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.searchRemains,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                },
						        	}
						        },
						    })

	quest.results = {
		listenRamblings = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		translateRamblings = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "ashervanAmulet", amount = 1},
			}),
		searchRemains = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midLoot" , quantity = || 1, slot = 1},
			})},
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
