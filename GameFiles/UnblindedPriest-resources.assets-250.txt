


do 
	local quest = helper.QuestDefinition();
	quest.id = 'UnblindedPriest'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Enigma"
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS"}
	quest.encounters = {}


		local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            id = "start",
						            narrator = || __N(1, "The Unblinded Priest"),
						            text = || __D(2, "Beside a village well, a man in purple robes is preaching to the villagers.\n\n\"...and by its ocular grace, we shall become one mind, connected in everlasting bliss....\""),
						    		icon = || "Asst_Cultist",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 10,
		                                    text = || __R(3, "Donate\nto the preacher."),
		                                    children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "\"The Unblinded appreciate your contribution.\nMay lies never cloud your eyes,\"\nsaid the preacher as he put away our pouch."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.donate,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Talk to\nthe priest."),
		                                    children = {
												{
													type = DialogType.Dialog,
													id = "talk",
			                                    	text = || __D(6, "The preacher looks at us, grinning from ear to ear.\n\n\"How may I open your eyes, travelers?\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
															text = || __R(7, "Ask about his\nchurch."),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(8, "\"We are the Unblinded.\n\nOur following finds bliss in surrendering their individual wants in favor of the truth the Eye offers.\""),
														    		who = || "mapCinematicId",
														    		children = {
																		{
																			type = DialogType.Response,
																			text = || __R(9, "Mmhmm..."),
																			jumpTo = "talk"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(10, "Ask about\nhis leader."),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(11, "\"Our leader's mind is almost one with our ocular divinity.\n\nSimple mortals cannot understand the will of the Overseer, but the visions it gives our leader show us the way.\""),
														    		who = || "mapCinematicId",
														    		children = {
																		{
																			type = DialogType.Response,
																			text = || __R(12, "Mmhmm..."),
																			jumpTo = "talk"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(13, "Ask about him."),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(14, "\"Me? I'm but a humble servant of the Overseer's will.\n\nOne day, if I procure enough followers, I shall be allowed to raise an obelisk and become exalted.\""),
														    		who = || "mapCinematicId",
														    		children = {
																		{
																			type = DialogType.Response,
																			text = || __R(15, "Mmhmm..."),
																			jumpTo = "talk"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(16, "Enough questions."),
												    		jumpTo = "return"
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(17, "Tell him to\nshut up."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(18, "We shouted at the preacher, telling him to shut up, but as soon as we opened our mouths, the villagers started booing and hurling tomatoes at us.\n\nWe had to leave the village before things got out of hand."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.shutUp,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(19, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(20, "We listened to the preacher, learning a bit more about his beliefs before moving on."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.leave,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
						        	}
						        },
						        {
						            type = DialogType.Dialog,
						            id = "return",
						            narrator = || __N(21, "The Unblinded Priest"),
						            text = || __D(22, "The preacher continues addressing the crowd, gazing at us every now and then.\n\n\"...to free ourselves of the troubles of uncertainty...\""),
						    		icon = || "Asst_Cultist",
						    		who = || "mapCinematicId",
						    		inheritFrom = "start"
						    	}
						    })

	quest.results = {
		shutUp = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			}),
		donate = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -10 },
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
			
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		leave = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end),		
									cinematicMapHelper.Instant(|| cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", nil))
								}))

	quest.revealDistance = 1

	helper.AddQuest(quest)
end
