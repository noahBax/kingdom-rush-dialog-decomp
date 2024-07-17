

do 
	local quest = helper.QuestDefinition();
	quest.id = 'GuardDuty'
	
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Guard Duty"),
						            text = || __D(2, "Frightening sounds can be heard all around our campsite.\n\nSomeone should stay awake and keep watch."),
						    		icon = || "Asst_MountainAbandonedCamp",
						    		who = || "mapCinematicId",
						            children = {
						           		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Select a guard."),
		                                    children = {
			                                    {
										            type = DialogType.Dialog,
										            text = || __D(4, "Who should stay awake?"),
										    		who = || "mapCinematicId",
												    children = {
												        {
						                                    type = DialogType.Response,
						                                    condition = function (d, n)
						                                    	local hero = cinematicMapHelper.HeroByIndex(0)
						                                    	if hero ~= nil then
						                                    		n.data.hero = hero
						                                    		return true
						                                    	else 
						                                    		return false
						                                    	end

						                                    end,
						                                    text = || __R(5, "Keep watch."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    children = {
														        {
														            id = "challenge",
								                                    type = DialogType.Dialog,
								                                    text = || __D(6, "A few animals tried to enter our campsite, but our guard made sure they were kept at bay.\n\nAlthough tiresome, keeping watch was the right call."),
								                                    who = || "mapCinematicId",
								                                    children = { 
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.success,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
																    },
								                                }
												        	}
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    condition = function (d, n)
						                                    	local hero = cinematicMapHelper.HeroByIndex(1)
						                                    	if hero ~= nil then
						                                    		n.data.hero = hero
						                                    		return true
						                                    	else 
						                                    		return false
						                                    	end

						                                    end,
						                                    text = || __R(7, "Keep watch."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "challenge"
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    condition = function (d, n)
						                                    	local hero = cinematicMapHelper.HeroByIndex(2)
						                                    	if hero ~= nil then
						                                    		n.data.hero = hero
						                                    		return true
						                                    	else 
						                                    		return false
						                                    	end

						                                    end,
						                                    text = || __R(8, "Keep watch."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "challenge"
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    condition = function (d, n)
						                                    	local hero = cinematicMapHelper.HeroByIndex(3)
						                                    	if hero ~= nil then
						                                    		n.data.hero = hero
						                                    		return true
						                                    	else 
						                                    		return false
						                                    	end

						                                    end,
						                                    text = || __R(9, "Keep watch."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "challenge"
						                                },
						                            }
						                        }
						                    }
			                            },
			                            {
		                                    type = DialogType.Response,
		                                    text = || __R(10, "No guard."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(11, "We decided to risk it, and we slept without guards.\n\nA few wolves attacked us during the night.\n\nWe managed to scare them off, but they got a few bites in anyway."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.risk,
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
		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		risk = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
end
