do 
	local quest = helper.QuestDefinition();
	quest.id = 'rlStart'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}
	helper.AddQuest(quest)
end


do 
	local quest = helper.QuestDefinition();
	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || "Southport is still under development. Talk to our customer support guard for any inquiries about quests. ",
						            text = || "Hello!\nAlleria left a message for you.\nShe is waiting at the North Camp.",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || "erm...",
		                                    children = {
										 		{
										            type = DialogType.Dialog,
										            text = || "Good!\nAlso, here are a bunch o quests!\nThey will show up on the map!",
										            narrator = || "The man makes a magic gesture and you feel a tingling sensation!",
										            who = || "mapCinematicId",
										            exit = true
										        }
		                                    }
		                                },
										{
		                                    type = DialogType.Response,
		                                    text = || "mmm sure!",
		                                    children = {
										 		{
										            type = DialogType.Dialog,
										            text = || "Good!\nAlso, here are a bunch of quests!\nThey will show up on the map!",
										            narrator = || "The man makes a magic gesture and you have a feeling of dejavu... something has changed!",
										            who = || "mapCinematicId",
										            exit = true
										        }
		                                    }
		                                },
		                                
						        	}
						        }
						    })

	quest.id = 'rlMerchant'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}
	quest.shouldRun = || true

	quest.visual = "Tavern"

	-- quest.results = {
	-- "success" = helper.result({
	-- 		|| resultH.giveFood(10),
	-- 		|| resultH.party(|| resultH.healPercent(10))
	-- 	})
    --}
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
											
								}))
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'rlKing'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "food", amount = 2 },
			{type="addUnit", archetype = "HumanArcher", name = "Arquerin"},
		}),
		successPost = cinematicMapHelper.Result(|params| {
			{type="applyModifier", archetype = "Winners", duration = 2, targets = cinematicMapHelper.Party()},
		})
	}
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowComment(|| "It's dangerous\n to go alone\n take this!!", || Color.yellow , || Color.black, || 2),		
									cinematicMapHelper.InstantiateAndExecuteResult(|| quest.results.success, || {}),
									cinematicMapHelper.InstantiateAndExecuteResult(|| quest.results.successPost, || {})
								}))
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'rlTroll'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowComment(|| quest.id, || Color.yellow , || Color.black, || 2),		
								}))
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'rlWarg'
	--quest.type = MapQuestType.BossFight
	quest.encounters = {}
	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowComment(|| quest.id, || Color.yellow , || Color.black, || 2),			
								}))
	helper.AddQuest(quest)
end
