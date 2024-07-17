

do 
	local quest = helper.QuestDefinition();
	quest.id = 'GlareMaskEphemeral'
	
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Mask of Sorrow"),
						            text = || __D(2, "We decide to use the mask to harness its powers.\n\nIt starts to glow the moment we hold it in our hands."),
						    		icon = || "Asst_GlareMaskEphemeral",
						    		who = || "mapCinematicId",
						    		children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Continue."),
		                                    children = {
			                                    {
										            type = DialogType.Dialog,
										            text = || __D(4, "Who should wear it?"),
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
								                                    id = "challenge",
								                                    text = || __D(6, "The hero grabs the glowing mask and slowly brings it near their face."),
								                                    who = || "mapCinematicId",
								                                    onEnter = function (d,n)
								                                    	local resultsAvailable = {}

								                                    	
								                                    	table.insert(resultsAvailable, "life")
								                                    	table.insert(resultsAvailable, "curse")
								                                    	table.insert(resultsAvailable, "damage")
							                                    		table.insert(resultsAvailable, "exhaust")

								                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)

								                                    	d.data.outcome = randomOutcome
								                                    end,
								                                    children = { 
								                                    	{
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "life",
																            text = || __D(7, "Once the mask was close enough, needles emerged from its interior onto the hero's face, instantly attaching itself.\n\nThe hero felt more powerful afterwards, but the pain never ceased."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.life,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
								                                    	{
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "curse",
																            text = || __D(8, "The hero instantly felt a new kind of power flowing through them.\n\nStrangely, after a while, the hero started to feel somehow off."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.curse,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "damage",
																            text = || __D(9, "The moment the mask touched the hero's face, it released a burst of energy that sent the hero flying back against the nearest rock.\n\nOnce the pain went away, they could feel their new increased strength."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.damage,
																    				rewardsParams = |d,n| {hero = d.data.hero},
																		    		exit = true
																				}
																        	}
																        },
																        {
																            type = DialogType.Dialog,
																            condition = |d| d.data.outcome == "exhaust",
																            text = || __D(10, "Once it was close enough, the mask started draining the hero's life force for an instant, until it finally attached itself to the hero's face.\n\nThe hero felt both enhanced and exhausted at the same time."),
																    		who = || "mapCinematicId",
																            children = {
																				{
																    				type = DialogType.Custom,
																    				subtype = "rewards",
																    				rewards = || quest.results.exhaust,
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
						                                    text = || __R(11, "Select hero."),
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
						                                    text = || __R(12, "Select hero."),
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
						                                    text = || __R(13, "Select hero."),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "challenge"
						                                },
													}
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
		life = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			}),

		curse = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			}),

		exhaust = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),

		damage = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="doDamage", amount = 3, targets =  {params.hero}},
			}),

	}

	quest.consumesDay = || false

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
