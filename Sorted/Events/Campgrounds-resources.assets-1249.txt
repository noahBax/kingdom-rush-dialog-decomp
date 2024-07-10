

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Campgrounds'
	quest.visual = "MercenaryCamp"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"STORE","NORMAL","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Campgrounds"),
						            text = || __D(2, "We reach some abandoned campgrounds.\n\nThe area looks deserted and secure.\n\nThere's an extinguished fire pit and plenty of space to set up camp for the day."),
						    		icon = || "Asst_Campgrounds",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Rest."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We spent the rest of the day resting at the campgrounds."),
										    		who = || "mapCinematicId",
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rest,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Improve weapons."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_craft") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_craft").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We spent the rest of the day improving our weapons.\n\nThey're definitely deadlier now."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.weaponUp,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Improve armor."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_craft") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_craft").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We spent the rest of the day improving our armor.\n\nIts quality has definitely improved."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.armorUp,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Scavenge for loot."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_survival") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_survival").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "We spent the rest of the day scavenging the area.\n\nWe found some valuable loot."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.scavenge,
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

	quest.results = {

		weaponUp = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets =  cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = (params.hard or params.normal) and config.rewards.starXp.eMid() or config.rewards.starXp.eLow()},
			}),
		armorUp = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = 1, targets =  cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = (params.hard or params.normal) and config.rewards.starXp.eMid() or config.rewards.starXp.eLow()},
			}),
		scavenge = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = (params.hard or params.normal) and "midHealing" or "lowHealing", quantity = || 1, slot = 1},
			})},
			{type="giveXP", amount = (params.hard or params.normal) and config.rewards.starXp.eMid() or config.rewards.starXp.eLow()},
			}),
		rest = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
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

	do
		local quest = helper.CloneQuestDefinition("Campgrounds")
		quest.id = "CampgroundsMountains"
		quest.visual = "MountainCamp"
		helper.AddQuest(quest)
	end
end
