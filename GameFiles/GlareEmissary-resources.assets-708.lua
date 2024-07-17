

do 
	local quest = helper.QuestDefinition();
	quest.id = 'GlareEmissary'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Glare Emissary"),
						            text = || __D(2, "A bizarre-looking creature carrying a package in its claws flies over us.\n\nBy its outlandish appearance, it looks like it belongs to the cult, and we could certainly use some goods...."),
						    		icon = || "Asst_GlarePackage",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Shoot it down!"),
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
										            text = || __D(4, "We manage to scare the beast with our projectiles, making it flee and drop the package, which is heading straight toward the ground!"),
										            who = || "mapCinematicId",
										            children = {
												        {
						                                    type = DialogType.Response,
						                                    condition = || cinematicMapHelper.HeroByTag("ct_athletics") != nil,
		                                   					who = || cinematicMapHelper.HeroByTag("ct_athletics").GUID,
						                                    text = || __R(5, "Catch!"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "With a swift dive, we caught the package in time.\n\nUpon opening it, we found some loot and various fragile potions."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.catchPackage,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				who = || "mapCinematicId",
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
						                                    text = || __R(7, "\"Oops!\""),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "Despite the sound of shattering glass, we approached the smashed package, hoping to find something we could salvage.\n\nLuckily for us, coins aren't as fragile as glass!"),
														    		who = || "mapCinematicId",
														    		children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.rangedSuccess,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
												    }
										        },

										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(9, "We fired many shots, trying to hit the beast, but without even scaring it off. We decided to stop wasting our energies and resources and let it go."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		who = || "mapCinematicId",
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
		                                    text = || __R(10, "Let it go."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(11, "We didn't think we could manage to reach the beast, so we focused on our path ahead and moved on."),
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
		
		rangedSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			
		}),
		rangedFailure = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = -1, targets = {params.hero}},
		}),

		catchPackage = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midPotion", quantity = || 1, slot = 1},
			})},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
