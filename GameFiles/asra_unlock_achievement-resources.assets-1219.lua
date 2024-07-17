do 
	local quest = helper.QuestDefinition();
	quest.id = 'asra_unlock_achievement'

	quest.AddEvent("runFinished", logicHelper.Handler(0,function (c)

		if cinematicMapHelper.IsNodeBossI() then
			cinematicMapHelper.AchievementIncrementI("asra_unlock",1)
		end
		
	end))
	
	helper.AddQuest(quest)
end
