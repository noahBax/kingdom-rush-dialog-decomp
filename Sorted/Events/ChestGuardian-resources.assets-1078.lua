

do 
	local quest = helper.QuestDefinition();
	quest.id = 'ChestGuardian'
	quest.visual = "Cave"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","EASY","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Chest's Guardian"),
						            text = || __D(2, "A specter guards an open chest full of loot, potions, and shiny artifacts.\n\n\"Finally! Someone has come to free me from my curse.\nPick your reward... if you dare.\""),
						    		icon = || "Asst_OpenChest",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Grab a potion."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We grabbed a potion and watched the guardian sigh in relief as he vanished into thin air.\n\nWe left the place with an eerie feeling inside us."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.potion,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Grab loot."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We filled our purses with as much gold as we could and watched the guardian sigh in relief as he vanished into thin air.\n\nWe left the place with an eerie feeling inside us."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.loot,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Grab random items."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We grabbed some items from the chest and watched the guardian sigh in relief as he vanished into thin air.\n\nWe left the place with an eerie feeling inside us."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.item,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We chose not to mess with the chest's guardian and moved on."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {

		potion = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = params.hard and "highPotion" or (params.normal and "midPotion" or "lowPotion"), quantity = || 1, slot = 1},
			})},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		item = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = params.hard and "highItems" or (params.normal and "midItems" or "lowItems"), quantity = || 1, slot = 1},
			})},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		loot = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = params.hard and (config.rewards.loot.high() + config.rewards.loot.low()) or (params.normal and config.rewards.loot.high() or config.rewards.loot.mid())},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 1
end
