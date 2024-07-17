


do 
	local quest = helper.QuestDefinition();
	quest.id = 'CliffRitual'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Cliff Ritual"),
						            text = || __D(2, "A group of cultists is performing a ritual at the top of a cliff. Nothing good could come from this.\n\nWe can't get there, but we might be able to interfere with the ritual from our position, nonetheless."),
						    		icon = || "Asst_CliffRitual",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Chuck rocks at them."),
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
										            text = || __D(4, "We grabbed the biggest rocks we could find and chucked them up at the cultists, successfully breaking their concentration.\n\nStopping the ritual in such a silly way made us laugh for a while before moving on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
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
										            text = || __D(5, "We started chucking big rocks up at the cultists, but some of them ended up falling back down on our heads.\n\nAfter hurting ourselves a few times, we gave up and moved on without interrupting the ritual."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Interrupt from afar."),
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
										            text = || __D(7, "We surprised the cultists by raining a volley of projectiles toward the center of the ritual until they fled from the cliff.\n\nAfter seeing that they wouldn't return, we resumed our journey."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedSuccess,
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
										            text = || __D(8, "We attempted to break the cult's concentration by shooting at them for a while, but none of our projectiles reached them.\n\nDefeated, we moved on and the ritual continued uninterrupted."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We decided not to mess with the cult and moved on. We'll have our chance to stop them for good later on our adventure."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {},
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
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and (config.rewards.starXp.eHigh() + config.rewards.starXp.eLow()) or (params.normal and config.rewards.starXp.eHigh() or (config.rewards.starXp.eMid()))},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
		}),
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		rangedSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),
		rangedFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
