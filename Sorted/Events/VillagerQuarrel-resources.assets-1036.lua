


do 
	local quest = helper.QuestDefinition();
	quest.id = 'VillagerQuarrel'
	quest.visual = "MountainWanderer"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_MOUNTAINS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Village Quarrel"),
						            text = || __D(2, "\"For the last time, this goat escaped from my farm last night!\" claimed the farmer.\n\n\"Nonsense! This one has always been mine. You just want to steal it!\" answered the merchant, before we stepped in to avoid a dangerous fight."),
						    		icon = || "Asst_VillagerQuarrel",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Calm the waters."),
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
										            text = || __D(4, "We convinced them to calm down, avoiding an uglier situation.\n\nAfter a while talking, the farmer gave up on the goat and, in return, the merchant offered to help him find his."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
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
										            text = || __D(5, "We suggested cutting the goat in half, which triggered such a brawl that even the animal delivered its fair share of blows.\n\nShortly after, they ended up going their separate ways."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Side with the merchant."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "We weren't sure of our decision, but a goat isn't enough of a reason for violence.\n\nThe farmer, furious, walked away as the merchant thanked us for the aid."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.merchant,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Side with the farmer."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We weren't sure of our decision, but a goat isn't enough of a reason for violence.\n\nThe merchant, furious, walked away as the farmer thanked us for the aid."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.farmer,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
		}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},
		}),

		merchant = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		farmer = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="item", itemId = "food", amount = 1},
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
