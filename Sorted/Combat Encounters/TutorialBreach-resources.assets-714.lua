do 
	local quest = helper.QuestDefinition();
	quest.id = 'TutorialBreach'
	quest.visual = "BanditRaider"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_tutBreach'}
	quest.tags = {"COMBAT","EASY","TUTORIAL"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters;
									end)	
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {}),
							}))

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low()},
			{type="giveXP", amount = config.rewards.starXp.low()},
		}),
	}
	helper.AddQuest(quest)
end
