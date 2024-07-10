



do 
	local quest = helper.QuestDefinition();
	quest.id = 'DarkArmyCheckpoint'
	quest.visual = "DarkKnight"
	quest.encounters = {"combat_DarkArmyCheckpoint"}
	quest.kindFlag = "Enigma"
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS","BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            condition = || (cinematicMapHelper.HeroByTag("DarkKnight") == nil) and (cinematicMapHelper.HeroByTag("Asra") == nil) and (cinematicMapHelper.HeroByTag("Oloch") == nil),
						            narrator = || __N(1, "Dark Army Checkpoint"),
						            text = || __D(2, "A group of Dark Knights blocks our path.\n\n\"Stop right there! We are confiscating healing potions to support our war efforts.\""),
						    		icon = || "Asst_DarkArmy",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Negotiate with them."),
						    				challenge = {
						    					requirements =  |t| t("ct_social")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We stood before the guards and assertively told them that we were on a mission to stop the Cult.\n\n\"The enemy of my enemy is my friend,\" said the Dark Knights, handing us a potion."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
										    				onChoose = function(d,n)
												            	cinematicMapHelper.CurrentQuestStatus().context.SetInt("solved", 1)
												            end,
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
										            text = || __D(5, "We said we were on a mission but the Dark Knights laughed in our faces.\n\n\"I wouldn't care if you were doing a mission for Vez'Nan himself.\nNow, let's check your belongings.\""),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Let them check you."),
										   	children = {
												{
													type = DialogType.Dialog,
													condition = || cinematicMapHelper.HasItemInInventory("healthPotion"),
			                                    	text = || __D(7, "The Dark Knights started checking our belongings and took one of our potions.\n\n\"Aha! You won't be needing this anymore.\nYou may pass.\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.hasPotion,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = || (cinematicMapHelper.HasItemInInventory("healthPotion") == false),
			                                    	text = || __D(8, "The Dark Knights started checking our belongings but found no potions.\n\n\"Nothing worth our time here.\nYou may pass.\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.noPotion,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
						    				type = DialogType.Response,
								            text = || __R(9, "Fight them!"),
								            exit = true,
											onChoose = function ()
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
												cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_DarkArmyCheckpoint'}
											end	
		                                }
						        	}
						        },
						        {
						            type = DialogType.Dialog,
						            condition = || (cinematicMapHelper.HeroByTag("DarkKnight") != nil) or (cinematicMapHelper.HeroByTag("Asra") != nil) or (cinematicMapHelper.HeroByTag("Oloch")!= nil),
						            narrator = || __N(10, "Dark Army Checkpoint"),
						            text = || __D(11, "A group of Dark Knights blocks our path, but as soon as they see we have one of them on our side, they let us through and hand us a potion for the road."),
						    		icon = || "Asst_DarkArmy",
						    		who = || "mapCinematicId",
						            children = {
										{
						    				type = DialogType.Custom,
						    				subtype = "rewards",
						    				rewards = || quest.results.hasDK,
						    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
								    		exit = true
										}
						        	}
						        }
						    })

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ConditionalIf(|| not cinematicMapHelper.AnyHeroDiedInLastCombat(), cinematicMapHelper.Sequence({
									cinematicMapHelper.AchievementIncrement(|| "dark_knight_unlock",|| 1),
								})),
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.fight, || {}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
								
							}))

	quest.results = {
		hasDK = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "healthPotion", amount = 1 },
			}),
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "healthPotion", amount = 1 },
			}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "healthPotion", amount = -1 },
			{type="guild.attribute", kind = "loot", amount = -config.rewards.loot.low()},
			}),
		hasPotion = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", itemId = "healthPotion", amount = -1 },
			}),
		noPotion = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		fight = cinematicMapHelper.Result(|params| {
			
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="giveXP", amount = config.rewards.starXp.low()},
			{type="checkInjuries"},
			{type="item", itemId = "healthPotion", amount = 1 },
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = config.rewards.darkness.leave()},
			{type="checkInjuries"}
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;

	quest.revealDistance = 2

end
