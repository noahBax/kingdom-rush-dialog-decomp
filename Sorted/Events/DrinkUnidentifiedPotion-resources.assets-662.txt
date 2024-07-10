

do 
	local quest = helper.QuestDefinition();
	quest.id = 'DrinkUnidentifiedPotion'
	
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "An Unidentified Potion"),
						            text = || __D(2, "We examine the potion, unaware of its properties."),
						    		icon = || "Asst_DrinkPotion",
						    		who = || "mapCinematicId",
						    		children = {
						           		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Select a drinker."),
		                                    children = {
			                                    {
										            type = DialogType.Dialog,
										            text = || __D(4, "Who should drink the potion?"),
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
						                                    text = || __R(5, "Drink the potion."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    children = {
														        {
								                                    type = DialogType.Dialog,
								                                    id = "challenge",
								                                    text = || __D(6, "We drank the potion, hoping for the best."),
								                                    who = || "mapCinematicId",
								                                    onEnter = function (d,n)
								                                    	local resultsAvailable = {}

								                                    	
								                                    	table.insert(resultsAvailable, "minor")
								                                    	table.insert(resultsAvailable, "normal")
								                                    	table.insert(resultsAvailable, "full")
								                                    	table.insert(resultsAvailable, "increased")
							                                    		table.insert(resultsAvailable, "invigorating")
							                                    		table.insert(resultsAvailable, "improvedHealing")
							                                    		table.insert(resultsAvailable, "energyHealing")
							                                    		table.insert(resultsAvailable, "blessing")
							                                    		table.insert(resultsAvailable, "buff")
							                                    		table.insert(resultsAvailable, "cripplingHealing")
							                                    		table.insert(resultsAvailable, "exhaustingHealing")
							                                    		table.insert(resultsAvailable, "expiredHealing")
							                                    		table.insert(resultsAvailable, "poison")
							                                    		table.insert(resultsAvailable, "powerfulPoison")
							                                    		table.insert(resultsAvailable, "slepping")
							                                    		table.insert(resultsAvailable, "deadlyPoison")

								                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)

								                                    	d.data.outcome = randomOutcome
								                                    end,
								                                    children = { 
								                                    	{
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "minor",
																            text = || __D(7, "Drinking the potion was worth the risk.##It had minor healing properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.minor,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
								                                    	{
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "normal",
																            text = || __D(8, "Drinking the potion was worth the risk.##It had healing properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.normal,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "full",
																            text = || __D(9, "Drinking the potion was worth the risk.##It had amazing healing properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.full,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "increased",
																            text = || __D(10, "Drinking the potion was worth the risk.##It had outstanding healing properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.increased,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "invigorating",
																            text = || __D(11, "Drinking the potion was worth the risk.##It had invigorating properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.invigorating,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "improvedHealing",
																            text = || __D(12, "Drinking the potion was worth the risk.##It had wound-restoring properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.improvedHealing,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "energyHealing",
																            text = || __D(13, "Drinking the potion was worth the risk.##It had both healing and invigorating properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.invigorating,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "blessing",
																            text = || __D(14, "Drinking the potion was worth the risk.##It feels like luck is now on our side somehow."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.blessing,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "buff",
																            text = || __D(15, "Drinking the potion was worth the risk.##It had incredible properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.buff,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "cripplingHealing",
																            text = || __D(16, "We're not sure if drinking the potion was worth the risk.##It had amazing healing properties but at the expense of vitality."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.cripplingHealing,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "exhaustingHealing",
																            text = || __D(17, "We're not sure if drinking the potion was worth the risk.##It had decent healing properties but at the expense of energy."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.exhaustingHealing,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "expiredHealing",
																            text = || __D(18, "We're not sure if drinking the potion was worth the risk.##It had decent healing properties but at the expense of energy."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.expiredHealing,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "poison",
																            text = || __D(19, "Drinking the potion was an awful idea.##It ended up being poisonous."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.poison,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "powerfulPoison",
																            text = || __D(20, "Drinking the potion was an awful idea.##It ended up being incredibly poisonous."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.powerfulPoison,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "slepping",
																            text = || __D(21, "Drinking the potion was a bad idea.##It ended up having energy-draining properties."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.slepping,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "deadlyPoison",
																            text = || __D(22, "Drinking the potion was an awful idea.##It ended up being a deadly poison!"),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.deadlyPoison,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        }
																    }
								                                },
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
						                                    text = || __R(23, "Drink the potion."),
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
						                                    text = || __R(24, "Drink the potion."),
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
						                                    text = || __R(25, "Drink the potion."),
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
								            text = || __R(26, "Put the potion away."),
								    		who = || "mapCinematicId",
								    		children = {
									            {
										            type = DialogType.Dialog,
										            text = || __D(27, "We chose not to drink the unidentified potion for the time being."),
										    		who = || "mapCinematicId",
										            exit = true
										        }
									        }
								        }
									}
						        }
						    })

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),		
								}))

	quest.results = {
		minor = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 1, targets =  {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		normal = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets =  {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		full = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 99, targets =  {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		increased = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 99, targets =  {params.hero}},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		invigorating = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		improvedHealing = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		energyHealing = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="doHeal", amount = 3, targets =  {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		blessing = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		buff = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		cripplingHealing = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 99, targets =  {params.hero}},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		expiredHealing = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets =  {params.hero}},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		exhaustingHealing = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 3, targets =  {params.hero}},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		poison = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets =  {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		powerfulPoison = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="doDamage", amount = 2, targets =  {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		slepping = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		deadlyPoison = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="doDamage", amount = 2, targets =  {params.hero}},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),


	}

	

	helper.AddQuest(quest)
	quest.revealDistance = 1
	quest.consumesDay = || false
end
