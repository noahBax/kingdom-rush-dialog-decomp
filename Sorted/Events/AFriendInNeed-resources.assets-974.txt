


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AFriendInNeed'
	quest.visual = "Ranger"
	quest.kindFlag = "Recruit"
	quest.encounters = {}
	quest.tags = {"RECRUIT","NARRATIVE","NORMAL"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						        	type = DialogType.Dialog,
						            narrator = || __N(1,"A Friend in Need"),
						            text = || __D(2,"A pleading voice can be heard coming from inside one of the cells.\n\n\"You! Yes, you! You're breaking out, right, buddy?\nHelp a fella' out, will you?\" the ranger said, pointing toward the bars of the cell."),
						    		icon = || "Asst_TutFriendInNeed",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Force\nthe bars\napart."),
						    				challenge = {
						    					requirements =  |t| t("ct_might")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "After struggling with the bars for a little while, one of them gave out.\n\nIt won't be enough space for the prisoner to squeeze through, but the bar could prove useful as a crowbar."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
										    				rewardsParams = || {},
										    				children = {
													    		{
														            type = DialogType.Dialog,
														            id = "stage2",
														            text = || __D(5, "Having failed to force the bars of the cell apart, all that remains is to try to pry the lock open using the crowbar."),
														            who = || "mapCinematicId",
														            children = {
																        {
										                                    type = DialogType.Custom,
										                                    subtype = "item",
										                                    item = || "crowbar",
										                                    text = || __R(6, "Pry\nthe lock\nopen."),
										                                    children = {
																			   	{
																		            type = DialogType.Dialog,
																		            text = || __D(7, "With the crowbar and some elbow grease, the lock didn't stand a chance.\n\n\"Spectacularly done, friend!\nLet me get my gear from that crate and we're set to go!\""),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.useCrowbar,
																		    				rewardsParams = || {},
																				    		exit = true
																						}
																				    }
																		        }
																	        }
																		}
																    }
														        }
													        }
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(8, "Gerald pulled at the bars with no success until his injured hands forced him to give up.\n\nThe prisoner, clicking his tongue and shaking his head, pointed toward a crowbar sticking out of a crate in the corridor."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		jumpTo = "stage2"
														}
												    }
										        }
						    				}
							    		},
							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "item",
		                                    item = || "crowbar",
		                                    text = || __R(9, "Pry\nthe lock\nopen."),
										   	exit = true
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(10, "Use the key."),
		                                    enabled = || cinematicMapHelper.HasItemInInventory("DungeonKey"),
										   	exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {


		mightFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = {params.hero}},
			{type="item", itemId = "crowbar", amount = 1},
			}),
		mightSuccess = cinematicMapHelper.Result(|params| {
			
			{type="item", itemId = "crowbar", amount = 1},
			}),
		useCrowbar = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="item", itemId = "crowbar", amount = -1},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowNotification("NotificationDice1"),
									cinematicMapHelper.Sleep(0.5),
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end),
									cinematicMapHelper.Sequence({
										cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
									{"MinionRanger"}
									)
									})
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 1
end
