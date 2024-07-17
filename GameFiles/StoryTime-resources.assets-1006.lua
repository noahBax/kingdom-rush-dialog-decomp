

do 
	local quest = helper.QuestDefinition();
	quest.id = 'StoryTime'
	
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Story Time"),
						            text = || __D(2, "We stop and light a fire to rest for a while.\n\nA few minutes later, someone asks if anyone knows a good story."),
						    		icon = || "Asst_Campgrounds",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Tell a story."),
						    				challenge = {
						    					requirements =  |t| t("ct_social")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We spent the rest of the day exchanging stories.\n\nWe went to bed amused and having learned more about each other."),
										            who = || "mapCinematicId",
										            children = {
										            	{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.success,
										    				rewardsParams = |d| {hero = d.data.hero},
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
													onChoose = function(d,n)
										            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
										            end,
										            text = || __D(5, "We spent a while exchanging boring stories until we finally decided to call it a day and went to bed."),
										            who = || "mapCinematicId",
										            exit = true
										        }
						    				}
							    		}
						        	}
						        }
						    })

	quest.results = {

		success = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="giveXP", amount = config.rewards.starXp.eMid()},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)

	
	quest.interruptByChance = || helper.PriorityAndSlots( (cinematicMapHelper.HeroByTag("ct_social") != nil) and 3 or 0, 3)
	quest.maxInstancesInGame = 1;
	quest.maxInstancesInAdventure = 1;
end
