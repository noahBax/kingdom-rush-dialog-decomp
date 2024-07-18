do 
	local quest = helper.QuestDefinition();
	quest.id = 'CultAndOrcs'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_cultAndOrcs'}
	quest.tags = {"COMBAT","HARD","TERRAIN_PLAINS","TERRAIN_WOODS"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										
	                                    
			                              
			                            
										cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
										cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
									end)
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			{type="guild.attribute", kind = "loot", amount =  config.rewards.loot.mid()},
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "lowHealing", quantity = || config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = config.rewards.darkness.leave()},
			{type="checkInjuries"}
		}),
	}
	
	helper.AddQuest(quest)
	quest.revealDistance = 1
end
