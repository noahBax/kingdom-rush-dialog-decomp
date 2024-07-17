


do 
	local quest = helper.QuestDefinition();
	quest.id = 'HiddenChest'
	quest.visual = "Cave"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"TREASURE","NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",
							{
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Hidden Chest"),
						            text = || __D(2, "We find a Dark Army chest stashed inside a cave.\n\nIt is locked and impossibly heavy!"), 
						    		icon = || "Asst_Cave",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Force it open!"),
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
										            text = || __D(4, "We broke the lock with a well-placed kick!##Unfortunately, some of the loot got damaged in the process."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success1,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(5, "We kicked the lock again and again until we were exhausted.\n\nUnfortunately, the lock's mechanism got ruined and we had to leave the chest behind."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure1,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Disable the lock!"),
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
										            text = || __D(7, "We disabled the lock, opening the chest and revealing its valuables."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success2,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(8, "We attempted to disable the lock with no success.\n\nWe spent a great deal of time fiddling with the lock until we eventually injured ourselves on the mechanism before jamming it for good."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure2,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Use a crowbar!"),
		                                    enabled = || cinematicMapHelper.HasItemInInventory("crowbar"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "With the help of a crowbar and some brute force, we managed to pry the chest open."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useCrowbar,
										    				rewardsParams = |d,n| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Keep going!"),
										    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {
		success1 = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.mid() or (params.normal and config.rewards.loot.low() or (config.rewards.loot.low()/2))},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		failure1 = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party() },
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		success2 = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		failure2 = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		useCrowbar = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})},
			{type="item", itemId = "crowbar", amount = -1 },
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)

	do
		local quest = helper.CloneQuestDefinition("HiddenChest")
		quest.id = "HiddenChestMountains"
		quest.visual = "MountainCave"
		helper.AddQuest(quest)
	end
	do
		local quest = helper.CloneQuestDefinition("HiddenChest")
		quest.id = "HiddenChestWasteland"
		quest.visual = "DarkCave"
		helper.AddQuest(quest)
	end
end
