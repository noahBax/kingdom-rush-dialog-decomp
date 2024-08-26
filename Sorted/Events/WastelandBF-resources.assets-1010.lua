

do 
	local quest = helper.QuestDefinition();
	quest.id = 'WastelandBF'
	
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_wastelandBFv2'}
	quest.tags = {"COMBAT","NORMAL",}
	quest.canAbandonCombat = || false

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Final Staredown"),
						            text = || __D(2, "The time to face our fate has finally arrived.\n\nWe stand before the notorious Overseer's portal, ready to put an end to its invasion once and for all!"), 
						    		who = || "mapCinematicId",
						    		icon = || "Asst_WastelandBossFight",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(3, "Approach the portal."),
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
