

do 
	local quest = helper.QuestDefinition();
	quest.id = 'DistressCall'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_distressCall'}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND", "BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "A Distress Call"),
						            text = || __D(2, "We spot a small cultist settlement where a few villagers are being kept prisoner.\n\nWe are somewhat outnumbered, but we can't leave those villagers behind!"),
						    		icon = || "Asst_DistressCall",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Take some cultists down."),
						    				challenge = {
						    					requirements =  |t| t("ct_craft")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We craft an explosive artifact to eliminate a couple of cultists, and we get ready to face those that remain."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(5, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("craftTarget", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("rangedTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_distressCall'}
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
										            text = || __D(6, "We try to eliminate some of them with a handmade explosive, but it only ends up alerting them to our presence."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(7, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("craftTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("rangedTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "2")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_distressCall'}
															end
						                                }
												    }
										        }
						    				}
							    		},

							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(8, "Shoot some cultists down."),
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
										            text = || __D(9, "We quickly take some of the cultists out, revealing our position, and we get ready to fight against those that remain."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(10, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("craftTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("rangedTarget", "0")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_distressCall'}
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
										            text = || __D(11, "We fail miserably in our attempt to hit our targets, alerting the cultists to our presence and forcing us to prepare for an uneven fight."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Response,
												            text = || __R(12, "Fight!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("craftTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("rangedTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "2")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_distressCall'}
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
			                                    	text = || __D(14, "Without wasting any more time, we decide to surprise the cultists by charging at them."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Response,
												            text = || __R(15, "Charge!"),
												            exit = true,
															onChoose = function ()
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("craftTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("rangedTarget", "1")
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "2")
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_distressCall'}
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

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	
	
	
	

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
