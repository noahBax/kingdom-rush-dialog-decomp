

do 
	local quest = helper.QuestDefinition();
	quest.id = 'HopefulPresent'
	quest.visual = "Soldier"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "A Hopeful Present"),
						            text = || __D(2, "A Linirean soldier appears from behind a rock and approaches us with a package in his hands.\n\n\"I've been sent with supplies for those who fight to bring the light back to Linirea.\""), 
						    		icon = || "Asst_LoyalEmissary",
						    		who = || "mapCinematicId",
						            children = {

						            	{
		                                    type = DialogType.Response,
		                                    condition = || cinematicMapHelper.HeroByTag("GoodLegend") != nil, 
                           					who = || cinematicMapHelper.HeroByTag("GoodLegend").GUID,
		                                    text = || __R(3, "Accept."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We accepted the package of goods and watched as the soldier mounted his horse and disappeared in the distance before resuming our quest."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.accept,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
												}
									        }
		                                },

							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Ask for supplies."),
						    				challenge = {
						    					requirements =  |t| t("ct_legend")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "We convinced him to leave aside the animosity and aid us in our mission, as we were fighting against a common enemy.\n\nHe reluctantly agreed and gave us some of the goods before mounting his horse and disappearing in the distance."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.legendSuccess,
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
										            text = || __D(7, "We tried to convince him, but we couldn't set aside our moral differences, triggering a short brawl that left us with some bruises before he mounted his horse and disappeared in the distance."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.legendFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Ignore him and move on."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "Not interested in his offer, we just ignored him and kept walking."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		accept = cinematicMapHelper.Result(|params| {
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "buffItem", quantity = || 1, slot = 1},
			})},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midPotion", quantity = || 1, slot = 1},
			})},
		}),

		legendSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midPotion", quantity = || 1, slot = 1},
			})},
		}),
		legendFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = {params.hero}},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
