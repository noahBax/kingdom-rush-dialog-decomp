

do 
	local quest = helper.QuestDefinition();
	quest.id = 'GlowingWell'
	quest.visual = "WellOfWonders"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Glowing Well"),
						            text = || __D(2, "We find a glowing well with just enough water to fill up a single bucket."),
						    		icon = || "Asst_WellofWonders",
						    		who = || "mapCinematicId",
						            children = {
						           		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Choose someone to drink it."),
		                                    children = {
			                                    {
										            type = DialogType.Dialog,
										            text = || __D(4, "Who should drink from the well?"),
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
						                                    text = || __R(5, "Drink!"),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    children = {
														        {
														            id = "challenge",
								                                    type = DialogType.Dialog,
								                                    text = || __D(6, "The well's water had empowering properties!"),
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
						                                    text = || __R(7, "Drink!"),
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
						                                    text = || __R(8, "Drink!"),
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
						                                    text = || __R(9, "Drink!"),
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
		                                    text = || __R(10, "Share the water."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(11, "We all drank from the well.\n\nAlthough it wasn't enough water to empower a single one of us, drinking from it made us stronger as a group."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.share,
										    				rewardsParams = |d| {},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
			                            {
		                                    type = DialogType.Response,
		                                    text = || __R(12, "Move on."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(13, "We chose not to risk drinking from the strange well and moved on."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		share = cinematicMapHelper.Result(|params| {
			{type="giveStar", amount = 1},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
end
