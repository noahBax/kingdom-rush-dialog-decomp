

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheOrcFarm'
	quest.visual = "Farm"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Orc Farm"),
						            text = || __D(2, "We reach an old farm that looks somewhat different.\n\nUpon further review, we notice that a family of orc farmers is working the land.\nThey don't seem to be Krum's subjects."),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_TheOrcFarm",
						            children = {
								       	{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Attack the orcs!"),
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(4, "We charged the orc farmers, trying to reclaim our lands.\n\nMuch to our surprise, the orcs ran away, disappearing in the distance.\n\nWe found some valuables among their belongings."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.attack,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("linked.attackedOrcFarm", 1)
												            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") -1))
												            	cinematicMapHelper.Guild().context.SetInt("triggerOn.attackedOrcFarm", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
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
						    				text = || __R(5, "Sneak closer\nand\nobserve them."),
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
										            text = || __D(6, "The orcs were clearly trying to settle down there, and they didn't look like fighters at all.\n\nWe found some items and learned some more about our foes before moving on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success,
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
										            text = || __D(7, "We tried observing them from a distance, but they spotted us immediately and shouted some strange words at us before running away."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Let them be."),
 											children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We decided to let them be. These Orcs were not warriors, just farmers trying to make a living peacefully.\n\n\"Hmm ... maybe there's more to orcs than meets the eye.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
										            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") +1))
										            	print (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality"))
										            end,
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		attack = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			}),
		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		failure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.PartyRandom(2)},
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
