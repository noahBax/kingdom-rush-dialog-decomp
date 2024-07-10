



do 
	local quest = helper.QuestDefinition();
	quest.id = 'TownBrawlTavern'
	quest.visual = "Tavern"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_townBrawlTavern'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_MOUNTAIN"}
	quest.canAbandonCombat = || false


	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Defense of Argaleham"),
						            text = || __D(2, "A band of trolls is raiding Argaleham's inn!"),
						            who = || "mapCinematicId",
						    		icon = || "Asst_Mountain",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(3, "Defend Argaleham!"),
								            exit = true,
								            onChoose = function ()
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
											end	
		                                }
		                            }
						        }
						    })

	local resolveDialog =  dialogs.CreateDialog("resolve",  
					    {
					        {
					            type = DialogType.Dialog,
					            narrator = || __N(4, "The Defense of Argaleham"),
					            text = || __D(5, "The people of Argaleham rejoiced!\n\nThe village is safe again!\n\nThey didn't have much to offer after the long siege, but they saved some very much needed resources!"),
					    		who = || "mapCinematicId",
					    		icon = || "Asst_Mountain",
					            children = {
							        {
					    				type = DialogType.Custom,
					    				subtype = "rewards",
					    				rewards = || quest.results.success,
					    				rewardsParams = || {},
							    		exit = true
									}
							    }
					        }
					    })


	local midTownStore =  dialogs.CreateDialog("midTownStore",  
						    {
						        {
						            type = DialogType.Dialog,
						            id = "start",
						            narrator = || __N(6, "Argaleham"),
						            text = || __D(7, "Argaleham, the village that used to provide food for the Stormcloud Temple before the trolls' invasion, is but a shadow of its former promise.||The tired innkeeper looked at us as he scrubbed one of the mugs with a cloth.\n\n\"Our beds are warm and our meals are filling, what can I do for you, folks?\" "),
						    		icon = || "Asst_TavernNew",
						    		condition = || cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") != "enter",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 20,
		                                    text = || __R(8, "Rest."),
		                                    onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "rest"),
		                                    children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "A full belly and a good night's sleep have amazing healing properties!\n\nWe recovered some health."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.Rest,
										    				rewardsParams = || {},
												    		exit = true
												    		
														}
												    }
												}
									        }
		                                },
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(10, "Trade."),
		                                    onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "enter"),
		                                    exit = true
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Leave."),
		                                    onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
		                                    exit = true
		                                },
						        	}
						        },
						        {
						            type = DialogType.Dialog,
						            id = "return",
						            narrator = || __N(12, "Argaleham"),
						            text = || __D(13, "\"Soooo ... are you gonna order something or keep staring at me cleaning this 'ere mug?\"\n\nthe innkeeper asked as he continued scrubbing."),
						    		icon = || "Asst_TavernNew",
						    		who = || "mapCinematicId",
						    		inheritFrom = "start"
						    	}
						    })

	local theLootTable = {																		
		{type = "oneOf", quantity = || 4, items = {
			{type = "oneOf", quantity = || 1, slot = 4, items = {
				{type = "item", id = "healthPotion", quantity = || 3, slot = 2},
				{type = "item", id = "healthPotion", quantity = || 2, slot = 1},
				{type = "item", id = "healthPotion", quantity = || 4, slot = 1},
			}},
			{type = "oneOf", quantity = || 1, slot = 2, items = {
				{type = "item", id = "elixirOfLife", quantity = || 3, slot = 2},
				{type = "item", id = "elixirOfLife", quantity = || 2, slot = 1},
			}},
			{type = "oneOf", quantity = || 1, slot = 2, items = {
				{type = "item", id = "bandage", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
			}},
			{type = "oneOf", quantity = || 1, slot = 2, items = {
				{type = "item", id = "invigoratingPotion", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "invigoratingPotion", quantity = ||1, chanceSlots = 3},
			}},
			{type = "oneOf", quantity = || 1, slot = 2, items = {
				{type = "item", id = "bandage", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
			}},
			{type = "oneOf", quantity = || 1, slot = 2, items = {
				{type = "item", id = "unidentifiedPotion", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 3},
			}},
			{type = "oneOf", quantity = || 1, slot = 1, items = {
				{type = "item", id = "pick", quantity = || 2, slot = 2},
				{type = "item", id = "rope", quantity = || 2, slot = 1},
				{type = "item", id = "torch", quantity = || 2, slot = 1},
				{type = "item", id = "crowbar", quantity = || 2, slot = 1},
			}},
			{type = "oneOf", quantity = || 1, slot = 1, items = {
				{type = "item", id = "sharpeningStone", quantity = || 2, slot = 1},
				{type = "item", id = "sharpeningStone", quantity = || 3, slot = 1},
			}},
			{type = "oneOf", quantity = || 1, slot = 1, items = {
				{type = "item", id = "armorersKit", quantity = || 2, slot = 1},
				{type = "item", id = "armorersKit", quantity = || 3, slot = 1},
			}},
			{type = "oneOf", quantity = || 1, slot = 2, items = {
				{type = "item", id = "tent", quantity = || 2, slot = 1},
				{type = "item", id = "tent", quantity = || 3, slot = 1},
			}},
			
			
			
			
			
			
			
			
			
		}},

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
										cinematicMapHelper.Instant(function()
															    		cinematicMapHelper.CurrentQuestStatus().context.SetInt("left", 0);
															    	end),		
										cinematicMapHelper.ConditionalIfElse(|| cinematicMapHelper.CurrentQuestStatus().context.GetInt("liberated") == 1, 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.While(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") != "leave", 
																					cinematicMapHelper.Sequence({
																						cinematicMapHelper.ShowDialogInstance(midTownStore),
																						cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "enter",
																							
																							cinematicMapHelper.ShowStoreNew(|| {
																								lootTable = theLootTable
																							})
																						)
																					})
																					),
																					cinematicMapHelper.Instant(|| cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", nil))
																				}
																			)
																			,
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.Instant(function()
																			    		cinematicMapHelper.CurrentQuestStatus().resolved = false;
																			    	end),
																					cinematicMapHelper.ShowDialogInstance(theDialog)
																				}
																			))
									}))

	quest.skipOnResolveSleep = true	

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.AchievementIncrement(|| "sorceress_unlock",|| 1),
								cinematicMapHelper.AchievementIncrement(|| "all_argaleham_wins",|| 1,|| 2),
		 						cinematicMapHelper.Instant(function()
							    		cinematicMapHelper.CurrentQuestStatus().context.SetInt("liberated", 1);
							    	end),
								cinematicMapHelper.Sleep(1.5),	
								cinematicMapHelper.ShowDialogInstance(resolveDialog),
								cinematicMapHelper.Sleep(1),	
								cinematicMapHelper.Sequence({
											cinematicMapHelper.While(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") != "leave", 
											cinematicMapHelper.Sequence({
												cinematicMapHelper.ShowDialogInstance(midTownStore),
												cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "enter",
													
													cinematicMapHelper.ShowStoreNew(|| {
														lootTable = theLootTable
													})
												)
											})
											),
											cinematicMapHelper.Instant(|| cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", nil))
										}
									)
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))


	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
		}),
		Rest = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20 },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			}),
	}
	helper.AddQuest(quest)
	

	quest.shouldRun = || true
	quest.canReenter = || true

	quest.consumesDay = || not cinematicMapHelper.IsReenter()
end
