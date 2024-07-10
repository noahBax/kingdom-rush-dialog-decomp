



do 
	local quest = helper.QuestDefinition();
	quest.id = 'DeerHerd'
	quest.visual = "ForestTree"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "A Deer Herd"),
						            text = || __D(2, "A deer herd is browsing on some shrubs.\n\nThey haven't noticed us yet."),
						    		icon = || "Asst_DeerHerd",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Hunt them from afar."),
						    				challenge = {
						    					requirements =  |t| t("ct_survival") and t("ct_ranged")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "*Swoosh!*##We got one!\n\nWe got some venison and hides out of it.\n\nWe ended up cooking a quite invigorating pottage out of the venison."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.huntSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
												            end,
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
										            text = || __D(5, "*Swoosh!*##The arrow went flying past the herd.\n\nA stag charged against us, hitting us with its horns as the rest of the herd fled."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.huntFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
												            end,
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Lay some traps."),
						    				challenge = {
						    					requirements =  |t| t("ct_craft")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "We laid some traps and waited for a while.##We got some venison and hides out of it.\n\nWe ended up cooking an invigorating pottage out of the venison."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.trapSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
												            end,
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													    	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
													    	print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
													end,
										            text = || __D(8, "We laid some traps and waited for a while.##No luck!\n\nAll we did was waste energy and resources!"),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.trapFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(9, "Sneak up on them."),
						    				challenge = {
						    					requirements =  |t| t("ct_stealth")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(10, "We crept up on the deer and managed to take one down.\n\nWe got some valuable hides and a decent meal out of it."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
												            end,
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													    	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
													    	print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
													end,
										            text = || __D(11, "We tried to creep up on the deer, but as we were about to jump them, they noticed us, and a buck rammed us with its horns, chasing us off."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(12, "Let them browse in peace."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(13, "We chose to let the herd browse in peace.\n\nThose forest creatures meant no harm to us."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
										            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") +1))
										            	print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
										            end,
										    		exit = true
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {

		huntSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid() },
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		huntFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		trapSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid() },
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		trapFailure = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		stealthSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid() },
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		stealthFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 1
end
