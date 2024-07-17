

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BlizzardStrike'
	quest.visual = "MountainCave"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Blizzard Strike"),
						            text = || __D(2, "The growing winds and snowfall become unbearable, and the only shelter we can find is a pitch-black cave.\n\nWe don't know what may lurk inside, but the blizzard is worsening each second."),
						    		icon = || "Asst_BlizzardStrike",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Cast an ice wall."),
						    				challenge = {
						    					requirements =  |t| t("ct_magic")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We successfully cast an ice wall to seal the cave's entrance from the storm outside.\n\nWe safely waited for the storm to end without venturing into the dark."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicSuccess,
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
										            text = || __D(5, "The storm proved to be too strong for our magic wall, which shattered on us after a while.\n\nWhen the storm calmed down, we staggered out of the cave, sore and wounded."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicFailure,
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
		                                    item = || "torch",
		                                    text = || __R(6, "Walk into the cave."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We carefully made our way down through what seemed like the tunnel of an abandoned mine.\n\nWe reached a safe spot to wait for the storm to calm down, and we found some forgotten goods while doing so."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useTorch,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Venture into the cave."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We ventured into the cave, unaware of its interior structure.\n\nAfter stumbling in the dark for a while, we reached a safe area to wait for the storm to calm down."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
		}),

		useTorch = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = -1},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot", quantity = || 1, slot = 1},
			})}
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
