

do 
	local quest = helper.QuestDefinition();
	quest.id = 'RunAcolyteRun'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Run, Acolyte, Run"), 
						            text = || __D(2, "Out of nowhere, a cultist acolyte crashes straight into one of our group.\n\n\"W-w-wait!\" he says, after we take out our weapons.\n\n\"Don't hurt me, I'm fleeing from 'them' ... they truly are insane! I just want to go home....\""),
						    		icon = || "Asst_RunawayAcolyte",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Ask for information."),
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
										            text = || __D(4, "We hid away and agreed to let him go if he gave us valuable information about the cult's plans, which he did, somewhat hesitantly.\n\n\"By the way, take this ... I won't need it anymore,\" he said before departing."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
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
										            text = || __D(5, "We agreed to do \"Good Guard - Bad Guard\" to interrogate him, but we then argued among ourselves for a while, because we all wanted to be the bad guard.\n\nOnce we came to an agreement, the acolyte was nowhere to be seen."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
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
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Intimidate him!"),
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
										            text = || __D(7, "We cornered him against a wall and told him that whatever pain the cult wanted to inflict on him paled in comparison to what we were capable of.\n\nAfter he spilled the beans about the cult's plan, we let him go."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
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
										            text = || __D(8, "We tried to intimidate the acolyte by grabbing him by the shoulders, but he got even more nervous under our interrogation.\n\n\"Let go of me!\" he said, before landing a sneak stab to free himself and quickly run away."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
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
		                                    text = || __R(9, "Let him go."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "As he seemed to be genuinely scared, we let him escape before we hid away to avoid being discovered by the angry mob of cultists."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												    end,
												    exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "maskTable", quantity = || 1, slot = 1},
			})},
		}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = {params.hero}},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
