

do 
	local quest = helper.QuestDefinition();
	quest.id = 'InnerDemon'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Inner Demon"),
						            text = || __D(2, "All of a sudden, one of us starts to writhe on the ground, muttering words in a guttural voice.\n\nJust as we notice their now possessed face, they immediately start attacking us!"),
						    		icon = || "Asst_InnerDemon",
						    		who = || "mapCinematicId",
						            children = {
						           		
						           		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Cleanse with light!"),
						    				challenge = {
						    					requirements =  |t| t("ct_holy")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We cast the power of light on our possessed friend, successfully forcing the demon to leave their body and flee through a fiery portal."),
										            who = || "mapCinematicId",
										            children = {
										            	{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.holySuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(5, "It took a while to free our friend using the power of light, giving the possessing demon enough time to injure some of us before fleeing."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.holyFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    subtype = "item",
		                                    item = || "rope",
		                                    text = || __R(6, "Tie them down!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We pinned the hero down and restrained them using one of our ropes.\n\nAfter a while throwing insults and curses at us, a frustrated demon emerged and fled through a fiery portal."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useRope,
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
								            type = DialogType.Response,
								            text = || __R(8, "Knock them out!"),
								    		who = || "mapCinematicId",
								    		children = {
									            {
										            type = DialogType.Dialog,
										            text = || __D(9, "We had no choice but to knock our possessed friend out, making a demon emerge and flee through a fiery portal.\n\nAfter our friend came to, we had to explain the reason for the bump on their head."),
										    		who = || "mapCinematicId",
										    		children= {
										    			{
												            type = DialogType.custom,
												            subtype = "rewards",
												            rewards = || quest.results.default,
												    		rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
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
		
		holySuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
		holyFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		useRope = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "rope", amount = -1},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 3, targets = cinematicMapHelper.PartyRandom(1)},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
