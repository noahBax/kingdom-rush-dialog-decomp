


do 
	local quest = helper.QuestDefinition();
	quest.id = 'DarkPresent'
	quest.visual = "ShadowArcher"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"TREASURE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "A Dark Delivery"),
						            text = || __D(2, "A shadow archer appears from behind a rock and approaches us with a package in her hands.\n\n\"I've been sent with supplies for those who fight in the name of Lord Vez'nan ... or at least don't miss Denas in the throne.\""), 
						    		icon = || "Asst_DarkEmissary",
						    		who = || "mapCinematicId",
						            children = {

						            	{
		                                    type = DialogType.Response,
		                                    condition = || (cinematicMapHelper.HeroByTag("DarkLegend") != nil) or (cinematicMapHelper.HeroByTag("NeutralLegend") != nil),
                           					who = || cinematicMapHelper.HeroByTag("ct_legend").GUID,
		                                    text = || __R(3, "Accept."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We accepted the package of goods and watched as the archer disappeared in a cloud of smoke before resuming our quest."),
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
										            text = || __D(6, "We convinced her to leave aside the animosity and aid us in our mission, as we were fighting against a common enemy.\n\nShe reluctantly agreed and gave us some of the goods before disappearing in a cloud of smoke."),
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
										            text = || __D(7, "We tried to convince her, but we couldn't set aside our moral differences, triggering a short brawl that left us with some bruises before she disappeared in a cloud of smoke."),
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
		                                    text = || __R(8, "Ignore her and move on."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(9, "Not interested in her offer, we just ignored her and kept walking."),
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
