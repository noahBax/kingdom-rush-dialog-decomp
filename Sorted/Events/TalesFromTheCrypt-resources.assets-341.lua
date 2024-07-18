

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TalesFromTheCrypt'
	quest.visual = "Ruins"
	quest.kindFlag = "Enigma"
	quest.encounters = {'combat_talesFromTheCrypt'}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Tales from the Crypt"),
						            text = || __D(2, "We venture into an ancient mausoleum and discover a strange-looking book resting on a stone pedestal.\n\nIt radiates such an empowering energy that, just standing nearby, we feel tempted to read from it."),
						    		icon = || "Asst_Necronomicon",
						    		who = || "mapCinematicId",
						            children = {
							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Read it."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We started reciting the writings out loud in unison, and we felt a strange energy flowing through us."),
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Custom,
															subtype= "rewards",
															rewards= || quest.results.readBook,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												            children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(5, "Entranced, we didn't notice the many undead enemies surrounding us until it was too late!"),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Response,
																            text = || __R(6, "Fight!"),
																            exit = true,
																			onChoose = function ()
																				cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_talesFromTheCrypt'}
																				cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																			end	
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
		                                    condition = || cinematicMapHelper.HeroByTag("ct_wisdom") != nil,
                           					who = || cinematicMapHelper.HeroByTag("ct_wisdom").GUID,
		                                    text = || __R(7, "Put it down."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We managed to put the book down, and we resisted the temptation to read it.\n\nWe may be depriving ourselves of a great power, but messing with it didn't feel wise at all."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.putDown,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Destroy it!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We unwillingly started to read from the book but, in a surge of willpower, we decided to destroy it to avoid reading any further.\n\nA haunting moan echoed through the building."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}

			}),
		
		
		
		
		readBook = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			}),

		putDown = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),

		default = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.low()},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	
	
	
	

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
