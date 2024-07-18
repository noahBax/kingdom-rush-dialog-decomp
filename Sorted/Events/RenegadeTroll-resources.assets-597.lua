


do 
	local quest = helper.QuestDefinition();
	quest.id = 'RenegadeTroll'
	
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Wandering Troll"),
						            text = || __D(2, "A tough-looking troll cautiously approaches us, holding his hands up.\n\n\"Wait, heroes. Me want no fight.\nMe just want talk.\""),
						    		icon = || "Asst_RenegadeTroll",
						    		who = || "mapCinematicId",
						            children = {
										{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Let him speak."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	
										    		text = || __D(4, "\"Those cultists corrupted our clan with promises of great power, but me no trust them ... so me left clan.\n\nDo you have goods to give for me journey?\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
						                                    subtype = "item",
						                                    item = || "food",
						                                    text = || __R(5, "Give him some food."),
														   	children = {
																{
														            type = DialogType.Dialog,
														            text = || __D(6, "\"Thanks....\n\n...Hey, me stole weapons from cultists on me way out. Take it and free these lands and me people from the cult,\" he said, before walking away."),
														            who = || "mapCinematicId",
														            children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.giveFood,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
																    }
														        }
										    				}
											    		},

											    		{
										    				type = DialogType.Custom,
						                                    subtype = "loot",
		                                  					amount = || 30,
						                                    text = || __R(7, "Give him some crowns."), 
														   	children = {
																{
														            type = DialogType.Dialog,
														            text = || __D(8, "\"Thanks....\n\n...Hey, me took some extra gear before getting out of there. Take it and free these lands and my people from cult,\" he said, before walking away."),
														            who = || "mapCinematicId",
														            children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.giveLoot,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
																    }
														        }
										    				}
										    			},

										    			{
						                                    type = DialogType.Response,
						                                    text = || __R(9, "Move on."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
																	id = "moveOn",
							                                    	text = || __D(10, "He may not be a threat to us, but we had no business with someone of his kind.\n\nWe continued our journey, wary of his behavior until he was out of our sight."),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
						                                }
											    	}
											    }
											}
										},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Seize him!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "We fiercely charged at him, which made him flee toward the nearest mountain.\n\nAfter a while, we ran out of breath, as he kept getting farther and farther away, until he disappeared from our sight."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.seizeHim,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
												}
									        }
									    },

									    {
									        type = DialogType.Response,
		                                    text = || __R(13, "Ignore him and move on."),
		                                    jumpTo = "moveOn"
		                                }
		                            }
						        }
						    })								        



	quest.results = {
		giveFood = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "armor_max", amount = 1, targets =  cinematicMapHelper.PartyRandom(2)},
			}),

		giveLoot = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets =  cinematicMapHelper.PartyRandom(1)},
			}),

		seizeHim = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets =  cinematicMapHelper.PartyRandom(1)},
			}),
		
}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
