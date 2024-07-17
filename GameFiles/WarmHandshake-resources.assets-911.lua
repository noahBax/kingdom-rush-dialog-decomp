

do 
	local quest = helper.QuestDefinition();
	quest.id = 'WarmHandshake'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Warm Handshake"),
						            text = || __D(2, "An old sorcerer approaches us with a smile on his face.\n\n\"Hello, adventurers! Going to defeat the Cult? I can assist by enhancing your power ... for a price, of course!\" he says."),
						    		icon = || "Asst_DemonTrickster",
						    		who = || "mapCinematicId",
						            children = {
						           		{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 20,
		                                    text = || __R(3, "Deal!"),
		                                    children = {
			                                    {
										            type = DialogType.Dialog,
										            text = || __D(4, "\"Good ... good! Who shall be the ... blessed one?\""),
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
						                                    text = || __R(5, "Select hero."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    children = {
														        {
														            type = DialogType.Dialog,
														            id = "dealStruck",
														            text = || __D(6, "With a painful handshake, we started to feel our power grow as he started to morph and reveal his true demonic form.\n\n\"Hehehe ... you're welcome!\" he said, just before vanishing, leaving us with a burned hand."),
														    		
														    		who = || "mapCinematicId",
														            children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.dealStruck,
														    				rewardsParams = |d,n| {hero = d.data.hero},
														    				onChoose = function(d,n)
																            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
																            end,
																    		exit = true
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
						                                    text = || __R(7, "Select hero."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "dealStruck"
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
						                                    text = || __R(8, "Select hero."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "dealStruck"
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
						                                    text = || __R(9, "Select hero."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "dealStruck"
						                                },
						                            }
						                        }
						                    }
			                            },

		                                {
								            type = DialogType.Response,
								            text = || __R(10, "Refuse and move on."),
								    		who = || "mapCinematicId",
								    		children = {
									            {
										            type = DialogType.Dialog,
										            text = || __D(11, "We decided to thank the sorcerer and move on.\n\nHe seemed pretty offended, walking away cussing and groaning until we lost sight of him."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
										            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
										            end,
										            exit = true
										        }
									        }
								        }
									}
						        }
						    })

	quest.results = {
		
		dealStruck = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
		}),

	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 2)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
