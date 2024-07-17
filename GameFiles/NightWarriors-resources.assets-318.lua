

do 
	local quest = helper.QuestDefinition();
	quest.id = 'NightWarriors'
	quest.visual = "DarkRuins"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Night Warriors"),
						            text = || __D(2, "We spot the ruins of a decrepit building and get closer to inspect it further.\n\nInside, we find a large hall filled with statues of monsters, with a big chest on the opposite side of the room."),
						    		icon = || "Asst_NightWarriors",
						    		who = || "mapCinematicId",
						            children = {
								        
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Open the chest."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
										    		id = "openChest",
			                                    	text = || __D(4, "We decided to open the chest, but as we touched it, a swarm of fierce gargoyles lunged over us.\n\nCompletely outnumbered, we escaped as fast as we could, but not without suffering some scratches and bites first."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.openChest,
										    				rewardsParams = || {},
										    				exit = true
														}
										        	}
												}
									        }
		                                },

								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Analyze the statues."),
						    				condition = || cinematicMapHelper.HeroByTag("ct_perception") != nil,
						    				challenge = {
						    					requirements =  |t| t("ct_perception")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "We analyzed the statues with extreme caution and found out that they were, in fact, gargoyles in their rock form!\n\nWe weren't sure what to do next, but night would soon fall...."),
										            who = || "mapCinematicId",
										            children = {

											            {
						                                    type = DialogType.Response,
						                                    condition = || cinematicMapHelper.HeroByTag("ct_might") != nil,
		                                   					who = || cinematicMapHelper.HeroByTag("ct_might").GUID,
						                                    text = || __R(7, "Destroy them!"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "We decided to destroy them for good, since sooner or later they would surely wreak havoc somewhere.\n\nWith the menace eliminated, we proceeded to loot the chest before continuing our journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.destroyStatues,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Response,
						                                    condition = || cinematicMapHelper.HeroByTag("ct_magic") != nil,
		                                   					who = || cinematicMapHelper.HeroByTag("ct_magic").GUID,
						                                    text = || __R(9, "Seal them!"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "We decided to conjure a barrier magic spell on them to prevent their transformation.\n\nWith the menace under control, we proceeded to loot the chest before continuing our journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.sealStatues,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(11, "Forget it."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(12, "Worried that this venture might not be worth the risk, we decided to return to our path and continue our mission."),
														    		who = || "mapCinematicId",
														    		children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.perceptionSuccess,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(13, "Everything seemed safe enough, so we decided to open the chest.\n\nOnce we touched it, we heard sounds of cracking stone all around us. In an instant, a swarm of fierce gargoyles lunged over us!||Completely outnumbered, we escaped as fast as we could, but not without suffering some scratches and bites first."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.openChest,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(14, "Forget about it."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(15, "Worried that this venture might not be worth the risk, we decided to return to our path and continue our mission."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						    	}
						    })

	quest.results = {

		perceptionSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),

		destroyStatues = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			}),

		sealStatues = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			}),


		openChest = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets =  cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
