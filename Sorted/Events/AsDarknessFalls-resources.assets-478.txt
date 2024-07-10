


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AsDarknessFalls'
	
	
	quest.encounters = {'combat_asDarknessFalls'}
	quest.tags = {"EMERGENT", "TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "As Darkness Falls"),
						            text = || __D(2, "As we pass through a clearing, the light of the moon recedes and the world goes dark due to a strange eclipse.\n\nTorches prove mysteriously ineffective, and we can barely see beyond our own noses."),
						    		icon = || "Asst_DarknessFalls",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Try to find your bearings."),
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
										            text = || __D(4, "Despite the almost impenetrable darkness, we found our way out together as a team, side by side, with our resolve strengthening as a result."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.orientSuccess,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(5, "We did our best to orient ourselves in the impenetrable darkness. We were not very successful, and it didn't take long for us to start bickering and panicking.\n\nBy the time the eclipse passed, we were back on the path, but not in the best mood."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.orientFailure,
										    				rewardsParams = |d| {hero= d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    item = || "ashervanAmulet",
		                                    text = || __R(6, "\"It glows...\""),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "The Ashervan amulet started to hum and glow dimly.\n\nIt was not a great source of light, but it reminded us of the witch's last words, so we looked toward the sky.||The constellations that resembled beasts shone bright.\n\nMaybe we could follow them like the Ashervan did and find a way out.\n\nWhich one should be our starting point?"),
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
											            	text = || __R(8, "Deer"),
											            	jumpTo = "wanderInDarkness"
														},
														{
															type = DialogType.Response,
											            	text = || __R(9, "Boar"),
											            	jumpTo = "wanderInDarkness"
														},
														{
															type = DialogType.Response,
											            	text = || __R(10, "Bat"),
											            	children = {
											            		{
											            			type = DialogType.Dialog,
			                                    					text = || __D(11, "We walked with confidence. The amulet still hummed.\n\nWe had to follow another constellation of stars. But which one?"),
										    						who = || "mapCinematicId",
										    						children = {
										    							{
																			type = DialogType.Response,
											            					text = || __R(12, "Serpent"),
											            					children ={
											            						{
												            						type = DialogType.Dialog,
				                                    								text = || __D(13, "We walked with confidence. The amulet's hum got stronger.\n\nWe had to follow another constellation of stars. But which one?"),
											    									who = || "mapCinematicId",
											    									children = {
											    										{
																							type = DialogType.Response,
												            								text = || __R(14, "Boar"),
												            								jumpTo = "wanderInDarkness"
																						},
																						{
																							type = DialogType.Response,
												            								text = || __R(15, "Deer"),
												            								jumpTo = "wanderInDarkness"
																						},
																						{
																							type = DialogType.Response,
												            								text = || __R(16, "Bear"),
												            								children = {
												            									{
												            										type = DialogType.Dialog,
				                                    												text = || __D(17, "There was light coming from behind a group of trees in the distance, yet the world was still in darkness.\n\nWe pressed on and through the thicket until the light blinded us and the amulet burned in our hands.||We found ourselves standing at the very edge of an Ashervan enclave.\n\nThe sight filled us with fear, as treefolk emerged from sack-like fruits, while the Ashervan chanted and danced in dissonance.\n\nThey stopped for a brief moment when they saw us and then lunged forward with a ferocious battle cry."),
											    													who = || "mapCinematicId",
											    													children = {
											    														{
											    															type = DialogType.Response,
																		                                    text = || __R(18, "Prepare to fight!"),
																										   	exit = true,
																											onChoose = function ()
																											
																											
																											
																											cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_asDarknessFalls'}
																											cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
																											end	
										    															}
										    														}
										    													}
											            									}
											            								},
											            								{
											            									type = DialogType.Response,
											            									text = || __R(19, "Sparrow"),
											            									jumpTo = "wanderInDarkness"
											            								}
																					}
										    									}
											            					}
																		},
																		{
																			type = DialogType.Response,
											            					text = || __R(20, "Sparrow"),
											            					jumpTo = "wanderInDarkness"
																		},
																		{
																			type = DialogType.Response,
											            					text = || __R(21, "Deer"),
											            					jumpTo = "wanderInDarkness"
																		},
																		{
																			type = DialogType.Response,
											            					text = || __R(22, "Bear"),
											            					jumpTo = "wanderInDarkness"
																		},

										    						}
											            		}
											            	}
														},
														{
															type = DialogType.Response,
											            	text = || __R(23, "Sparrow"),
											            	jumpTo = "wanderInDarkness"
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(24, "Wander in the darkness."),
										   	children = {
												{
													type = DialogType.Dialog,
													id = "wanderInDarkness",
			                                    	text = || __D(25, "We got lost and roamed, tumbling through the dark, always ready for a fight.\n\nWhile nothing happened to us, the stress of facing the unknown took its toll."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.wanderInDarkness,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
			cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		orientSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		orientFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 3, targets = {params.hero}},
			}),
		
		useAmulet = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "ashervanAmulet", amount = -1},
			}),
		wanderInDarkness = cinematicMapHelper.Result(|params| {
			
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),

		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", itemId = "ashervanAmulet", amount = -1},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midHealing", quantity = ||  config.rewards.itemChance.high() and 1 or 0, slot = 1},
			})},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "buffItem", quantity = ||  config.rewards.itemChance.high() and 1 or 0, slot = 1},
			})}
			}),

	}

	quest.interruptByChance = || helper.PriorityAndSlots(cinematicMapHelper.HasItemInInventory("ashervanAmulet") and 4 or 1, 6)

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
