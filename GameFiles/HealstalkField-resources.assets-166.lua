


do 
	local quest = helper.QuestDefinition();
	quest.id = 'HealstalkField'
	quest.visual = "SilveroakHealstalk"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Healstalk Field"),
						            text = || __D(2, "We come across a beautiful garden in the middle of the forest, filled with healstalk plants. An old man is weeding around them\n\n\"Hello there, travelers! Don't mind me, I'm just trying to preserve these magnificent plants. Feel free to enjoy their benefits,\" he says in a joyous tone."),
						    		icon = || "Asst_Healstalks",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Rest near the plants."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "Resting amidst the healstalks while exchanging stories with the old man was an amazingly refreshing experience.\n\nWe thanked the man and resumed our journey."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.restNearPlants,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Ask for a whole plant."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_social") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_social").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We asked the man to harvest a healstalk, as we were on a mission to save the forest from the dark influence of the Coven. After thinking for a while, the man let us consume a plant, greatly replenishing our energies.\n\n\"You better return the favor to the forest!\" he said, before we resumed our mission."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.askForPlant,
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
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We told the old man we were in a hurry, as we had to continue our mission to save the forest. He quickly sprinted inside his hut and came back with flasks in his hands.\n\n\"Take these and, please, save this forest for all of us!\" he said, before we resumed our journey."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.moveOn,
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
		restNearPlants = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		askForPlant = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		moveOn = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "healthPotion", amount = 2 },
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
