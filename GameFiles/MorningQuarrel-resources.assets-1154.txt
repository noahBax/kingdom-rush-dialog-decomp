

do 
	local quest = helper.QuestDefinition();
	quest.id = 'MorningQuarrel'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Roadside Quarrel"),
						            text = || __D(2, "We journey toward our destination with differences on what path to take and generally arguing about the decisions we've been making as a party.\nSaving the world can be stressful after all."),
						    		icon = || "Asst_MorningQuarrel",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Try to\ncalm down\nthe party."),
						    				challenge = {
						    					requirements =  |t| t("ct_social") or t("ct_legend")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "We successfully settled our differences as we kept marching."),
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
										            text = || __D(5, "We tried to settle our differences as we marched, but our discussion turned into a brawl.\n\nWith bruised bodies and egos, we eventually calmed down and moved on."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.failure,
										    				rewardsParams = |d| {hero = d.data.hero},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
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

		success = cinematicMapHelper.Result(|params| {
		{type="giveXP", amount = config.rewards.starXp.eLow()},
		}),
		failure = cinematicMapHelper.Result(|params| {
		{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	quest.autoRevealWhenClose = |qs| false

	
	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)
end
