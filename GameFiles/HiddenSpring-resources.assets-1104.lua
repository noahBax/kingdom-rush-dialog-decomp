



do 
	local quest = helper.QuestDefinition();
	quest.id = 'HiddenSpring'
	quest.visual = "Cave"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","FIXED","NORMAL","TERRAIN_PLAINS", "TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
					            	type = DialogType.Dialog,
						            narrator = || __N(1, "The Hidden Spring"),
						            text = || __D(2, "We find a hidden spring at the end of a cave's passage.\n\nAs we walk along the path, the ground begins to crumble below us!"),
						    		icon = || "Asst_Cave",
						    		who = || "mapCinematicId",
						    		children={
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Run!"),
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
										            text = || __D(4, "We ran for dear life, dodging what could have led to certain death, until we finally made it to the spring.\n\nWe drank from the spring and felt a soothing sensation caress our throats and our very souls."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundSuccess,
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
										            text = || __D(5, "We ran as fast as we could, but our fastest wasn't fast enough!\n\nWe ended up rolling and crashing through a series of tunnels until we came out at a different end of the cave."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Transmute the crumbling floor."),
						    				challenge = {
						    					requirements =  |t| t("ct_magic")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "The transmutation spell resounded along the passage, holding the ground in place.\n\nWe reached the spring and drank from it, feeling a soothing sensation caress our very souls."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundSuccess,
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
										            text = || __D(8, "Our magic wasn't strong enough to hold the ground in place, and we ended up falling through a series of tunnels, bashing and crashing against rocks until we came out at a different end of the cave."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(9, "Cling to the walls."),
						    				challenge = {
						    					requirements =  |t| t("ct_might")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(10, "We clung to the walls, fighting for dear life as the ground collapsed.\n\nWe climbed our way to safety and reached the spring.\n\nDrinking from it filled our bodies with a magical soothing sensation."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundSuccess,
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
										            text = || __D(11, "We clung to the walls as hard as we could, but the tremors of the collapsing cave caused us to fall and slide through a rough series of tunnels.\n\nWe ended up coming out at a different end of the cave."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                	type = DialogType.Response,
		                                    text = || __R(12, "Oh noooo!"),
		                                    condition = || cinematicMapHelper.HeroesWithRequirements(|t| t("ct_athletics") or t("ct_magic") or t("ct_might")).Count == 0,
										   	children = {
												{
										            type = DialogType.Dialog,
										            text = || __D(13, "The ground collapsed violently below us, and we fell through a series of rough tunnels, bashing and crashing against the rocks.\n\nWe ended up coming out at a different end of the cave."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.groundFailure,
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

		wanderSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		wanderFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		groundSuccess = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 100, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		groundFailure = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(2)},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		useTorch = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = -1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 1
end
