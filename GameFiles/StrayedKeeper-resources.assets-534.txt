



do 
	local quest = helper.QuestDefinition();
	quest.id = 'StrayedKeeper'
	quest.visual = "ForestTree"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Strayed Keeper"),
						            text = || __D(2, "We meet a blind forest keeper resting by a willow tree.\n\n\"Oh, forest children, I've lost the way to my soul tree. It's an old willow tree that hums softly when people are nearby.\n\nWould you help me find it?\""),
						    		icon = || "Asst_StrayedDryad",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Search for the tree."),
						    				challenge = {
						    					requirements =  |t| t("ct_perception")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We relaxed and started searching for the tree, listening carefully, trying to find a humming one.\n\nWe found it relatively quickly, so the keeper blessed us as a show of gratitude."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalSuccess,
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
										            text = || __D(5, "We spent the whole afternoon looking for the willow.\n\nCome nightfall, we finally found the tree.\n\nThe keeper was so tired she simply got inside the tree without rewarding us for the time lost."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.survivalFailure,
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
						    				text = || __R(6, "Use a divination spell."),
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
										            text = || __D(7, "A vast array of leaves started spiraling airborne as they led us toward the tree.\n\nThe keeper rewarded us with her blessing."),
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
										            text = || __D(8, "We attempted to use a divination spell with no success.\n\nWe kept casting the spell over and over again until our bodies were spent by the effort.\n\nAfter an hour trying, the keeper left."),
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
		                                    text = || __R(9, "Keep going."),
		                                    onChoose = function(d,n)
						    					cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality") -1))
						    					print (cinematicMapHelper.Guild().context.GetInt("linked.forestMorality"))
								            end,
										   	exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {

		survivalSuccess = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		survivalFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowLoot" , quantity = || 1, slot = 1},
			})}
			}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="doDamage", amount = 2, targets =  cinematicMapHelper.Party()},
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
