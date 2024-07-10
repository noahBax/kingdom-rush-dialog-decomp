

do 
	local quest = helper.QuestDefinition();
	quest.id = 'SecretsOfTheForest'
	quest.visual = "SilveroakTree"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Secrets of the Forest"),
						            text = || __D(2, "We enter a beautiful forest clearing that is free from any kind of corruption. We can feel the faint flow of magic in the air."),
						    		icon = || "Asst_SecretForest",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Commune with the forest."),
		                                    condition = || (cinematicMapHelper.HeroByTag("Bruxa") != nil) or (cinematicMapHelper.HeroByTag("Bravebark") != nil) or (cinematicMapHelper.HeroByTag("WitchDoctor") != nil) or (cinematicMapHelper.HeroByTag("Sorceress")!= nil),
		                                    
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We sat in the middle of the clearing and remained calm and silent. After a while, we heard the whispers of the forest resonating in our minds and filling us with hope."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.communeWithForest,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                   	type = DialogType.Response,
		                                    text = || __R(5, "Camp in the clearing."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                		text = || __D(6, "We made camp and dedicated ourselves to training and sparring. After a couple of hours, we reached balance and felt relaxed and stronger."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.campInClearing,
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
		communeWithForest = cinematicMapHelper.Result(|params| {
			{type="giveStar", amount = 1},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		campInClearing = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
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
