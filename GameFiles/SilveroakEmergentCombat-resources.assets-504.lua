do 
	local quest = helper.QuestDefinition();
	quest.id = 'SilveroakEmergentCombat'
	quest.encounters = {'combat_emergentSilveroak1','combat_emergentSilveroak2','combat_emergentSilveroak3','combat_emergentSilveroak4','combat_emergentSilveroak5'}
	quest.tags = {"LINKED"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowAmbushAlert(),
									cinematicMapHelper.Instant(function ()
										 cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
										cinematicMapHelper.CurrentQuestStatus().encounters = cinematicMapHelper.RandomItem({{'combat_emergentSilveroak1'},{'combat_emergentSilveroak2'},{'combat_emergentSilveroak3'},{'combat_emergentSilveroak4'},{'combat_emergentSilveroak5'}})
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
