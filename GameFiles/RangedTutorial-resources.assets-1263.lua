do 
	local quest = helper.QuestDefinition();
	quest.id = 'RangedTutorial'
	quest.visual = "ShadowArcherTutorial"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_tutRanged'}
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
			
			
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = config.rewards.starXp.low()},
		}),
	}

	helper.AddQuest(quest)
end
