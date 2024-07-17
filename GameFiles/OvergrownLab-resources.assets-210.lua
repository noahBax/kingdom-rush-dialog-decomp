

do 
	local quest = helper.QuestDefinition();
	quest.id = 'OvergrownLab'
	quest.visual = "SilveroakSylvanOutpost"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Overgrown Lab"),
						            text = || __D(2, "We find an abandoned building surrounded by overgrown vines and bushes.\n\nWhile investigating, we discover a worn wooden sign lying beside the door. This used to be an alchemist's laboratory.\n\nIf we are lucky, there might be something of use inside."),
						    		icon = || "Asst_OvergrownLab",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    condition = || cinematicMapHelper.HeroByTag("ct_craft") != nil,
                           					who = || cinematicMapHelper.HeroByTag("ct_craft").GUID,
		                                    text = || __R(3, "Use the tools."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We decided to invest our time there improving some of our weapons with the high-quality tools we found lying around.\n\nAfter a while, the vines kept growing inside the building, forcing us to get out."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.searchLabForTools,
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
						    				text = || __R(5, "Search the lab for potions."),
						    				challenge = {
						    					requirements =  |t| t("ct_survival") or t("ct_knowledge")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "Among the many empty vials, we found a couple full of potions. Upon further inspection, we recognized them as beneficial potions."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.searchLabForPotionsSuccess,
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
										            text = || __D(7, "We weren't careful enough in our search and turned the whole house upside down again.\n\nAs a result, we destroyed many of the full vials, mixing their contents and releasing toxic fumes."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.searchLabForPotionsFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Move on."),
		                                    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {
		searchLabForTools = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		searchLabForPotionsSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "midPotion", quantity = || 1, slot = 1},
			})},
			}),
		searchLabForPotionsFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(1)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))

	quest.shouldRun = function (qs)
		local solved = qs.context.GetInt("solved");
		return  solved == 0
	end

	quest.canHaveInterrupt = false;

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
