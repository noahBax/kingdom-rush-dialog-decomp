do 
	local quest = helper.QuestDefinition();
	quest.id = 'FollowedByOrcs'
	quest.encounters = {'combat_orcFollowedAmbush'}
	quest.tags = {"LINKED"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentQuestStatus().encounters = {'combat_orcFollowedAmbush'};
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
	
	quest.interruptFixed = || helper.PriorityAndSlots((cinematicMapHelper.Guild().context.GetInt("linked.attackedOrcFarm") == 1) and 3 or 0, 5)
	helper.AddQuest(quest)
	quest.autoRevealWhenClose = |qs| false
end
