

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Quickcinder'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Quickcinder"),
						            text = || __D(2, "We inadvertently walk into a strange-looking puddle of quicksand, and we start to get pulled into it. The more we fight it, the quicker we sink, and it is already up to our hips."),
						    		icon = || "Asst_Quickcinder",
						    		who = || "mapCinematicId",
						            children = {
							    		
						    			{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Relax and crawl out!"),
						    				challenge = {
						    					requirements =  |t| t("ct_survival")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We took a long breath and lay on the surface on our chests, to better distribute our weight.\n\nSoon we were able to slowly pull our legs out of the watery ashes and crawl out of there."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalSuccess,
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
										            text = || __D(5, "We tried to calm down and apply an escape technique, but we kept sinking back.\n\nWe eventually made it out to safety, but the long struggle left us extremely tired."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalFailure,
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
						    				subtype = "item",
						                    item = || "rope",
						                    text = || __R(6, "Lasso a rock!"),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We lassoed a nearby boulder with a rope and used it to gently crawl our way out of the moving mass of ashes and clay, one by one."),
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
										     },
						    			},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Nothing to be done...."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "After we had spent a while fighting against it, the mass of ashes and clay reached our shoulders, and we accepted our bleak fate as we kept sinking into it.||Suddenly, we felt our buried feet get free of all pressure, and soon we fell into a chamber below the mass of muddy sand and ashes.\n\nThe place was filled with lost goods, and there was a tunnel, which we followed to get out of there."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {},
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
		
		survivalSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
		survivalFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		useRope = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "rope", amount = -1},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midHealing", quantity = || 1, slot = 1},
			})},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "maskTable", quantity = || 1, slot = 1},
			})}
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
