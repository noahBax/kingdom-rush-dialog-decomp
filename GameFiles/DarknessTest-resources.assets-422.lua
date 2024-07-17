do 
	local quest = helper.QuestDefinition();
	quest.id = 'DarknessTest'
	quest.visual = "WildBerries"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(0, "Darkness Test"),
						            
									text = || __D(0, "The winds of Darkness are changing"),
						    		who = || "mapCinematicId",
						    		icon = || "WildBerries",
						            children={
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(0, "Smell the wind!"),
						    				challenge = {
						    					requirements =  |t| true
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            text = || __D(0, "The air smells fresh"),
										            who = || "mapCinematicId",
										            children = {
												            {
												            type = DialogType.Dialog,
												            onEnter = |d| d.SetData("results",cinematicMapHelper.InstantiateResults(quest.results.success,{})),
												            who = || "mapCinematicId",
												            onAfter = |d| cinematicMapHelper.ExecuteResult(d.data.results),
												            exit = true
												        }
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            text = || __D(0, "The air smells dank"),
										            who = || "mapCinematicId",
										            children = {
												            {
												            type = DialogType.Dialog,
												            onEnter = |d| d.SetData("results",cinematicMapHelper.InstantiateResults(quest.results.failure,{hero = d.challenge.heroesFailure[0]})),
												            who = || "mapCinematicId",
												            onAfter = |d| cinematicMapHelper.ExecuteResult(d.data.results),
												            exit = true
												        }
												    }
										        }
						    				}
							    		},

										
                                    	{
		                                    type = DialogType.Response,
		                                    text = || __R(0, "Leave."),
 											exit = true
		                                }
				            		
				            		}	

						         }
						    })

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = -15},
			}),
		failure = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = 15},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
end
