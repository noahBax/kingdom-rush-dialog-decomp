

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheTranquilGrove'
	quest.visual = "ForestTree"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Tranquil Grove"),
						            text = || __D(2, "We come across a beautiful grove.\n\nIt looks like the perfect place to rest ... maybe even too perfect."),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_TranquilGrove",
							    		children = {
								        {
						    				type = DialogType.Response,
						    				text = || __R(3, "Set camp\nand rest."),
						    				onChoose = function (d, n)
		                                    
		                                    
		                                    
		                                    
		                                    
		                                    
		                                    
		                                    

		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "good1")
	                                    		table.insert(resultsAvailable, "good2")
	                                    		table.insert(resultsAvailable, "bad")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

		                                    	d.data.outcome = randomOutcome
		                                    end,

						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "good1" or d.data.outcome == "good2",
										            text = || __D(4, "We gathered and rested for a while, spending a peaceful night.\n\nThe following morning, everyone felt relaxed, happier, and healthier."),
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
										            condition = |d| d.data.outcome == "bad",
										            text = || __D(5, "We gathered and rested for a while, spending a peaceful night.\n\nWhen we woke up, our belongings were scattered all around the clearing, amongst a sea of tiny footprints.\n\nWe collected what was left and moved on."),
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
		                                    text = || __R(6, "Carry on!"),
 											children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We decided to move forward and rest later."),
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
			{type="guild.attribute", kind = "loot", amount = -(cinematicMapHelper.Guild().GetLoot()/2)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
