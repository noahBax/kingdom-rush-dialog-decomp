do 
	local quest = helper.QuestDefinition();
	quest.id = 'WastelandEmergentCombat'
	quest.encounters = {'combat_emergentWasteland1','combat_emergentWasteland2','combat_emergentWasteland3','combat_emergentWasteland4','combat_emergentWasteland5'}
	quest.tags = {"LINKED"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowAmbushAlert(),
									cinematicMapHelper.Instant(function ()
										 cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
										cinematicMapHelper.CurrentQuestStatus().encounters = cinematicMapHelper.RandomItem({{'combat_emergentWasteland1'},{'combat_emergentWasteland2'},{'combat_emergentWasteland3'},{'combat_emergentWasteland4'},{'combat_emergentWasteland5'}})
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
