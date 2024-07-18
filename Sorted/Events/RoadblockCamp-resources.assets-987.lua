

do 
	local quest = helper.QuestDefinition();
	quest.id = 'RoadblockCamp'
	quest.visual = "GlareCamp"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_roadblockCamp'}
	quest.tags = {"EMERGENT", "TERRAIN_WASTELAND", "BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Roadblock Camp"),
						            text = || __D(2, "We run into a band of cultists, and they get alarmed by our presence.\n\n\"Go call the others. Now!\" says their leader, and one of them runs toward a nearby camp.\n\nImmediately, the leader starts channeling a summoning spell."),
						    		icon = || "Asst_RoadblockCamp",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Shoot the emissary."),
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
										            text = || __D(4, "We manage to take down the emissary just as the leader finishes channeling the spell. We get ready to fight."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(5, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("extraCult", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("tentacles", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_roadblockCamp'}
															end	
						                                }
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(6, "We fail in our shot at the emissary, and he runs away as the leader finishes channeling the spell. We prepare to face the cultists."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(7, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("extraCult", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("tentacles", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_roadblockCamp'}
															end	
						                                }
												    }
										        }
						    				}
							    		},

							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(8, "Shoot the leader."),
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
										            text = || __D(9, "We manage to hit the leader and cancel the spell, but the emissary is now out of our reach. We get ready to fight."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(10, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("extraCult", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("tentacles", "0")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_roadblockCamp'}
															end	
						                                }
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(11, "We fail in our shot at the emissary, and he runs away as the leader finishes channeling the spell. We prepare to face the cultists."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(12, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("extraCult", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("tentacles", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_roadblockCamp'}
															end	
						                                }
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(13, "Charge!"),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(14, "We decide to take the initiative and charge straight at them."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Response,
												            text = || __R(15, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("extraCult", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("tentacles", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_roadblockCamp'}
															end	
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
		
		
		
		
		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="guild.attribute", kind = "loot", amount = -20},
			}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	
	
	
	

	helper.AddQuest(quest)
	quest.canHaveInterrupt = false;
	quest.revealDistance = 1

end
