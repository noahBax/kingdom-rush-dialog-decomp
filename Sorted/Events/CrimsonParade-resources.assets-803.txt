

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CrimsonParade'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Crimson Parade"),
						            text = || __D(2, "A large group of cultists is walking in single file toward us. We get ready for an uneven fight, but it seems they don't even notice us and pass us by.\n\nIt's clear now that they're in some kind of trance, heading to a nearby cave."),
						    		icon = || "Asst_CultistWalking",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Pickpocket them!"),
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
										            text = || __D(4, "We carefully took what we could from them without breaking them out of their trance, and moved on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
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
										            text = || __D(5, "After accidentally waking one of them from their trance, we immediately started to run away, just before the rest started chasing after us.\n\nEventually, we lost them and proceeded to resume our journey, after regaining our breath."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
								        
							    		{
		                                    type = DialogType.Response,
		                                    condition = || cinematicMapHelper.HeroByTag("ct_wisdom") != nil,
                           					who = || cinematicMapHelper.HeroByTag("ct_wisdom").GUID,
		                                    text = || __R(6, "Study them."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(7, "Quietly, we followed them to learn more about their customs and practices.\n\nOnce we learned enough, we resumed our adventure."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.wisdomSuccess,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
										        	}
												}
									        }
		                                },

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Ignore them."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We decided not to mess with them given our numerical disadvantage, and we moved on once they all entered the cave."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
												        cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												    end,
												    exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		stealthSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowPotion", quantity = || 1, slot = 1},
			})},

		}),
		stealthFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),

		wisdomSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
