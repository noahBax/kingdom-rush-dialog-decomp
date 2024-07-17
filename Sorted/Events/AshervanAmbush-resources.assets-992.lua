do 
	local quest = helper.QuestDefinition();
	quest.id = 'AshervanAmbush'
	quest.encounters = {'combat_ashervanCentinels'}
	quest.tags = {"LINKED"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowAmbushAlert(),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentQuestStatus().encounters = {'combat_ashervanCentinels'};
										cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
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
			
			{type="giveXP", amount = config.rewards.starXp.mid()},
			{type="checkInjuries"}
			}),
	}
	
	quest.interruptFixed = || helper.PriorityAndSlots((cinematicMapHelper.Guild().context.GetInt("linked.followedByAshervan") == 1) and 3 or 0, 5)
	helper.AddQuest(quest)
	quest.autoRevealWhenClose = |qs| false
end
