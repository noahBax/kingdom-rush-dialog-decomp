

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Auroras'
	quest.visual = "MountainCamp"
	quest.kindFlag = "Enigma"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Auroras in the Sky"),
						            text = || __D(2, "The sky shines full of auroras.\n\nThe sight is truly breathtaking."),
						    		icon = || "Asst_Auroras",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Response,
						    				text = || __R(3, "Observe the auroras."),
						    				children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(4, "We spent a short while admiring the beautiful dancing lights and moved on.\n\nWe felt the experience of many past adventurers wash over us."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.watch,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Response,
						    				text = || __R(5, "Spend a day resting."),
						    				children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(6, "We decided to take advantage of the delightful spot and settled down to rest under the auroras."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rest,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Response,
						    				text = || __R(7, "Worship the auroras."),
						    				children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(8, "We sensed a holy natural presence carried in the auroras and decided to worship them.\n\nWe felt somewhat inspired by the phenomenon."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.worship,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		watch = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and (config.rewards.starXp.eHigh() + (config.rewards.starXp.eLow()/2)) or ((params.normal and config.rewards.starXp.eHigh() or config.rewards.starXp.eMid()))},
			}),
		worship = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		rest = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		
		
		
		
		
		
		
		
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
