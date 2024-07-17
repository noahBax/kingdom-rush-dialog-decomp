

do 
	local quest = helper.QuestDefinition();
	quest.id = 'UnmarkedPotion'
	quest.visual = "Shrubs"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "An Unmarked Potion"),
						            text = || __D(2, "We find an unmarked potion hidden amongst the bushes.\n\nThere's no way to tell what the contents are, but the rustic flask seems to be orcish."),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_WildBerries",
							    		children = {
								        {
						    				type = DialogType.Response,
						    				text = || __R(3, "Drink the potion."),
						    				onChoose = function (d, n)
		                                    	d.challenge = cinematicMapHelper.challenge({
		                                    		type = "random",
		                                    		results = {
		                                    			success=70,
		                                    			failure=30,
		                                    		}
		                                    	})
		                                    end,
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            text = || __D(4, "We drank the potion and immediately felt an energy rush running through our bodies. "),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success1,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            text = || __D(5, "We felt our insides corrode as soon as we drank the potion.\n\nWe tried puking the liquid out of our bodies, but it was already too late."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure1,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Move on!"),
 											children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We decided not to risk drinking unmarked potions and moved on."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		success1= cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		failure1= cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
	
end
