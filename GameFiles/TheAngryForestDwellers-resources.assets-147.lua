

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheAngryForestDwellers'
	quest.visual = "SilveroakTree"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Angry Forest-Dwellers"),
						            text = || __D(2, "As we make our way through, we are stopped in our tracks by a considerable number of forest-dwellers barricaded behind a fallen tree.\n\n\"No step further, stranger,\" calls a gnome, armed with the rusted remains of a spear. \"We've got enough problems thanks to the Coven, so skedaddle!\""),
						    		icon = || "Asst_ForestDwellers",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Convince them to let you through."),
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
										            text = || __D(4, "We explained our intentions to the forest-dwellers, and they agreed to let us through.\n\n\"If you are to right the Coven's wrongs, then you have our blessing, outsider. But be aware, the forest has many eyes and ears,\" said the gnome."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(5, "\"Don't think you can lie to us! Outsiders are always the same, always hurting the forest! Begone!\" shouted the gnome.\n\nWe decided not to insist on this matter, and we were soon on our way.\n\nThankfully, one of the forest-dwellers was kind enough to provide us with some directions so we didn't get lost."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Force them to let you through."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We had no time to lose, so we tried to coerce the forest-dwellers to let us through.\n\nThey didn't take that kindly, and it all ended in a scuffle.\n\nWe got away with it in the end, at the expense of some bruises and an unflattering curse, courtesy of their leader."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.forceYourWay,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Take a detour."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We didn't even try to negotiate with the forest-dwellers, and we were soon on our way.\n\nWithout clear directions, we roamed through the forest until we found the ruins of an encampment. We rummaged through the broken tents and found a stash of potions."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.detour,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			}),
		forceYourWay = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(2)},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		detour = cinematicMapHelper.Result(|params| {
			
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="item", itemId = "healthPotion", amount = 1 }
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
