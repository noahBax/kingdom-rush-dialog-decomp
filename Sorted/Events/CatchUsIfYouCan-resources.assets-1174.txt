

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CatchUsIfYouCan'
	quest.visual = "Crates"
	quest.kindFlag = "Challenge"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Catch Us If You Can"),
						            text = || __D(2, "We happen upon a large group of guards ahead of us, and we try to lose them between some nearby huts.\n\nWe notice a few wooden crates piled on top of each other that could be used as a blockade to give us time to escape, if detected."),
						    		icon = || "Asst_TutGuardsEscape",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Sneak\nbetween\nthe huts!"),
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
										            text = || __D(4, "Tiptoeing our way between the huts, we were able to sneak past the guards."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthSuccess,
										    				rewardsParams = || {},
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
										            text = || __D(5, "We attempted to sneak past the guards, but as we were making our way between the huts, one of the guards spotted us and started shooting in our direction.\n\nThe arrows didn't get through our armor, but definitely made a dent in it."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.stealthFailure,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Knock\nthe crates\nover."),
						    				challenge = {
						    					requirements =  |t| t("ct_might")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            text = || __D(7, "We pushed the pile of wooden crates until they fell over, creating an improvised blockade, and we started running.\n\nBy the time the guards realized what was going on, we were already out of reach of their arrows."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightSuccess,
										    				rewardsParams = || {},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            text = || __D(8, "We started knocking the crates over, but it took more time than we expected.\nBy the time the blockade was set, the guards were almost upon us and shooting in our direction.\n\nThe arrows didn't get through our armor, but definitely made a dent in it."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.mightFailure,
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
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = -1, targets = {cinematicMapHelper.HeroByTag("ct_legend")}},
			}),
		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
		stealthSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
		stealthFailure = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = -1, targets = {cinematicMapHelper.HeroByTag("ct_legend")}},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	quest.canHaveInterrupt = false;

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.obeliskDarknessCheck, function (c)
		local qs = c.GetObject("QS")
		if cinematicMapHelper.CurrentQuestStatus().questName == qs.questName then 
			cinematicMapHelper.ShowMapTutorial("PointerMode")
		end
	end))

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
