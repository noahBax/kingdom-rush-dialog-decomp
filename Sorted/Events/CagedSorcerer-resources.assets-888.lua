


do
	local quest = helper.QuestDefinition();
	quest.id = 'CagedSorcerer'
	quest.visual = "Wanderer"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Caged Sorcerer"),
						            text = || __D(2, "A sorcerer is sitting inside a primitive troll cage.\n\nHe stares at us pleadingly."),
						    		icon = || "Asst_SorcererHelp",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Break the cage."),
						    				challenge = {
						    					requirements =  |t| t("ct_might")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "Blow by blow, we smashed the primitive cage to bits, freeing the trapped sorcerer.\n\nHe then thanked us and reached into his bag to give us a reward."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
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
										            text = || __D(5, "We shoulder-barged the cage several times until we eventually smashed it, collapsing on top of the sorcerer.\n\nThe injured sorcerer thanked us reluctantly before moving on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Pick the locks."),
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
										            text = || __D(7, "We fiddled with the cage's lock, and after a loud *click* we flung the door open, freeing the trapped sorcerer.\n\nHe then thanked us and reached into his bag to give us a reward."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.craftSuccess,
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
										            text = || __D(8, "We fiddled with the cage's lock, but we weren't able to open it right away.\n\nSeveral hours later, we managed to free the caged sorcerer, who thanked us and moved on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.craftFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "crowbar",
		                                    text = || __R(9, "Pry the cage open."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We stuck the end of a crowbar between the lock and one of the bars and pried the cage open.\n\nThe sorcerer thanked us and reached into his bag to give us a reward."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useCrowbar,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "We apologized and moved on, promising to send help his way eventually."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing" , quantity = || 1, slot = 1},
			})},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		craftSuccess = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing" , quantity = || 1, slot = 1},
			})},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		craftFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		useCrowbar = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing" , quantity = || 1, slot = 1},
			})},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "crowbar", amount = -1},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
