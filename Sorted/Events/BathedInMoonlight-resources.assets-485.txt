


do 
	local quest = helper.QuestDefinition();
	quest.id = 'BathedInMoonlight'
	quest.visual = "SilveroakAshTent"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Bathed In Moonlight"),
						            text = || __D(2, "We arrive at an abandoned Ashervan enclave. The only standing structures are a group of altars that amplify the light of the moon over the encampment."),
						    		icon = || "Asst_AshervanAltar",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Absorb the moonlight."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_magic") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_magic").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "The magic of the altars called to us. Using it for our own benefit was worth the risk, so we conducted a rite and channeled it to the party."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.absorbMoonlight,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                   	type = DialogType.Response,
		                                    text = || __R(5, "Destroy the altars."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                		text = || __D(6, "We figured that leaving the altars standing was a risk. We tore them down so that nobody could benefit from their magic."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.destroyAltars,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											   				exit = true
														}
										   			}
												}
									    	}
		                                },
		                                {
		                                   	type = DialogType.Response,
		                                    text = || __R(7, "Rest."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                		text = || __D(8, "We decided to rest for a while at the feet of the altars, under the bright moonlight."),
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
		absorbMoonlight = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		destroyAltars = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
			}),
		rest = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
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
