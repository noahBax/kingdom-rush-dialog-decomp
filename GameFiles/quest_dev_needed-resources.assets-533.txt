--------------------------------------------
--NO TOCAR PLEASE POR TODO LO SAGRADO GRACIA
--------------------------------------------
do -- This is used to run from the editor
	local quest = helper.QuestDefinition();
	quest.id = 'quest_generic_encounter'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}
	

	helper.AddQuest(quest)
end



do -- this is a dummy quest used as the start of the game
	local quest = helper.QuestDefinition();
	quest.id = 'quest_dummy_start'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}
	

	helper.AddQuest(quest)
end
--------------------------------------------
-- END NO TOCAR PLEASE POR TODO LO SAGRADO GRACIA
--------------------------------------------