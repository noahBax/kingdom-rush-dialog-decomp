

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheCryingOrc'
	quest.visual = "WandererMage"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Crying Orc"),
						            text = || __D(2, "At night we find a young orc crying over a recently cut tree. He doesn't notice us, and we can't help but wonder how he got lost. On the other hand, it could always be a trap."),
						    		icon = || "Asst_CryingOrc",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                type = DialogType.Response,
		                                text = || __R(3, "Approach him."),
		                                who = || "mapCinematicId",
									   	children = {
									   		{
									   			type = DialogType.Dialog,
							                   	text = || __D(4, "He was pretty much defenseless, as he only carried a set of woodcutting tools, but we walked toward him carefully anyway.\n\n\"Me mean no harm, warriors.... Me strayed too far from me encampment, can't find me way back. Please ... help!\""),
									    		who = || "mapCinematicId",
									    		children = {
									    			{
									    				type = DialogType.Response,
		                                   				text = || __R(5, "Give him directions."),
		                                    			who = || "mapCinematicId",
		                                    			children = {
															{
																type = DialogType.Dialog,
							                   					text = || __D(6, "We pointed him toward the path from which we had come. Luckily, he could follow it to a safer place.\n\nHe thanked us and departed."),
									    						who = || "mapCinematicId",
									    						children = {
																	{
									    								type = DialogType.Custom,
									    								subtype = "rewards",
									    								rewards = || quest.results.giveDirections,
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
	                                    				item = || "torch",
	                                   					text = || __R(7, "Give him directions and help."),
	                                    				who = || "mapCinematicId",
	                                    				children = {
															{
																type = DialogType.Dialog,
						                   						text = || __D(8, "In addition to pointing him toward the path from which we had come, we gave the orc a torch so he wouldn't get lost again.\n\n\"Thank you! You are good adventurers!\" he said happily.\n\nIn exchange, he handed us some of his tools, which could be used to sharpen our weapons."),
								    							who = || "mapCinematicId",
								    							children = {
																	{
								    									type = DialogType.Custom,
								    									subtype = "rewards",
								    									rewards = || quest.results.giveDirectionsTorch,
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
		                                text = || __R(9, "Scare him off."),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(10, "We lunged toward the orc, screaming at the top of our lungs, which prompted him to dart away toward the thick of the forest, leaving behind some useful coins."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.scareHimOff,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                },
						                {
		                                	type = DialogType.Response,
		                                	text = || __R(11, "Ignore him."),
		                                	who = || "mapCinematicId",
									   		children = {
												{
													type = DialogType.Dialog,
							                   		text = || __D(12, "We couldn't afford to lose more time, so we left the orc alone. He would surely find a way back to his own ... or not."),
									    			who = || "mapCinematicId",
									    			exit = true
												}
											}
						                },
						        	}
						        },
						    })

	quest.results = {
		giveDirections = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		giveDirectionsTorch = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = -1 },
			{type="item", itemId = "sharpeningStone", amount = 1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		scareHimOff = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 20 },
			}),
		ignoreHim = cinematicMapHelper.Result(|params| {
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
