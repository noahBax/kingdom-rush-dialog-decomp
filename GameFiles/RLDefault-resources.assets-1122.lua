do 
	local quest = helper.QuestDefinition();
	quest.id = 'rlDefault'
	
	quest.encounters = {}

	quest.shouldRun = || false
	quest.autoResolve = false;
	
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'rlDefaultNoInterrupt'
	
	quest.encounters = {}

	quest.shouldRun = || false
	quest.autoResolve = false;
	quest.canHaveInterrupt = false;
	
	helper.AddQuest(quest)
end
