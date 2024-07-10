

do 
	local quest = helper.QuestDefinition();
	quest.id = 'UnblindedPrisoner'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Unblinded Prisoner"),
						            text = || __D(2, "In a nearby abandoned camp, we spot a figure inside a metal cage and decide to take a closer look.\n\nOnce there, we see a desperate cultist acolyte imprisoned in inhuman conditions.||\"Help me...,\" he mutters.\n\n\"I swear, I'm not with them anymore! They get rid of anyone who questions their ways....\"\n\n\"I've done bad things ... but please, help me!\""),
						    		icon = || "Asst_UnblindedPrisoner",
						    		who = || "mapCinematicId",
						            children = {

							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Interrogate and free him."),
						    				challenge = {
						    					requirements =  |t| t("ct_social")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We promised to free him in exchange for information about the cult.\n\nIt wasn't easy to convince him to speak against them, but we assured him everything would be over soon."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
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
										            text = || __D(5, "We were a bit too intense with the interrogation, and he ended up passing out in fear.\n\nUnable to wake him up, we moved on after a while."),
										            who = || "mapCinematicId",
										    		exit = true
										        }
						    				}
							    		},

								        {
						    				type = DialogType.Custom,
						    				subtype = "item",
						                    item = || "food",
						                    text = || __R(6, "Interrogate and aid him."),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We couldn't trust a member of the cult enough to set him free, so we offered some of our food in exchange for information about the cult, before resuming our journey."),
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
										     }
						    			},

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Leave him to his fate."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "Despite his apparent regret, his wrongdoings couldn't go unpunished.\n\nWe decided to leave him to his fate and made haste to put an end to the cult's plans."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
		}),

		useFood = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "food", amount = -1},
			{type="giveXP", amount = config.rewards.starXp.high()},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
