

do 
	local quest = helper.QuestDefinition();
	quest.id = 'FieldOfThorns2'
	quest.visual = "FieldOfThorns"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS","BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Field of Thorns"),
						            text = || __D(2, "A vast number of withered thorny plants block our path."),
						    		icon = || "Asst_FieldOfThorns",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Hack your way through!"),
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
										            text = || __D(4, "Hacking through the thorns was not as easy as we had expected.##However, we got through unharmed."),
										            who = || "mapCinematicId",
										            children = {
												    {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success1,
										    				onChoose = function(d,n)
										    					print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
												            	cinematicMapHelper.CurrentQuestStatus().context.SetInt("solved", 1)
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
												            end,
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
										            text = || __D(5, "We started hacking through ... but the thorns ... they grew back!##It took a whole day and some bruises, but we eventually got to the other side."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure1,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "torch",
		                                    text = || __R(6, "Buuurrrrn them!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "As soon as the torch touched the thorns, the flames began engulfing the plants.\n\nOnce the fire had died out, the path appeared open, allowing us to move on."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useTorch,
										    				onChoose = function(d,n)
										    					print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
												            	cinematicMapHelper.CurrentQuestStatus().context.SetInt("solved", 1)
												            end,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(8, "Shrink them with magic."),
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
										            text = || __D(9, "We used a nature spell to shrink the thorns and get through, causing the thorns to sprout flowers.##The scent sure was energizing!"),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success2,
										    				onChoose = function(d,n)
										    					print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") +1))
												            	cinematicMapHelper.CurrentQuestStatus().context.SetInt("solved", 1);
												            end,
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
										            text = || __D(10, "We used a relatively weak spell to barely shrink the thorns.##We made it through, but we ended up getting a strange rash from the plants."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure2,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Find a way around!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "We moved around the thorns.##It took more time and it was way more exhausting than we would have wished, but we got past the thorns."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.moveAround,
										    				onChoose = function(d,n)
										    					print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") +1))
												            end,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		success1 = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		failure1 = cinematicMapHelper.Result(|params| {
			
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		success2 = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			}),
		failure2 = cinematicMapHelper.Result(|params| {
			
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(2)},
			}),
		useTorch = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = -1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		moveAround = cinematicMapHelper.Result(|params| {
			
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

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;
	quest.revealDistance = 1

end
