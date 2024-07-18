


do 
	local quest = helper.QuestDefinition();
	quest.id = 'SleepyWillow'
	quest.visual = "SilveroakColorfulTree"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK", "BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Sleepy Willow"),
						            text = || __D(2, "As we marched on, we found ourselves on a narrow path blocked by a giant willow.\n\nWhen we took a closer look, we realized that the tree was actually alive and sleeping soundly, its trunk and branches faintly moving. We had to get past it somehow."),
						    		icon = || "Asst_SleepyWillow",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Hack its branches."),
		                                    condition = || cinematicMapHelper.HeroByTag("ct_might") != nil,
		                                    who = || cinematicMapHelper.HeroByTag("ct_might").GUID,
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We aimed to cut the willow's lower branches to make space for us to pass. The willow hummed with rage and swung it's heavier branches against us.\n\nWhen it got bored of beating us, we managed to get through, collecting some leaves and bark to use for our potions."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.hackItsBranches,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Climb over it."),
						    				challenge = {
						    					requirements =  |t| t("ct_athletics")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "It was best to disturb the tree as little as possible, so we climbed up and made our way through its branches to the other side. If this bothered it, it didn't show."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.climbSuccess,
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
										            text = || __D(7, "We started climbing the tree, but our movements seemed to tickle it, causing it to shake and throw us off our feet a few times.\n\nEventually, we made it to the other side."),
										            who = || "mapCinematicId",
										            
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.climbFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
											type = DialogType.Custom,
		                                	subtype = "item",
		                                	item = || "horn",
		                                	text = || __R(8, "Blow a horn."),
		                                	who = || "mapCinematicId",
		                                	children = {
												{
													type = DialogType.Dialog,
							            			text = || __D(9, "The sound of the horn preceded a low humming that came from deep beneath the bark. Stretching and creaking, the willow moved, leaving us enough room to pass by its side.\n\nA gentle breeze made us feel refreshed as we passed under the willow's branches."),
									    			who = || "mapCinematicId",
									    			children = {
														{
									    					type = DialogType.Custom,
									    					subtype = "rewards",
									    					rewards = || quest.results.blowHorn,
									    					rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															exit = true
														}
													}		
												}
											}
										},
										{
		                                   	type = DialogType.Response,
		                                    text = || __R(10, "Backtrack and take a detour."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                		text = || __D(11, "Hoping to avoid any possible complications, we decided to retrace our steps and try to find another path forward."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.backtrackDetour,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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
		hackItsBranches = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="item", itemId = "healthPotion", amount = 1 },
			}),
		climbSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		climbFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			}),

		blowHorn = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "horn", amount = -1 },
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		backtrackDetour = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
