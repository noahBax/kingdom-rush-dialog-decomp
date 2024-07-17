


do 
	local quest = helper.QuestDefinition();
	quest.id = 'SilveroakBF'
	
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_silveroakBF'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_SILVEROAK"}
	quest.canAbandonCombat = || false

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Three-Faced Spirit"), 
						            text = || __D(2, "We reach the place where the Argentree lies, now completely corrupted by the influence of Mór-Ga-Nok, the wicked spirit summoned by the Ashervan.\n\nWe must stop them from corrupting these lands!"), 
						    		who = || "mapCinematicId",
						    		icon = || "Asst_SilveroakBossFight",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(3, "Fight!"),
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
