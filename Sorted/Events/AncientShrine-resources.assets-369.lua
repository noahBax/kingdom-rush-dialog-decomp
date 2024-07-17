

do 
	local quest = helper.QuestDefinition();
	quest.id = 'AncientShrine'
	quest.visual = "AncientShrine"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Ancient Shrine"),
						            text = || __D(2, "We come across the ruins of an ancient shrine and decide to investigate further.\n\nInside, there is a statue of a goddess holding a basin inscribed with writings in a dead language."),
						    		icon = || "Asst_GoddessStatue",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Translate the writings."),
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
										            text = || __D(4, "We were able to translate the text, which read:\n\n\"Blessed be the ones\nwho with a potion\nmy thirst will calm.\n\nPour anything else\nand for your mockery\nmy curse shall fall.\""), 
										            who = || "mapCinematicId",
										            children = {
											            {
						                                    type = DialogType.Custom,
						                                    subtype = "item",
						                                    condition = || cinematicMapHelper.HasItemInInventory("healthPotion"),
						                                    item = || "healthPotion",
						                                    text = || __R(5, "Pour potion."),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "Shortly after we poured the potion into the basin, the statue's eyes lit up as the potion evaporated into a glimmering mist around us.\n\nWe felt instantly refreshed."), 
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.healingPotion,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Custom,
						                                    subtype = "item",
						                                    condition = || cinematicMapHelper.HasItemInInventory("coffee"),
						                                    item = || "coffee",
						                                    text = || __R(7, "Pour potion."),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "Shortly after we poured the potion into the basin, the statue's eyes lit up as the potion evaporated into a glimmering mist around us.\n\nWe felt instantly invigorated."), 
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.coffee,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Custom,
						                                    subtype = "item",
						                                    condition = || cinematicMapHelper.HasItemInInventory("unidentifiedPotion"),
						                                    item = || "unidentifiedPotion",
						                                    text = || __R(9, "Pour potion."),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "Shortly after we poured the potion into the basin, the statue's eyes lit up as the potion got transfigured into a beautiful fluid.\n\nWe refilled the flask with it and moved on."), 
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.unidentifiedPotion,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(11, "Nothing to offer."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(12, "We didn't want to enrage any ancient deity, so we continued our adventure without giving any offering."),
														    		who = || "mapCinematicId",
														    		children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.translateSuccess,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(13, "We weren't sure about the meaning of the writings but decided to try our luck anyway."),
										            who = || "mapCinematicId",
										            children = {
														{
											            	type = DialogType.Response,
											            	text = || __R(14, "Fill the basin."),
											            	jumpTo = "fillBasin"
										            	}
										            }	
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(15, "Fill the basin."),
		                                  	who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
													id = "fillBasin",
			                                    	text = || __D(16, "We decided to try our luck without understanding the writings.\n\nWe pondered what to put in the basin."),
			                                    	who = || "mapCinematicId",
										    		children = {
										            	{
						                                    type = DialogType.Custom,
						                                    subtype = "item",
						                                    item = || "healthPotion",
						                                    text = || __R(17, "Pour healing potion."),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(18, "Shortly after we poured the potion into the basin, the statue's eyes started to light up as the potion evaporated into a glimmering mist.\n\nWe felt instantly refreshed."), 
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.healingPotion,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(19, "Spill some blood."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(20, "We chose one of us to drop a few drops of blood into the basin. There was a brief tremor, but nothing else happened.\n\nDisappointed, we resumed our journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.spillBlood,
														    				rewardsParams = || {},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
						                                    amount = || 10,
						                                    text = || __R(21, "Toss some coins."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(22, "We threw some coins into the basin. There was a brief tremor, but nothing else happened.\n\nDisappointed, we resumed our journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.tossCoins,
														    				rewardsParams = || {},
														    				exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(23, "Put in some food."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(24, "We tried putting some of our food in the basin. We stared in awe as it started to quickly rot before our eyes, hitting us with a nauseating stench."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.putFood,
														    				rewardsParams = || {},
														    				exit = true
																		}
														        	}
																}
													        }
						                                }
												    }
												}
											} 
									    },
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(25, "Forget about it."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(26, "It would be foolish to mess with these things without proper knowledge.\n\nWe continued our adventure shortly after."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						    	}
						    })

	quest.results = {

		translateSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),
		healingPotion = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "healthPotion", amount = -1 },
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),
		coffee = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "coffee", amount = -1 },
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),
		unidentifiedPotion = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "unidentifiedPotion", amount = -1 },
			{type="item", itemId = "elixirOfLife", amount = 1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),
		
		spillBlood = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets =  cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			}),
		tossCoins = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -10 },
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			}),
		putFood = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "food", amount = -1 },
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
