



do 
	local quest = helper.QuestDefinition();
	quest.id = 'LinireanCamp'
	quest.visual = "MercenaryCamp"
	quest.kindFlag = "Recruit"
	quest.encounters = {}
	quest.tags = {"RECRUIT","FIXED","NORMAL","TERRAIN_PLAINS", "TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            id = "noGeraldIntro",
						            narrator = || __N(1, "Linirean Camp"),
						            condition = || (cinematicMapHelper.HeroByTag("Gerald") == nil) and (cinematicMapHelper.Guild().context.GetInt("linked.hasLinireanCampQuest") != 1),
						            text = || __D(2, "We arrive at the gates of a camp showing Linirean banners on the palisade.\n\nThe gates are closed and we can't make out what might be happening inside.\n\nA couple of guards stand by the gate."),
						    		icon = || "Asst_MercenaryCamp",
						    		who = || "mapCinematicId",
						            children={
							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 25,
											text = || __R(3, "Bribe the guards."),
		                                    children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We discreetly slipped a gold pouch into one of the guards' pockets and walked inside the camp."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useLoot,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		jumpTo = "stage2"
														}
										        	}
												}
									        }
		                                },
		                                {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Charm your way in."),
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
										            text = || __D(6, "We approached the guards and started sharing some of our adventures with them.\n\nThey were so delighted that they allowed us inside the gates."),
										            who = || "mapCinematicId",
										            children = {
												            {
												            type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sneakSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},

												            children = {
												            	{
													            	type = DialogType.Dialog,
													            	id = "stage2",
														            narrator = || __N(7, "Mercenary Camp"),
														            text = || __D(8, "The mercenaries in this camp are wearing tabards with the colors of Linirea.\n\nThey look well trained and properly fed.\n\nIt seems that they became swords for hire after Vez'Nan's invasion."),
														    		icon = || "Asst_MercenaryCamp",
														    		who = || "mapCinematicId",
														    		children={
																        {
										                                    type = DialogType.Custom,
										                                    subtype = "loot",
										                                    amount = || 25,
										                                    condition = || cinematicMapHelper.HeroByTag("Knight") == nil,
										                                    text = || __R(9, "Hire a novice fighter."),
										                                    children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(10, "We walked toward the commander's tent, gold in hand, looking for a trainee to join our ranks."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.novice,
																		    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																		    				onChoose = function(d,n)
																				            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "novice")
																				            end, 
																				    		exit = true
																						}
																		        	}
																				}
																	        }
										                                },
															    		{
										                                    type = DialogType.Custom,
										                                    subtype = "loot",
										                                    amount = || 150,
										                                    condition = || cinematicMapHelper.HeroByTag("Knight") == nil,
										                                    text = || __R(11, "Hire an experienced fighter."),
										                                    children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(12, "We walked toward the commander's tent, gold in hand, looking for a worthy sword to join our ranks."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.experienced,
																		    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																		    				onChoose = function(d,n)
																				            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "experienced")
																				            end, 
																				    		exit = true
																						}
																		        	}
																				}
																	        }
										                                },
										                                {
										                                    type = DialogType.Response,
										                                    text = || __R(13, "Request a free shield."),
										                                    condition = || cinematicMapHelper.HeroByTag("Gerald") != nil,
										                                    who = || cinematicMapHelper.HeroByTag("Gerald").GUID,
																		   	children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(14, "Gerald asked for a free shield, listing his contributions to the Kingdom of Linirea until the armorsmith's ears were about to bleed.\n\nThe armorsmith sighed and handed Gerald a new shield."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.shield,
																		    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																				    		exit = true
																						}
																		        	}
																				}
																	        }
										                                },
										                                {
										                                    type = DialogType.Response,
										                                    text = || __R(15, "Leave the camp."),
																		    exit = true
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
										            text = || __D(16, "We spent a while unsuccessfully trying to charm the guards with some jokes.\n\nEither they didn't get the punchlines or they just don't enjoy latrine humor."),
										            who = || "mapCinematicId",
										            exit = true
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(17, "Leave."),
										    exit = true
		                                }
							        }
							    },
							    {
						            type = DialogType.Dialog,
						            id = "geraldIntro",
						            narrator = || __N(18, "Linirean Camp"),
						            condition = || (cinematicMapHelper.HeroByTag("Gerald") != nil) and (cinematicMapHelper.Guild().context.GetInt("linked.hasLinireanCampQuest") != 1),
						            text = || __D(19, "We arrive at the gates of a camp showing Linirean banners on the palisade.\n\nThe guards by the gate salute us on our arrival.\n\n\"If it isn't Gerald Lightseeker! What a sight for sore eyes.\n\nPlease come inside, welcome to our humble encampment.\""),
						    		icon = || "Asst_MercenaryCamp",
						    		who = || "mapCinematicId",
						            children={
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(20, "Enter the camp."),
		                                    jumpTo = "stage2" 
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(21, "Leave."),
		                                    exit = true
		                                }
							        }
							    },
						    })

	quest.results = {

		sneakSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		sneakFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			}),
		charmSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		useLoot = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -25},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		novice = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -25},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		experienced = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -150},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		shield = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = 1, targets = {cinematicMapHelper.HeroByTag("Gerald")}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "novice", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionFemaleKnight"}
																				)
																				}
																			)),
									cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "experienced", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionFemaleKnightLvl3"}
																				)
																				}
																			))
								}))

	
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
