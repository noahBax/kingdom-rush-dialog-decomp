do 
	local quest = helper.QuestDefinition();
	quest.id = 'test_global_quest'
	

	quest.AddEvent("leavingNormalNode", logicHelper.Handler(0, function (c)
		local qs = c.GetObject("QS")
		local steps = qs.context.GetInt("steps")
		qs.context.SetInt("steps", steps + 1)
	end))
	
	helper.AddQuest(quest)
end
