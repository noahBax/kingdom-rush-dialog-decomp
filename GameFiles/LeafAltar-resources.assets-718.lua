

do 
	local quest = helper.QuestDefinition();
	quest.id = 'LeafAltar'
	quest.visual = "Altar"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Leaf Altar"),
						            text = || __D(2, "We come across a wooden altar covered in leaves.\n\nAn engraving reads: \"Leave your offering and the altar shall grant you fortune or health.\""),
						    		icon = || "Asst_LeafAltar",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 25,
		                                    text = || __R(3, "Ask for fortune."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "A light shone upon us, filling us with a sensation of wellbeing.\n\nWhen the light was gone, we noticed our offerings had disappeared."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.fortune,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
								        {
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 25,
		                                    text = || __R(5, "Ask for health."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "A light shone upon us, caressing our wounds.\n\nWhen the light was gone, we noticed our offerings had disappeared."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.health,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Move on."),
		                                    who = || "mapCinematicId",
										   	exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {

		fortune = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="guild.attribute", kind = "loot", amount = -25 },
			{type="giveXP", amount = (params.hard or params.normal) and config.rewards.starXp.eMid() or config.rewards.starXp.eLow()},
			}),
		health = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			{type="guild.attribute", kind = "loot", amount = -25 },
			{type="giveXP", amount = (params.hard or params.normal) and config.rewards.starXp.eMid() or config.rewards.starXp.eLow()},
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
