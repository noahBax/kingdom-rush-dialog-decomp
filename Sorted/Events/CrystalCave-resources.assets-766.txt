

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CrystalCave'
	quest.visual = "Cave"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Crystal Cave"),
						            text = || __D(2, "We enter a cave filled with valuable and somewhat powerful crystals."),
						    		icon = || "Asst_Cave",
						    		who = || "mapCinematicId",
						            children = {
		                                {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Gather crystals."),
						    				challenge = {
						    					requirements =  |t| t("ct_craft") 
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We picked up all the valuable crystals we could carry and moved on."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.gatherSuccess,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(5, "We tried to gather some of the crystals, but they kept crumbling in our hands.\n\nSeveral exhausting hours later we exited the cave empty-handed."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.gatherFailure,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Search for healing crystals."),
						    				challenge = {
						    					requirements =  |t| t("ct_magic") or  t("ct_wisdom")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "We were able to detect healing energy emanating from some of the crystals, and we collected them."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.healSuccess,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
										            text = || __D(8, "We picked up some magic crystals, but as soon as they were in our hands, they started sucking the life force out of our bodies."),
										            who = || "mapCinematicId",
										            children = {
												            {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.healFailure,
										    				rewardsParams = |d,n| {hero = d.data.hero,hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                
		                                  
		                                    
										   	
											
											
			                                  
										    	
										    	
												
										    	
										    	
										    	
										    	
												  
													
										        
											
									       
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Keep going."),
										    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {
		gatherSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			}),
		gatherFailure = cinematicMapHelper.Result(|params| {
			
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		healSuccess = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		healFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			
			}),
		
		rest = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="darkness", amount = config.rewards.darkness.low()},
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	do
		local quest = helper.CloneQuestDefinition("CrystalCave")
		quest.id = "CrystalCaveMountains"
		quest.visual = "MountainCave"
		helper.AddQuest(quest)
	end
	do
		local quest = helper.CloneQuestDefinition("HiddenChest")
		quest.id = "CrystalCaveWasteland"
		quest.visual = "DarkCave"
		helper.AddQuest(quest)
	end
end
