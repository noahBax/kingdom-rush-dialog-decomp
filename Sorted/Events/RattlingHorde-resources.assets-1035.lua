


do 
	local quest = helper.QuestDefinition();
	quest.id = 'RattlingHorde'
	quest.visual = "Obelisk"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_rattlingHorde'}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Rattling Horde"),
						            text = || __D(2, "Walking through some burial grounds, we come across an active obelisk and decide it would be best to take it down.\n\nAs soon as we get closer to it, it starts to glow, as various skeletons start rising from their graves, surrounding us."),
						    		icon = || "Asst_RattlingHorde",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Destroy the obelisk!"),
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
										            text = || __D(4, "We managed to quickly break it down and prepared to fight the approaching skeletons."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(5, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("obelisk", "0")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_rattlingHorde'}
															end	
						                                }
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(6, "The skeletons kept getting closer to us as we tried but failed to destroy the obelisk, so we had to get ready for a dangerous battle."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(7, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("obelisk", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_rattlingHorde'}
															end
						                                }
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Get to safety!"),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_athletics") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_athletics").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We swiftly jumped away from the obelisk and got ready for the incoming enemies in a safer position."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(10, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "2")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("obelisk", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_rattlingHorde'}
															end
						                                }
												    }
										        }
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Run away!"),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "Finding ourselves overwhelmed, we decided to run out of there as fast as we could, until we were out of sight of the enemy.\n\nSadly, we lost some valuables in the process."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),
		
		
		
		
		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="guild.attribute", kind = "loot", amount = -20},
			}),
	}

	
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	
	
	
	

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
