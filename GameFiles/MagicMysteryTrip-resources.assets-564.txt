


do 
	local quest = helper.QuestDefinition();
	quest.id = 'MagicMysteryTrip'
	quest.visual = "SilveroakColorfulTree"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Magical Mystery Trip"), 
						            text = || __D(2, "We happen upon a colorful clearing full of exotic flowers and trees. Some ripe fruits catch our attention thanks to their sweet, appetizing smell.\n\nWe feel oddly compelled to pick some in order to try them out."),
						    		icon = || "Asst_WeirdFruitTree",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Resist the urge."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_wisdom") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_wisdom").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "Our willpower was stronger and we did not let the smell lure us further. We left with no regrets and without trying a single fruit.\n\nOn our way out, we rummaged through the scattered belongings of other adventurers."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.resistUrge,
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
						    				text = || __R(5, "Look for the right fruits."),
						    				challenge = {
						    					requirements =  |t| t("ct_knowledge")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "We recognized the fruits straight away. Although tasty, they had hallucinogenic properties if they were not ripe enough.\n\nWe spent a few minutes collecting the best ones. They tasted incredibly good and made us feel powerful."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.knowledgeSuccess,
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
										            text = || __D(7, "We spent a long time trying to identify the fruits, but they all looked the same to us.\n\nTired and disappointed, we picked those that seemed more lustrous to make a potion, and we moved on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.knowledgeFailure,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
		                                },
		                                {
		                                   	type = DialogType.Response,
		                                    text = || __R(8, "Surrender to temptation."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                		text = || __D(9, "We tried to resist to no avail, and we ended up desperately eating a couple of the strange fruits from the trees.\n\nOur meal was suddenly interrupted by a massive boar charging against us. We fought bravely, only to find out we had been fighting amongst ourselves thanks to the hallucinogenic fruits."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.surrenderTemptation,
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
		resistUrge = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		knowledgeSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		knowledgeFailure = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "unidentifiedPotion", amount = 1 },
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		surrenderTemptation = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
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
