

do 
	local quest = helper.QuestDefinition();
	quest.id = 'ObsidianCave'
	quest.visual = "DarkCave"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Obsidian Cave"),
						            text = || __D(2, "As we travel through a hot and oppressive cave, we find some cult-related writings carved on a big obsidian stone.\n\nWe feel curious about their meaning, but the heat is starting to weigh on us."),
						    		icon = || "Asst_ObsidianCave",
						    		who = || "mapCinematicId",
						            children = {

								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Decipher them."),
						    				challenge = {
						    					requirements =  |t| t("ct_knowledge") and t("ct_legend")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We translate the writings and, after a brief moment, the big stone moves aside!"),
										            who = || "mapCinematicId",
										            children = {
												        {
												            type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.knowledgeSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												            children = {
													            {
														            type = DialogType.Dialog,
														            text = || __D(5, "The rock covered the entrance to a small chamber containing a sturdy chest and many obsidian tools.\n\nWe are amazed but also start to feel suffocated...."),
														    		who = || "mapCinematicId",
														            children = {
														            	{
																            type = DialogType.Custom,
														    				subtype = "diceChallenge",
														    				text = || __R(6, "Break the chest!"),
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
																		            text = || __D(7, "We quickly broke the chest to find a decent amount of loot and some items inside.\n\nWe grabbed what we could and hurried to get out of the cave."),
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
																		            text = || __D(8, "We tried to crack the chest open, but the more strikes it took, the more exhausted we got.\n\nEventually, we decided to abandon the chest and get out of the cave."),
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
										                                    item = || "crowbar",
										                                    text = || __R(9, "Open the chest."),
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(10, "We forced the chest's locks and found a decent amount of loot and some items inside.\n\nWe grabbed what we could and got out of the cave quickly."), 
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.useCrowbar,
																		    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																				    		exit = true
																						}
																		        	}
																				}
																	        }
										                                },

										                                {
										                                    type = DialogType.Response,
										                                    condition = || cinematicMapHelper.HeroByTag("ct_craft") != nil,
						                                   					who = || cinematicMapHelper.HeroByTag("ct_craft").GUID,
										                                    text = || __R(11, "Improve your weapons."),
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(12, "We decided to invest our time there improving some of our weapons with the high-quality tools.\n\nIt took a bit longer than expected, but it was worth it overall."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.improveWeapons,
																		    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																		    				exit = true
																						}
																		        	}
																				}
																	        }
										                                },

																	    {
										                                    type = DialogType.Response,
										                                    text = || __R(13, "Just leave."),
																		   	who = || "mapCinematicId",
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(14, "Unwilling to faint from overheating, we decided to ignore the chamber and got out of the cave as soon as possible."),
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
										        },

										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(15, "We tried chanting the words on the stone in many different ways, but nothing seemed to happen.\n\nWe moved on without even knowing what we'd done back there."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.knowledgeFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(16, "Just move on."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(17, "Unwilling to faint from overheating, we decided to ignore the writings and got out of the cave as soon as possible."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						    	}
						    })

	quest.results = {

		knowledgeSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
		}),
		knowledgeFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
		}),
		
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midLoot", quantity = || 1, slot = 1},
			})},
		}),
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),

		useCrowbar = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "crowbar", amount = -1},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midLoot", quantity = || 1, slot = 1},
			})},
		}),

		improveWeapons = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "armor_max", amount = 1, targets =  cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},

		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
