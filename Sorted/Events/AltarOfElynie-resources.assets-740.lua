


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AltarOfElynie'
	quest.visual = "Altar"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","EASY","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Altar of Elynie"),
						            text = || __D(2, "We reach an ancient altar of the goddess Elynie.\n\nAt the altar's base, an engraving reads\n\"The Goddess's light shines upon all who pray for her guidance.\""),
						    		icon = || "Asst_AltarofElynie",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Prayer of Light."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "A divine light shone upon us and we felt the Goddess's energy watching over us.\n\nWe knew for a fact that the prayer would bring us good fortune on our adventure."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.lightPrayer,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Prayer of Wisdom."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "A divine light shone upon us and we felt the Goddess's wisdom caress our very minds.\n\nWe continued our journey feeling more experienced than before."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.wisdomPrayer,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Prayer of Life."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "A divine light shone upon us and we felt the Goddess's nurture heal our wounds.\n\nWe moved on healthier than before."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.lifePrayer,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Prayer of Vigor."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "A divine light shone upon us and we felt the Goddess's energy fill our bodies with her holy vigor.\n\nWe moved on, ready to face whatever the world would throw at us."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.vigorPrayer,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {

		lightPrayer = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		wisdomPrayer = cinematicMapHelper.Result(|params| {
			{type="giveStar", amount = 1},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			}),
		lifePrayer = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 5, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		vigorPrayer = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
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
