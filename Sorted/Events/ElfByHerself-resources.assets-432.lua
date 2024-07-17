


do 
	local quest = helper.QuestDefinition();
	quest.id = 'ElfByHerself'
	quest.visual = "SilveroakSylvanOutpost"
	quest.kindFlag = "Challenge"
	quest.encounters = {'combat_saveYourElf'}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Elf by Herself"),
						            text = || __D(2, "A group of Ashervan druids is leaving a destroyed outpost. A Sylvan elf, shackled and in chains, walks behind them.\n\nWe have to act quickly before they get out of sight and into the depths of the forest."),
						    		icon = || "Asst_CapturedElf",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Attack them!"),
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
										            text = || __D(4, "We struck swiftly from afar, giving the elf the opportunity to make a daring escape while her captors ran in disarray.\n\nTaking an accurate shot at such a distance really honed our skills."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.attackSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(5, "We didn't strike true even though we had the advantage.\n\nWarned by the missed shot, the Ashervan retaliated with their magic and routed us.\n\nWe don't know if distracting the elf's captors was enough for her to make an escape."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.attackFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Tail the Ashervan."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_survival") != nil,
		                                	who = || cinematicMapHelper.HeroByTag("ct_survival").GUID,
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We followed the group from a safe distance and tried to remain undetected\n\nWe soon arrived at a small camp, where the Ashervan were getting ready to interrogate the elf.\n\nWe had no other choice but to jump in and attack."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Response,
												            text = || __R(8, "Charge!"),
												            exit = true,
															onChoose = function ()
																
																
																
																cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_saveYourElf'}
																cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
															end	
						                                }
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Ignore them."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We decided not to risk our own hides, and we waited until the Ashervan were far out of sight.\n\nTo make up for lost time, we took a look through the remains of the outpost and found tools to strengthen our armor."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.ignoreThem,
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
		attackSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		attackFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		ignoreThem = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "armorersKit", amount = 1},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
