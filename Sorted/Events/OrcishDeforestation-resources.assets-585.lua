

do 
	local quest = helper.QuestDefinition();
	quest.id = 'OrcishDeforestation'
	quest.visual = "Orc"
	quest.kindFlag = "Challenge"
	quest.encounters = {'combat_orcishDeforestation'}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK", "BLOCKER"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Orcish Deforestation"),
						            text = || __D(2, "We find a group of orcs cutting and burning trees next to an encampment. They haven't noticed us yet, leaving us time to decide what we want to do next."),
						    		icon = || "Asst_OrcishDeforestation",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Infiltrate the encampment."),
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
								            		text = || __D(4, "The orcs were so immersed in their work that only a few of them were guarding the encampment.\n\nWe sneaked past the guards and searched through their belongings, where we found some valuable items."),
								            		who = || "mapCinematicId",
								           			children = {
										        		{
										        			type = DialogType.Custom,
								    						subtype = "rewards",
								    						rewards = || quest.results.infiltrateSuccess,
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
							            			text = || __D(5, "We got past the guards successfully.\n\nUnfortunately, we knocked over a brazier next to one of the tents in the encampment, setting it aflame.\n\nChaos ensued, and we were chased away by the alerted orcs."),
							            			who = || "mapCinematicId",
							           				children = {
									        			{
									        				type = DialogType.Custom,
							    							subtype = "rewards",
							    							rewards = || quest.results.infiltrateFailure,
							    							rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
									    					exit = true
														}
									    			}
								    			}
				    						}
						    			},
						    			{
		                                    type = DialogType.Response,
		                                    text = || __R(6, "Fight them!"),
										   	exit = true,
											onChoose = function ()
											
											
											
											cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_orcishDeforestation'}
											cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
											end	
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Ignore the orcs."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We chose not to pick a fight, and we left the orcs doing their thing.\n\nThey never knew we had passed by."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
					        		}
					        	}
					        })

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
			cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})},
			{type="unit.attribute", kind = "armor_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		infiltrateSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount =  config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midLoot" , quantity = || 1, slot = 1},
			})}

			}),
		infiltrateFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
