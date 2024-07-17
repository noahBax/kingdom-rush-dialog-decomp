


do 
	local quest = helper.QuestDefinition();
	quest.id = 'testMBF'
	
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_stormcloudMBF'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_MOUNTAIN"}
	quest.canAbandonCombat = || false

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Stormcloud Temple Ruins"),
						            text = || __D(2, "A potent light shines in the distance, dying the sky with a somber scarlet shade.\n\nAs we reach the ruins of the temple, we notice a large eerie-looking tower where the Sunray Tower once stood, with a malformed troll blocking the bridge."), 
						    		who = || "mapCinematicId",
						    		icon = || "Asst_MountainBoss",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(3, "Approach the ruins."),
								            exit = true,
								            onChoose = function ()
								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", "1")
								            	
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
											end	
		                                },
		                                {
						    				type = DialogType.Response,
								            text = || __R(4, "Not yet."),
								            exit = true
		                                }
		                            }
						        }
						    })


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))


	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="checkInjuries"},
			
		}),
		
		
		
		
	}
	helper.AddQuest(quest)
	quest.revealDistance = 2
	quest.shouldRun = || true
	quest.canReenter = || true

	
	quest.consumesDay = || false
end
