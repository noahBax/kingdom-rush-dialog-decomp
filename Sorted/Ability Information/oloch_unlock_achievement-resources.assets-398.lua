do 
	local quest = helper.QuestDefinition();
	quest.id = 'oloch_unlock_achievement'

	quest.AddEvent("runFinished", logicHelper.Handler(0,function (c)

		if cinematicMapHelper.IsNodeBossI() then
			cinematicMapHelper.AchievementIncrementI("oloch_unlock",1)
		end
		
	end))
	
	helper.AddQuest(quest)
end
