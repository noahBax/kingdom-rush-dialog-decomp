


do 
	local quest = helper.QuestDefinition();
	quest.id = 'ReinforcementsCall'
	quest.visual = "TrollWarrior"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_reinforcementsCall'}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAIN", "BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Call for Reinforcements"),
						            text = || __D(2, "A soldier comes to us for help, as a band of trolls is approaching a human outpost.\n\nWe make haste to the place, but the path has recently been blocked by boulders!"),
						    		icon = || "Asst_SoldierDialog",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Move some boulders!"),
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
										            text = || __D(4, "We quickly moved some boulders aside and arrived just in time to fight the trolls."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(5, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier01", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier02", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("trollAdv", "0")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_reinforcementsCall'}
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
										            text = || __D(6, "We couldn't get past the boulders quickly enough, arriving at the fight a bit too late."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(7, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "3")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier01", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier02", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("trollAdv", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_reinforcementsCall'}
															end	
						                                }
												    }
										        }
						    				}
							    		},

							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(8, "Find another path!"),
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
										            text = || __D(9, "We took a short detour and found a way to arrive at the fight just in time."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(10, "Charge!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "2")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier01", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier02", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("trollAdv", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_reinforcementsCall'}
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
										            text = || __D(11, "It took a bit too long for us to find another path to the outpost, and we arrived at the fight a bit too late."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(12, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "4")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier01", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier02", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("trollAdv", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_reinforcementsCall'}
															end	
						                                }
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "pick",
		                                    text = || __R(13, "Break the boulders!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(14, "After a while smashing through the boulders, we managed to get to the other side."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.usePick,
										    				rewardsParams = || {},
												    		children = {
												    			{
																	type = DialogType.Dialog,
							                                    	text = || __D(15, "Immediately, we charged to protect the rest of the soldiers!"),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Response,
																            text = || __R(16, "Fight!"),
																            exit = true,
																			onChoose = function ()
																				cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																				cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier01", "1")
																				cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier02", "0")
																				cinematicMapHelper.CurrentQuestStatus().context.SetObject("trollAdv", "1")
																				cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_reinforcementsCall'}
																			end
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
								            text = || __R(17, "Take a detour."),
								            exit = true,
											onChoose = function ()
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "5")
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier01", "0")
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("soldier02", "0")
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("trollAdv", "1")
												cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_reinforcementsCall'}
											end	
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
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets =  cinematicMapHelper.PartyRandom(1)},
			{type="checkInjuries"},
			}),
		
		
		
		
		usePick = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "pick", amount = -1 },
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	
	
	
	

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
