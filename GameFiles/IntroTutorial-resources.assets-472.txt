do 
	local quest = helper.QuestDefinition();
	quest.id = 'IntroTutorial'
	quest.visual = "Ogre"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_tutDungeonIntro'}
	quest.tags = {"COMBAT","EASY","TUTORIAL"}
	quest.canAbandonCombat = || false

	quest.skipEnterCombatCinematic = true

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowComic("ComicTutorialIntro"),
									cinematicMapHelper.SetCurtain(false),
									
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
			{type="item", itemId = "food", amount = 2},
			{type="giveXP", amount = config.rewards.starXp.low()},
		}),
	}

	helper.AddQuest(quest)
end
