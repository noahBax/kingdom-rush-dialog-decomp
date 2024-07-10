

do 
	local quest = helper.QuestDefinition();
	quest.id = 'IceMaidens'
	quest.visual = "AncientShrine"
	quest.kindFlag = "Enigma"
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Ice Maidens"),
						            text = || __D(2, "We spot an inviting gleam coming from inside a cave we came across, so we step inside.\n\nHere, three pristine ice sculptures of what seem like deities stand before our eyes."),
						    		icon = || "Asst_IceMaidens",
						    		who = || "mapCinematicId",
						    		children = {
						           		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Touch them."),
		                                    children = {
			                                    {
										            type = DialogType.Dialog,
										            text = || __D(4, "Not sensing any danger coming from them, we decide to pick one of us to try touching them.\n\nWho should go first?"),
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
						                                    text = || __R(5, "Select hero"),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    children = {
														        {
								                                    type = DialogType.Dialog,
								                                    id = "touchSculptures",
								                                    text = || __D(6, "Which one should we touch?"),
								                                    who = || "mapCinematicId",
								                                    children = { 
								                                    	{
																            type = DialogType.Response,
																            text = || __R(7, "The Nurse"),
																            children = {
															    				{
																		            type = DialogType.Dialog,
																		            text = || __D(8, "Touching the statue, its healing effect could be felt instantly.\n\nSuddenly, the cave started to collapse on us, making us rush outside. Sadly, the entrance was left completely sealed with rubble."),
																		    		who = || "mapCinematicId",
																		            children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.nurse,
																		    				rewardsParams = |d,n| {hero = d.data.hero},
																				    		exit = true
																						}
																		        	}
																		        },
																        	}
																        },

																        {
																            type = DialogType.Response,
																            text = || __R(9, "The Priestess"),
																            children = {
															    				{
																		            type = DialogType.Dialog,
																		            text = || __D(10, "Touching the statue, its blessing effect could be felt instantly.\n\nSuddenly, the cave started to collapse on us, making us rush outside. Sadly, the entrance was left completely sealed with rubble."),
																		    		who = || "mapCinematicId",
																		            children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.priestess,
																		    				rewardsParams = |d,n| {hero = d.data.hero},
																				    		exit = true
																						}
																		        	}
																		        },
																        	}
																        },

																        {
																            type = DialogType.Response,
																            text = || __R(11, "The Warrior"),
																            children = {
															    				{
																		            type = DialogType.Dialog,
																		            text = || __D(12, "Touching the statue, its invigorating effect could be felt instantly.\n\nSuddenly, the cave started to collapse on us, making us rush outside. Sadly, the entrance was left completely sealed with rubble."),
																		    		who = || "mapCinematicId",
																		            children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.warrior,
																		    				rewardsParams = |d,n| {hero = d.data.hero},
																				    		exit = true
																						}
																		        	}
																		        },
																        	}
																        },

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
						                                    text = || __R(13, "Select hero"),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "touchSculptures"
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
						                                    text = || __R(14, "Select hero"),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "touchSculptures"
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
						                                    text = || __R(15, "Select hero"),
						                                    who = |d,n| n.data.hero.GUID,
						                                    onChoose = function (d, n)
						                                    	d.data.hero = n.data.hero
						                                    end,
						                                    jumpTo = "touchSculptures"
						                                },
						                            }
						                        }
						                    }
			                            },
		                                {
								            type = DialogType.Response,
								            text = || __R(16, "Leave and move on."),
								    		who = || "mapCinematicId",
								    		children = {
									            {
										            type = DialogType.Dialog,
										            text = || __D(17, "We chose to leave the cave without messing with the sculptures."),
										    		who = || "mapCinematicId",
										            exit = true
										        }
									        }
								        }
									}
						        }
						    })


	quest.results = {
		nurse = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 99, targets =  {params.hero}},
			}),
		priestess = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		warrior = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
