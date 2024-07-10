

do 
	local quest = helper.QuestDefinition();
	quest.id = 'SpareACoin'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Spare a Coin?"),
						            text = || __D(2, "\"Spare a coin for a fella down on 'is luck, won't ya, pal?\" says the rag-covered beggar as he holds up his hand, expecting a coin."),
						    		icon = || "Asst_AshHermit",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 5,
		                                    text = || __R(3, "Sure!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "The beggar grabbed the coin and bit it to check its authenticity.\n\n\"Thank you, kind adventurers. Blessings upon ya!\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.giveCoin,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") +1))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 25,
		                                    text = || __R(5, "With pleasure!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "The beggar grabbed the coin pouch with widened eyes.\n\n\"Wow! This here is enough to turn me life 'round, folks. Safe travels to ya!\nMay your roads shine the brightest!\""),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.givePouch,
										    				rewardsParams = || {},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") +2))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Next time!"),
										    children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "The beggar blew a raspberry at us and then walked away."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
										            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
										            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") -1))
										            end,
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {

		giveCoin = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -5},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
		givePouch = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -25},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
			
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)

	
	quest.interruptByChance = || helper.PriorityAndSlots(3, 3)
	quest.autoRevealWhenClose = |qs| false
end
