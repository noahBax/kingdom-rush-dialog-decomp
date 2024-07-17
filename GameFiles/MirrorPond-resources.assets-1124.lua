

do 
	local quest = helper.QuestDefinition();
	quest.id = 'MirrorPond'
	quest.visual = "Cave"
	quest.encounters = {}
	quest.kindFlag = "Enigma"
	quest.tags = {"NARRATIVE","EASY","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Mirror Pond"),
						            text = || __D(2, "A strange pond calls to us from inside a cave.\n\nAfter a quick glance, we notice how the pond offers visions of our future.\n\nHowever, the longer we stare into it, the weaker we feel."),
						    		icon = || "Asst_Cave",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Stare into the pond!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We stared into the pond and received visions of future versions of ourselves.\n\nWe continued our journey wiser than before but with an intense pain pressing against our temples."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stare,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We decided not to fall under the pond's allure and moved on."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {

		stare = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and (config.rewards.starXp.eHigh() + config.rewards.starXp.eLow()) or (params.normal and config.rewards.starXp.eHigh() or config.rewards.starXp.eMid())},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type= "doDamage", amount = 1, targets = cinematicMapHelper.Party()}
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
