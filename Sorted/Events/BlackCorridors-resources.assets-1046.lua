

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BlackCorridors'
	quest.visual = "DarkCave"
	quest.kindFlag = "Challenge"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Black Corridors"),
						            text = || __D(2, "Our path leads us into a set of pitch-black tunnels, and after a while we notice we've been walking in circles, but can't see where to go or even where we came from."),
						    		icon = || "Asst_BlackCorridors",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "item",
						                    item = || "torch",
						                    text = || __R(3, "Light the way."),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(4, "Luckily for us, we had a torch to help us find the right way out of the dark and intertwined corridors of the cave."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useTorch,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
											    }
										     },
						    			},
							    		
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Find a way out."),
						    				challenge = {
						    					requirements =  |t| t("ct_perception") or t("ct_survival")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "Despite the oppressive darkness, we managed to get to the exit by using our other senses to get a better idea of the corridors' disposition."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.escapeSuccess,
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
										            text = || __D(7, "We thought we had found our way to the exit, but we walked into a chamber containing a stash of abandoned goods!\n\nUnfortunately, finding our way out of the labyrinth took a bit longer than expected."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.escapeFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Keep wandering."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "We kept walking through the dark corridors of the cave, dragging our feet for a long time until we finally found the right path to the exit."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.default,
										    				rewardsParams = || {},
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
		
		useTorch = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="item", itemId = "torch", amount = -1},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),
		
		escapeSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),
		escapeFailure = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midItems", quantity = || 1, slot = 1},
			})},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),

		default = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
