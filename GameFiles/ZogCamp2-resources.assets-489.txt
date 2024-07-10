do 
	local quest = helper.QuestDefinition();
	quest.id = 'ZogCamp2'
	quest.visual = "OrcChampion"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_orcZogCamp_2','combat_orcZogCamp_22','combat_orcZogCamp_23'}
	quest.tags = {"COMBAT","HARD","TERRAIN_ZOG","NOREPLACE"}
	quest.canAbandonCombat = || false

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if cinematicMapHelper.DarknessLevel()<=1 then 
											cinematicMapHelper.CurrentQuestStatus().encounters = {'combat_orcZogCamp_2'}
										elseif cinematicMapHelper.DarknessLevel() ==2 then
											cinematicMapHelper.CurrentQuestStatus().encounters = {'combat_orcZogCamp_22'}
										else 
											cinematicMapHelper.CurrentQuestStatus().encounters = {'combat_orcZogCamp_23'}
										end
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
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="giveXP", amount = config.rewards.starXp.high()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "highHealing" , quantity = || config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = config.rewards.darkness.leave()},
			{type="checkInjuries"}
		}),
	}

	helper.AddQuest(quest)
	quest.revealDistance = 3
end
