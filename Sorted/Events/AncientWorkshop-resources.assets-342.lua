

do 
	local quest = helper.QuestDefinition();
	quest.id = 'AncientWorkshop'
	quest.visual = "DarkCave"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Ancient Workshop"),
						            text = || __D(2, "Inside a nearby cave, we discover what looks like an abandoned forge or workshop from times immemorial.\n\nUnfortunately, the only way to reach it seems to be by hopping across the top of a series of narrow pillars that lead to the center of the cave."),
						    		icon = || "Asst_AncientWorkshop",
						    		who = || "mapCinematicId",
						            children = {

								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Jump across the pillars."),
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
										            text = || __D(4, "We nimbly hop from pillar to pillar until we reach the workshop.\n\nThere are many abandoned goods scattered around!"),
										            who = || "mapCinematicId",
										            children = {
												        {
												            type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												            children = {
													            {
														            type = DialogType.Dialog,
														            text = || __D(5, "Looking around, we notice a broken crane grabbing an enormous boulder that seems to be blocking an entrance."),
														    		who = || "mapCinematicId",
														            children = {
														            	{
																            type = DialogType.Custom,
														    				subtype = "diceChallenge",
														    				text = || __R(6, "Fix the crane."),
														    				challenge = {
														    					requirements =  |t| t("ct_craft") 
														    					},
														    				children = {
																				{
																		            type = DialogType.Dialog,
																		            condition = |d| d.challenge.result == "success",
																		            onEnter = function (d,n)
																					    	d.data.hero = d.challenge.heroesSuccess[0]
																					end,
																		            text = || __D(7, "Using the tools we found around us, we successfully repaired the crane and moved the big rock.\n\nBehind it was a small chamber containing valuables! We took what we could and got out of the cave."),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.craftSuccess,
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
																		            text = || __D(8, "We did a poor job fixing the crane, and it ended up collapsing on top of us when we tried to lift the boulder.\n\nAfter licking our wounds, we moved out of the cave."),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.craftFailure,
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
										                                    item = || "pick",
										                                    text = || __R(9, "Break it apart."),
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(10, "Breaking the giant boulder apart took longer than expected, but was totally worth it, as we found a good deal of valuables in the small chamber behind the rock."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.usePick,
																		    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																				    		exit = true
																						}
																		        	}
																				}
																	        }
										                                },

																	    {
										                                    type = DialogType.Response,
										                                    text = || __R(11, "Move on."),
																		   	who = || "mapCinematicId",
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(12, "We decided to grab what we could find and stop wasting time in the cave."),
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
										            text = || __D(13, "We made a rough misstep on the first pillar, making it fall forward and forcing us to jump back as the pillars fell, one by one, in a domino effect.\n\nAfter collecting ourselves, we resumed our journey."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(14, "Ignore it."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(15, "We decided not to bother wasting time in the cave and kept moving."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						    	}
						    })

	quest.results = {

		athleticsSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midLoot", quantity = || 1, slot = 1},
			})},
		}),
		athleticsFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
		}),
		
		craftSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowPotion", quantity = || 1, slot = 1},
			})},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "buffItem", quantity = || 1, slot = 1},
			})},
		}),
		craftFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},
		}),

		usePick = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "crowbar", amount = -1},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowPotion", quantity = || 1, slot = 1},
			})},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "buffItem", quantity = || 1, slot = 1},
			})},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
