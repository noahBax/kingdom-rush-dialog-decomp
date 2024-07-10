


do 
	local quest = helper.QuestDefinition();
	quest.id = 'HeCameFromTheNorth'
	quest.visual = "MountainWanderer"
	quest.kindFlag = "Recruit"
	
	quest.encounters = {}
	quest.tags = {"RECRUIT","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "He Came from the North"),
						            text = || __D(2, "A brawny, bare-chested barbarian kneels over a hare's carcass, skinning it with one of his axes.\n\nThe barbarian looks up at us and grunts \"Who you? You no trolls....\""),
						    		icon = || "Asst_Berserker",
						    		who = || "mapCinematicId",
						            children = {
										{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Ask about his story."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "\"Me? Me proud northern barbarian here to revenge fallen tribespeople, me no flee to north from Dark Army like rest, me face them axes in hands ... berserker fight or die, no run.\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
						                                    type = DialogType.Response,
						                                    condition = || (cinematicMapHelper.HeroByTag("Barbarian") == nil),
						                                    text = || __R(5, "Ask him to join the party."),
														   	children = {
																{
																	type = DialogType.Dialog,
																	condition = || (cinematicMapHelper.HeroByTag("VeznanFaction") == nil),
							                                    	text = || __D(6, "\"Good, me fights against cult with you ... but me seeks Dark Army revenge, you remember.\""),
														    		who = || "mapCinematicId",
														    		onChoose = function(d,n)
														            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruit")
														            end,
														            children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.justXP,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
																    }
																},
																{
																	type = DialogType.Dialog,
																	condition = || (cinematicMapHelper.HeroByTag("VeznanFaction") != nil),
							                                    	text = || __D(7, "\"You friends of Dark Wizard who conquered my home ... I not join.\""), 
														    		who = || "mapCinematicId",
														            children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "diceChallenge",
														    				text = || __R(8, "Try to convince him."),
														    				challenge = {
														    					requirements =  |t| t("ct_social")
														    					},
														    				children = {
																				{
																		            type = DialogType.Dialog,
																		            condition = |d| d.challenge.result == "success",
																		            onEnter = function (d,n)
																					    	d.data.hero = d.challenge.heroesSuccess[0]
																					end,
																		            text = || __D(9, "We explained the importance of our quest and finally managed to convince the barbarian to join us."),
																		            who = || "mapCinematicId",
																		            onChoose = function(d,n)
																		            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruit")
																		            end,
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.socialSuccess,
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
																		            text = || __D(10, "\"No!\nMe not join tyrants.\nGo before I axe!\" said the defiant barbarian before we moved on."),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.socialFailure,
																		    				rewardsParams = |d| {hero = d.data.hero},
																				    		exit = true
																						}
																				    }
																		        }
														    				}
															    		},
															    		{
										                                    type = DialogType.Response,
										                                    text = || __R(11, "Bid him farewell."),
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(12, "We wished the barbarian good fortune on his travels and moved on."),
																		    		who = || "mapCinematicId",
																		    		children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.justXP,
																		    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
						                                    text = || __R(13, "Bid him farewell."),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(14, "We wished the barbarian good fortune on his travels and moved on."),
														    		who = || "mapCinematicId",
														    		children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.justXP,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    text = || __R(15, "Leave him be."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(16, "We nodded at the barbarian and stepped back, trying to avoid fueling his anger by mistake."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
		                            }
						        }
						    })								        





























	quest.results = {
		justXP = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruit", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionBarbarianLvl2"}
																				)
																				}
																			))	
								}))


	helper.AddQuest(quest)
end
