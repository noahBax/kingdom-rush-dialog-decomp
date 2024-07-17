do 
	local quest = helper.QuestDefinition();
	quest.id = 'MapMetagame'
	quest.visual = "StreamPass"
	
	quest.encounters = {'combat_camp'}


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentQuestStatus().encounters = {'combat_camp'}
									end)
								}))
	helper.AddQuest(quest)
end
