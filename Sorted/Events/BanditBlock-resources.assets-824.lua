

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BanditBlock'
	quest.visual = "Bandit"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Bandit Roadblock"),
						            text = || __D(2, "We come across a group of bandits blocking the road.\n\nThey haven't seen us yet, but there are too many of them to beat in a fight, and they will most likely demand a toll."),
						    		icon = || "Asst_BanditBlock",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Sneak past them."),
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
										            text = || __D(4, "We moved along the forest edge using the dense bushes as cover until we were safely past the bandits."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthSuccess,
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
										            text = || __D(5, "We attempted to sneak past the bandits but were immediately spotted by them.\n\nThey shot a heavy onslaught of bolts at us, but we eventually managed to escape their reach."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Convince them\nto let you\nthrough."),
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
										            text = || __D(7, "Putting our charm to the test, we managed to convince the bandits that they shouldn't interfere with our mission to take down the Unblinded.\n\nThey eventually let us through."),
										            who = || "mapCinematicId",
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
										            text = || __D(8, "We tried to convince the bandits to let us through, but they simply laughed and took all the loot they could find on us, as well as some of our weapons."),
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
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 25,
		                                    text = || __R(9, "Pay the toll."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We walked toward the bandits and paid the customary bandit toll.\n\nThey grinned, counting our coins as they let us through."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.payToll,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Take a detour."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "We decided to look for an alternative route.\n\nIt was more tiring than simply passing through the bandits, but definitely safer."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.detour,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {

		stealthSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		stealthFailure = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -(cinematicMapHelper.Guild().GetLoot()/2)},
			{type="unit.attribute", kind = "baseDamage", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		payToll = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -25},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		detour = cinematicMapHelper.Result(|params| {
			
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	
end
