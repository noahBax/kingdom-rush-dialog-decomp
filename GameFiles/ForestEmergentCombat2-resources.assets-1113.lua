do 
	local quest = helper.QuestDefinition();
	quest.id = 'ForestEmergentCombat2'
	quest.encounters = {'combat_emergentForest6','combat_emergentForest7','combat_emergentForest8', 'combat_emergentForest9', 'combat_emergentForest10'}
	quest.tags = {"LINKED"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowAmbushAlert(),
									cinematicMapHelper.Instant(function ()
										 cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
										cinematicMapHelper.CurrentQuestStatus().encounters = cinematicMapHelper.RandomItem({{'combat_emergentForest6'},{'combat_emergentForest7'},{'combat_emergentForest8'},{'combat_emergentForest9'},{'combat_emergentForest10'}})
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
			
			{type="giveXP", amount = config.rewards.starXp.low()},
			{type="checkInjuries"}
			}),
	}
	quest.interruptByChance = || helper.PriorityAndSlots((cinematicMapHelper.PartySize()==4) and 3 or 0, 10)
	quest.maxInstancesInGame = 1000;
	quest.maxInstancesInAdventure = 1000;

	helper.AddQuest(quest)
	quest.autoRevealWhenClose = |qs| false
end
