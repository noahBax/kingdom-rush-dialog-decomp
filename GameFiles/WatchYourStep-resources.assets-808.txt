

do 
	local quest = helper.QuestDefinition();
	quest.id = 'WatchYourStep'
	
	
	quest.encounters = {"combat_rootsCave"}
	quest.tags = {"EMERGENT", "TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            condition = || (cinematicMapHelper.HeroByTag("ct_perception") == nil),
						            narrator = || __N(1, "Watch Your Step!"),
						            text = || __D(2, "As we make our way through, the vegetation starts to get more dense, to the point that we can barely see the earth beneath the roots, leaves, and vines."),
						    		icon = || "Asst_LeafTrap",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						            		type = DialogType.Response,
		                                	text = || __R(3, "Oops!"),
		                                	who = || "mapCinematicId",
									   		children = {
									   			{
									   				type = DialogType.Dialog,
							                   		text = || __D(4, "One of us suddenly disappears through a hole in the ground that was covered with leaves."),
									    			who = || "mapCinematicId",
								            		children = {
								            			{
								            				type = DialogType.Custom,
															subtype= "rewards",
															rewards= || quest.results.oops,
						    								rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    			children = {
											    				{
											    					type = DialogType.Dialog,
							                   						text = || __D(5, "We hear a loud chitter in the dark. Spiders are crawling near our friend! We have to do something!"),
									    							who = || "mapCinematicId",
								            						children = {
								            							{
								            								type = DialogType.Custom,
		                                									subtype = "item",
		                                									item = || "rope",
		                                									text = || __R(6, "Throw a rope and lift."),
		                                									who = || "mapCinematicId",
									   										children = {
									   											{
									   												type = DialogType.Dialog,
			                                    									text = || __D(7, "As fast as we could, we threw a rope to lift our companion. The attackers were left without prey."),
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
									   										}
								            							},
								            							{
								            								type = DialogType.Response,
										                                    text = || __R(8, "Get down and fight!"),
																		   	exit = true,
																			onChoose = function ()
																			
																			
																			
																			cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_rootsCave'}
																			cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
																			end
								            							}
								            						}
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
						            type = DialogType.Dialog,
						            condition = || (cinematicMapHelper.HeroByTag("ct_perception") != nil),
						            narrator = || __N(9, "Watch your step!"),
						            text = || __D(10, "As we make our way through, the vegetation starts to get more dense, to the point that we can barely see the earth beneath the roots, leaves, and vines.||Thanks to our cautiousness, we avoided the hole of a pit, hidden under vines and leaves. \"Not today,\" we muttered to ourselves, and continued walking."),
						    		icon = || "Asst_LeafTrap",
						    		who = || "mapCinematicId",
						            children = {
										{
						    				type = DialogType.Custom,
						    				subtype = "rewards",
						    				rewards = || quest.results.hasPerceptionTag,
						    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
								    		onChoose = function(d,n)
												cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
											end,
								    		exit = true
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
			{type="item", itemId = "blessedRing", amount = 1 },
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),
		oops = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party(1)},
			}),
		hasPerceptionTag = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		useRope = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "rope", amount = -1 },
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			
			{type="checkInjuries"}
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
