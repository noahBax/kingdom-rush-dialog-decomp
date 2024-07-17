

do 
	local quest = helper.QuestDefinition();
	quest.id = 'MagicBarrier'
	quest.visual = "GlareAltar"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Magic Barrier"),
						            text = || __D(2, "Our path is blocked by an enormous magic barrier sustained by a pillar on either side.\n\nBy the looks of it, it seems to be set up by the cult."),
						    		icon = || "Asst_MagicBarrier",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Destroy the pillars."),
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
										            text = || __D(4, "We destroyed the pillars effortlessly, making the barrier vanish without delaying our adventure any longer."),
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
										            text = || __D(5, "After a long while trying to shatter the pillars, we managed to resume our journey, but with now exhausted arms."),
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
						    				text = || __R(6, "Disenchant it."),
						    				challenge = {
						    					requirements =  |t| t("ct_magic")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "As we were beginning to understand the cult's magic, we were able to cast a spell that sealed the pillar's energy in, making the barrier vanish."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicSuccess,
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
										            text = || __D(8, "We cast a spell to seal in the barrier's energy source, but the clash of magic resulted in a wave of energy that knocked us out.\n\nWith the barrier gone, we resumed our journey after regaining our senses."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Run through it."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "Not wanting to waste any time on this setback, we ran through it together, hoping for the best.\n\nWe felt a burning pain as we crossed to the other side, but were able to continue traveling soon after."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.runThrough,
										    				rewardsParams = || {},
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
			                                    	text = || __D(12, "As the pillar's magic seemed too powerful for us to handle, we tried looking for another path, which we found after a long time walking and climbing the wasteland's unforgiving terrain."),
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
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		mightFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
		}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets =  cinematicMapHelper.Party()},
		}),

		runThrough = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets =  cinematicMapHelper.Party()},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
	quest.canHaveInterrupt = false;
	quest.revealDistance = 1
end
