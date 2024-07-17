

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CrystallineCascade'
	quest.visual = "SilveroakPond"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            id = "start",
						            narrator = || __N(1, "Crystalline Cascade"),
						            text = || __D(2, "We reach a beautiful pond surrounded by all kinds of vegetation, with a gentle cascade pouring into it. It looks peaceful enough to rest for a while."),
						    		icon = || "Asst_Waterfall",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				condition = || cinematicMapHelper.CurrentQuestStatus().context.GetInt("checked") != 1,
						    				text = || __R(3, "Investigate the waterfall."),
						    				challenge = {
						    					requirements =  |t| t("ct_perception")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "Following a hunch, we carefully inspected behind the waterfall and found a small cave with some goods inside. Lucky us!"),
										            who = || "mapCinematicId",
										            children = {
												        {
															type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.investigateSuccess,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("checked", 1),
															jumpTo = "return"
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(5, "We felt there might be something behind the curtains of water, but after a while we weren't able to find anything, so we gave up our search."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
										    				text = || __R(6, "Return to the pond."),
										    				onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("checked", 1),
										    				jumpTo = "return"
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Rest."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We decided to set up a simple camp and rest for a few hours, enjoying the scenery. Once we felt our energies replenished, we moved on from the place."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rest,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Meditate."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "The beauty of the place seemed perfect to stop for a minute to relax and look into ourselves amidst all the chaos in the world. Once our minds were clearer, we moved on."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.meditate,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Keep moving."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "Even though the place looked nice, we decided to not waste any time and kept marching on."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                },
		                                {
								            type = DialogType.Dialog,
								            id = "return",
								            text = || __D(13, "We returned to the pond."),
								    		who = || "mapCinematicId",
								    		inheritFrom = "start"
								    	}
						        	}
						        }
						    })

	quest.results = {
		investigateSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount =  config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midLoot", quantity = || 1, slot = 1},
			})},
			}),
		rest = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		meditate = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
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
