do 
	local quest = helper.QuestDefinition();
	quest.id = 'FireAshesNodeExample'
	quest.visual = "AshesIntermediate"
	
	quest.encounters = {}
	quest.tags = {"FIREPROOF"}

	quest.encounters = {}

	quest.shouldRun = || false
	quest.autoResolve = false;

	quest.canHaveInterrupt = false;
	
	helper.AddQuest(quest)
end
