


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AshervanSentinels'
	quest.visual = "SilveroakAshTent"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Ashervan Sentinels"),
						            text = || __D(2, "As we round a bend, we make a stop after finding an Ashervan watchtower with two guards surveying the path.\n\nWe shouldn't have much trouble getting past them."),
						    		icon = || "Asst_AshervanSentinels",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Shoot them from afar."),
						    				challenge = {
						    					requirements =  |t| t("ct_ranged")
						    				},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We managed to strike the guards down, and we continued our journey forwards, seemingly undetected."),
										            who = || "mapCinematicId",
										            children = {
												       {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedSuccess,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															onChoose = function ()
																cinematicMapHelper.Guild().context.SetInt("linked.followedByAshervan", 1)
																cinematicMapHelper.Guild().context.SetInt("triggerOn.followedByAshervan", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
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
										            text = || __D(5, "Our aim wasn't as good as we thought, and our projectiles flew past the guards, alerting them to our presence.\n\nImmediately, they started sprinting toward the forest, making some kind of loud howling, which gave us time to move forward."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedFailure,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															onChoose = function ()
																cinematicMapHelper.Guild().context.SetInt("linked.followedByAshervan", 1)
																cinematicMapHelper.Guild().context.SetInt("triggerOn.followedByAshervan", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
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
						    				text = || __R(6, "Sneak past them."),
						    				challenge = {
						    					requirements =  |t| t("ct_stealth")
						    				},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "As much as their eyes were keen, they never noticed us scurrying through the outpost, and we soon left them behind."),
										            who = || "mapCinematicId",
										            children = {
												        {
												        	type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sneakSuccess,
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
										            text = || __D(8, "We clumsily tumbled and fell over some noisy branches, alerting the guards to our presence.\n\nImmediately, they started sprinting toward the forest, making some kind of loud howling, which gave us time to move forward."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sneakFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															onChoose = function ()
																cinematicMapHelper.Guild().context.SetInt("linked.followedByAshervan", 1)
																cinematicMapHelper.Guild().context.SetInt("triggerOn.followedByAshervan", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
															end,	
												            exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Look for another path."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "Unwilling to risk confrontation, we decided to look for another path, and we ended up crossing a thicker area of the forest, full of aggressive, carnivorous plants.\n\nBy the time we reached the other side, the moon was high in the sky."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.lookForAnotherPath,
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
		
		
		
		
		
		
		

		rangedSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		rangedFailure = cinematicMapHelper.Result(|params| {
			
			{type="unit.attribute", kind = "baseDamage", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			}),

		sneakSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		sneakFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(2)},
			}),

		lookForAnotherPath = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
