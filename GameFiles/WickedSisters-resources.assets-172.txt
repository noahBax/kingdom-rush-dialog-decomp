

do 
	local quest = helper.QuestDefinition();
	quest.id = 'WickedSisters'
	quest.visual = "BlackCauldron"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Wicked Sisters"),
						            text = || __D(2, "A pungent smell catches our attention, and we follow it to its source, where we find two witches stirring a big, black cauldron.\n\n\"The potion is almost done, sis!\" one of them says.\n\n\"If only we had something to thicken it...,\" she continues."),
						    		icon = || "Asst_WickedSisters",
						    		who = || "mapCinematicId",
						            children = {
							    		
								        {
						    				type = DialogType.Custom,
						    				subtype = "item",
						                    item = || "food",
						                    text = || __R(3, "Add ingredients."),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We offered the twins some of our food to add to the potion, and they thanked us by sharing some of it with us.\n\nIts strong flavor filled us with energy for the journey."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useFood,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
											    }
										     },
						    			},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Stop them!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We couldn't let those dangerous hags act freely, so we quickly charged at them.\n\nAfter they fled, yelling words at us, we dared to try the potion, which had good healing properties."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.attack,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Let them be."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We decided not to mess with them, as we had enough on our hands to worry about.\n\nWe kept smelling the captivating aroma for a while, wondering how it might have tasted."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		useFood = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.low()},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="item", itemId = "food", amount = -1},
		}),
		
		attack = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
		}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
