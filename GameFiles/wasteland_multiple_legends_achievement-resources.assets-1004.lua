do 
	local quest = helper.QuestDefinition();
	quest.id = 'wasteland_multiple_legends_achievement'

	quest.AddEvent("runWon", logicHelper.Handler(0,function (c)
		local legend = cinematicMapHelper.GetLegend()
		local legendId = string.lower(legend.UniqueId)
		cinematicMapHelper.AchievementIncrementI("wasteland_completed_with_" .. legendId, 1)
	end))
	
	helper.AddQuest(quest)
end
