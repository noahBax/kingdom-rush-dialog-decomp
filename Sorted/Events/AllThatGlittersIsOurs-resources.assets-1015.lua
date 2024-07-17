


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AllThatGlittersIsOurs'
	
	
	quest.encounters = {"combat_allThatGlitters"}
	quest.tags = {"EMERGENT", "TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "All that Glitters ... Is Ours!"),
						            text = || __D(2, "As we walk through the forest, rustling sounds coming from nearby bushes catch our attention.\n\nBefore we know it, a couple of little nightshades jump from our backpacks with the Ashervan amulet in their hands, hastily running into the woods."),
						    		icon = || "Asst_Nightshades",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						            		type = DialogType.Custom,
											subtype= "rewards",
											rewards= || quest.results.theft,
		    								rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
							    			children = {
							    				{
							    					type = DialogType.Dialog,
							                   		text = || __D(3, "What should we do?"),
									    			who = || "mapCinematicId",
								            		children = {
									    				{
									    					type = DialogType.Response,
								    						condition = || cinematicMapHelper.HeroByTag("ct_athletics") != nil,
		                                   					who = || cinematicMapHelper.HeroByTag("ct_athletics").GUID,
								    						text = || __R(4, "Run after them!"),
								    						children = {
																{
												            		type = DialogType.Dialog,
												            		text = || __D(5, "We ran after the nightshades and caught up with them just as they reached a group of bigger nightshades and treefolk, who stared angrily at us."),
												            		who = || "mapCinematicId",
												            		children = {
														        		{
														        			type = DialogType.Response,
										                                    text = || __R(6, "Fight them!"),
																		   	exit = true,
																			onChoose = function ()
																			
																			
																			
																			cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_allThatGlitters'}
																			cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
																			end
																		}
														    		}
														    	}
														    }		
									    				},
									    				{
									    					type = DialogType.Custom,
						                                 	subtype = "loot",
		                               					    amount = || 25,
						                                    text = || __R(7, "Barter with them."),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "We offered them some shiny coins in exchange for the stolen item.\n\nThe young sprouts hesitated for a moment before tossing it back to us and snatching the coins from our hands, then running quickly into the forest."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.barterWithTheShades,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										    				subtype = "diceChallenge",
										    				text = || __R(9, "Trick them."),
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
														            text = || __D(10, "We quickly cast some colorful spells to catch their attention.\n\nOnce they were entranced enough, we seized them and took back our item as they, scared, ran back into the forest."),
														            who = || "mapCinematicId",
														            children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.magicSuccess,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
														            text = || __D(11, "We tried to distract them with some improvised magic spells, but the little nightshades seemed unimpressed, laughing and getting lost in the thick forest shortly after.\n\n\"Well, there goes the amulet...\"."),
														            who = || "mapCinematicId",
														            children = {
														            	{
														            		type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.magicFailure,
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
									    					type = DialogType.Response,
						                                    text = || __R(12, "Give up the chase."),
						                                    exit = true
									    				}
							    					}
							    				}
							    			}	
						            	}
						        	}
						        }
						    })

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
			cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		theft = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "ashervanAmulet", amount = -1 },
			}),
		barterWithTheShades = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -25 },
			{type="item", itemId = "ashervanAmulet", amount = 1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "ashervanAmulet", amount = 1 },
			}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", itemId = "ashervanAmulet", amount = 1 },
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),

	}

	quest.interruptByChance = || helper.PriorityAndSlots(cinematicMapHelper.HasItemInInventory("ashervanAmulet") and 3 or 0, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;

	quest.revealDistance = 2

end
