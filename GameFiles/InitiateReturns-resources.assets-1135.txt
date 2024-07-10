

do 
	local quest = helper.QuestDefinition();
	quest.id = 'InitiateReturns'
	quest.encounters = {'combat_initiate'}
	quest.tags = {"Linked"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.savedInitiate") == 1,
						            narrator = || __N(1, "The Initiate Returns"),
						            text = || __D(2, "We come across the initiate we had previously helped escape the cult.\n\n\"Oh, if it isn't my saviors! I've been meaning to find you and give you this.\""),
						    		icon = || "Asst_Scholar",
						    		who = || "mapCinematicId",
						    		children = {
							            {
						    				type = DialogType.Custom,
						    				subtype = "rewards",
						    				rewards = || quest.results.saved,
						    				rewardsParams = || {},
						    				onChoose = function(d,n)
								            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
								            end,

								    		exit = true
										}
									}
						        },
						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.Guild().context.GetInt("linked.savedInitiate") == 0,
						            narrator = || __N(3, "The Initiate Returns"),
						            text = || __D(4, "Going through a tunnel, we come across the initiate we had previously sold out to the cult.\n\n\"My oh my, the ever-enlightened eye has given me a chance to carry out my vengeance.\nPraised be the eye!\""),
						    		icon = || "Asst_Cultist",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						    				type = DialogType.Response,
								            text = || __R(5, "Fight!"),
								            onChoose = function ()
								            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
											end,
								            exit = true
		                                }
						        	}
						        }
						    })

	local resolveDialog =  dialogs.CreateDialog("resolve",  
					    {

					        {
					            type = DialogType.Dialog,
					            narrator = || __N(6, "The Initiate Returns"),
					            text = || __D(7, "We survived the initiate's revenge!"),
					    		who = || "mapCinematicId",
					    		icon = || "Asst_Cultist",
					        	children = {
							        {
					    				type = DialogType.Custom,
					    				subtype = "rewards",
					    				rewards = || quest.results.success,
					    				rewardsParams = || {},
							    		exit = true
									}
							    }
					        }
					    })


	quest.results = {

		saved = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "armorersKit", amount = 1},
			{type="item", itemId = "bandage", amount = 1 },
			}),
		success = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"}
			}),
	}

	
	quest.interruptByChance = || helper.PriorityAndSlots( ((cinematicMapHelper.Guild().context.GetInt("linked.savedInitiate") == 1) and cinematicMapHelper.RandomChance(0.30)) and 3 or 0, 3)
		
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowDialogInstance(resolveDialog),	
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowDialogInstance(leaveCombatDialog),	
							}))
	helper.AddQuest(quest)
end
