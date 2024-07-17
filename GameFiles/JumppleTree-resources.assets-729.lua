


do 
	local quest = helper.QuestDefinition();
	quest.id = 'JumppleTree'
	quest.visual = "ForestTree"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Jumpple Tree"),
						            text = || __D(2, "We stand before a colossal jumpple tree.\n\nThese magical fruits are famous for constantly shaking on their branches and for giving those who eat them tremendous amounts of energy."),
						    		icon = || "Asst_MagicTree",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Climb up the tree."),
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
										            text = || __D(4, "We successfully managed to reach one of the tree's lowest branches, and the jumpples were almost in our hands."),
										            who = || "mapCinematicId",
										            children = {
												            {
												            type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.climbSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												            children = {
													            {
														            type = DialogType.Dialog,
														            id = "stage2",
														            text = || __D(5, "Having reached the branch, it was a matter of choosing either to risk it and go for the jumpiest jumpples or to settle for the lowest hanging ones."),
														    		who = || "mapCinematicId",
														            children = {
														            	{
																            type = DialogType.Custom,
														    				subtype = "diceChallenge",
														    				text = || __R(6, "Go for the jumpiest ones!"),
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
																		            text = || __D(7, "With one sure step after another, we were able to reach the greatly sought after jumpples."),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.balanceSuccess,
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
																		            text = || __D(8, "We tried balancing along the branch to reach the jumpples, but as we were about to get them, a misstep showed us the true meaning of gravity."),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.balanceFailure,
																		    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																				    		exit = true
																						}
																				    }
																		        },
																	        }
																	    },
																	    {
										                                    type = DialogType.Response,
										                                    text = || __R(9, "Go for the lowest\nhanging jumpples."),
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(10, "Unwilling to risk getting hurt, we simply grabbed one of the lowest hanging jumpples.\n\nIt didn't look as jumpy as the rest, but it was jumpy nonetheless."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.lowestJumpples,
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
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(11, "We started climbing up the jumpple tree.\n\nBut as we reached one of the lowest branches, it cracked, giving us a quick demonstration of what gravity is all about."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.climbFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "rope",
		                                    text = || __R(12, "Use a rope to climb up."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(13, "We used a rope to climb safely up to one of the lowest branches."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useRope,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		jumpTo = "stage2"
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(14, "Ignore the tree."),
										    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {

		balanceSuccess = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		climbSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		balanceFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="doDamage", amount = 2, targets =  {params.hero}},
			}),
		climbFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="doDamage", amount = 3, targets =  {params.hero}},
			}),
		useRope = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "rope", amount = -1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		lowestJumpples = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
