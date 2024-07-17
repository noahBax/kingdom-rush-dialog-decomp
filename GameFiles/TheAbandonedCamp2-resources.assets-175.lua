

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheAbandonedCamp2'
	quest.visual = "MercenaryCamp"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Abandoned Camp"),
						            text = || __D(2, "We find a soldiers' camp that looks recently abandoned.\n\nBy the looks of the place, there could be some valuables scattered around the area."),
						    		icon = || "Asst_Campgrounds",
						    		who = || "mapCinematicId",
						             children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Search the camp for supplies."),
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
										            text = || __D(4, "A quick search revealed some supplies and equipment."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success,
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
										            text = || __D(5, "The search only resulted in several wasted hours.\n\nAt the end, we were exhausted and found nothing except some fleas."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		                                    text = || __R(6, "Use a torch to\ncheck the area."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "The torch proved to be really useful when scouting the area for supplies.\n\nA quick search revealed some loot."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useTorch,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Set up camp and rest."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We spent the night camping at the abandoned camp and recovered some health."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rest,
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
		success = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low() },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		failure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="doDamage", amount = 2, targets = {params.hero}},
			}),
		useTorch = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low() },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "torch", amount = -1 },
			}),
		rest= cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	helper.AddQuest(quest)

	quest.revealDistance = 1
	do
		local quest = helper.CloneQuestDefinition("TheAbandonedCamp2")
		quest.id = "TheAbandonedCampMountains"
		quest.visual = "MountainCamp"
		helper.AddQuest(quest)
	end
end
