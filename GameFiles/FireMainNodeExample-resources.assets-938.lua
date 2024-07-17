do 
	local quest = helper.QuestDefinition();
	quest.id = 'FireMainNodeExample'
	quest.visual = "Fire"
	
	quest.encounters = {}
	quest.tags = {"ONFIRE", "FIREPROOF"}

	quest.encounters = {}

	quest.shouldRun = || false
	quest.autoResolve = false;

	quest.canHaveInterrupt = false;
	
	helper.AddQuest(quest)
end
