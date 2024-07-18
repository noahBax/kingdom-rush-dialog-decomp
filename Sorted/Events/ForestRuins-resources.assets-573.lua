

do 
	local quest = helper.QuestDefinition();
	quest.id = 'ForestRuins'
	quest.visual = "Ruins"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","FIXED","NORMAL","TERRAIN_PLAINS", "TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
					            	type = DialogType.Dialog,
						            narrator = || __N(1, "The Forest Ruins"),
						            text = || __D(2, "We reach some forgotten ruins full of derelict statues.\n\nThe vine-covered statues are but a shadow of their former glory.\n\nHowever, the vines could prove useful, were we to craft healing potions."),
						    		icon = || "Asst_AncientRuins",
						    		who = || "mapCinematicId",
						    		children={
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Collect some vines."),
						    				challenge = {
						    					requirements =  |t| t("ct_wisdom") 
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We harvested as many vines as we could."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.collectSuccess,
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
										            text = || __D(5, "We spent a while collecting some vines.\n\nHowever, after consuming them, we noticed they were not of the healing kind but quite harmful!"),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.collectFailure,
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
						    				text = || __R(6, "Study the statues."),
						    				challenge = {
						    					requirements =  |t| t("ct_knowledge")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "We thoroughly studied the statues and their inscriptions.\n\nWe learned valuable information about the Old Kingdom's history."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.studySuccess,
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
										            text = || __D(8, "We attempted to understand more about the origins of the Old Kingdom.\n\nUnfortunately, our inexperience in reading engravings resulted in us receiving a curse."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.studyFailure,
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
						    				text = || __R(9, "Cast restore on the statues."),
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
										            text = || __D(10, "We uttered the magic words and the spell resounded all over the chamber as the statues shone, returning to their former glory.\n\nWe noticed some gems were restored as well!"),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicSuccess,
										    				onChoose = function(d,n)
										    					print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
												            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") +1))
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
										            text = || __D(11, "We harnessed all of our energy trying to cast the restoration spell, to the point of hurting ourselves from exhaustion.\n\nHowever, we weren't able to completely restore the statues."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                	type = DialogType.Response,
		                                    text = || __R(12, "Exit the ruins."),
										   	exit = true
								        }
		                            }
	                            }
						    })

	quest.results = {

		collectSuccess = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		collectFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),
		studySuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and (config.rewards.starXp.eHigh()*1.5) or (params.normal and (config.rewards.starXp.eMid()*1.5) or (config.rewards.starXp.eLow()*1.5))},
			}),
		studyFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			}),
		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="giveXP", amount = params.hard and (config.rewards.starXp.eHigh()*1.5) or (params.normal and (config.rewards.starXp.eMid()*1.5) or (config.rewards.starXp.eLow()*1.5))},
			}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
