

do 
	local quest = helper.QuestDefinition();
	quest.id = 'IceBreaker'
	quest.visual = "Glaciar"
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Ice Breaker"),
						            text = || __D(2, "Strolling across a frozen lake, we hear a cracking noise behind us.\n\nLooking back, we see an enormous fissure growing toward us."),
						    		icon = || "Asst_FrozenLake",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Sprint off the lake!"),
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
										            text = || __D(4, "We sprinted off the lake just in time to avoid falling into the water.\n\nAfter recovering our breath, we continued our journey."),
										            who = || "mapCinematicId",
										            children = {
										            	{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsSuccess,
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
										            text = || __D(5, "We tried to reach the shore, but the ice shattered too quickly for us, making us fall into the chilling water.\n\nSoon after getting out, some of us started feeling ill."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.athleticsFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},

										{
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Stay together!"),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "When the ice completely shattered, we were safely standing still on the same ice plate.\n\nTrying to paddle our way to the shore, the paddler lost balance and fell into the gelid water."),
										    		who = || "mapCinematicId",
										    		children = {
										    			{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
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

		athleticsSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
		athleticsFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
end
