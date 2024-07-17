

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BuriedLoot'
	quest.visual = "Cave"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"TREASURE","NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Buried Loot"),
						            text = || __D(2, "We find a few coins partially hidden in the dirty ground inside a cave.##It sure looks like something worth investigating further."),
						    		icon = || "Asst_Cave",
						    		who = || "mapCinematicId",
						            children = {
		                                {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Try to find the rest."),
						    				challenge = {
						    					requirements =  |t| t("ct_perception") 
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We investigated the area, looking for irregular patterns on the ground, and we found a couple of suspicious mounds.\n\nWe found a decent amount of loot after digging them up."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalSuccess,
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
										            text = || __D(5, "We explored the cave looking for valuables but only managed to cause a few boulders to collapse on top of us.\n\nWounded, we decided to move on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalFailure,
										    				rewardsParams = |d,n| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Use a divination spell."),
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
										            text = || __D(7, "We focused on the coins we had already found and tried to detect where the rest of the coins were.\n\nWe picked up the energy of the loot and dug it up."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicSuccess,
										    				rewardsParams = |d,n| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													    	print (cinematicMapHelper.CurrentNode().tags.Contains("hard"))
													end,
										            text = || __D(8, "We spent a while trying to pick up any type of metallic energy, but we weren't able to detect anything.\n\nAfter a long time casting divination spells, we were exhausted and decided to call it a day."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicFailure,
										    				rewardsParams = |d,n| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "pick",
		                                    text = || __R(9, "Dig all around!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "Our hunch was right!##Digging up the spot revealed a considerable bounty!"),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.dig,
										    				rewardsParams = |d,n| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "No time to dig!"),
										    who = || "mapCinematicId",
								    		children = {
												{
								    				type = DialogType.Custom,
								    				subtype = "rewards",
								    				rewards = || quest.results.leave,
								    				rewardsParams = || {},
										    		exit = true
												}
								        	}
		                                }
						        	}
						        }
						    })

	quest.results = {

		dig = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "pick", amount = -1 },
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		survivalSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		survivalFailure= cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(2)},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			
			}),
		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		leave = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 3 },
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
		local quest = helper.CloneQuestDefinition("BuriedLoot")
		quest.id = "BuriedLootMountains"
		quest.visual = "MountainCave"
		helper.AddQuest(quest)
	end

	do
		local quest = helper.CloneQuestDefinition("BuriedLoot")
		quest.id = "BuriedLootWasteland"
		quest.visual = "DarkCave"
		helper.AddQuest(quest)
	end
end
