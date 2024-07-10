do 
	local quest = helper.QuestDefinition();
	quest.id = 'fire_controller'

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.fireEffects, function (c)

		local node = c.GetObject("NODE")
		
		if(node.isIntermediate) then
			return
		end

		local currentStep = cinematicMapHelper.Guild().context.GetInt("stepCount")

		if(currentStep == 0) then
			return
		end

		local activeFires = cinematicMapHelper.FilterQuests(function (qs)
				return qs.quest.tags.Contains("ONFIRE")
		end)



		
		for i=0,activeFires.Count - 1 do
			local activeFire = activeFires[i]
			local fireConfig = activeFire.quest.config.fire
			local fireNode = cinematicMapHelper.Node(activeFire.nodeId)

			local endNodeFire = activeFire.context.GetInt("endFireStep", -1)
			if endNodeFire == -1 then
				endNodeFire = currentStep + fireConfig.die.turnsToAshes()
				activeFire.context.SetInt("endFireStep", endNodeFire)
			end

			if (currentStep == endNodeFire) then
				
				local ashesCandidates = fireNode.isIntermediate and fireConfig.die.ashesIntermediate or fireConfig.die.ashesMain
				local questDefinition = cinematicMapHelper.QuestDefinition(cinematicMapHelper.RandomItem(ashesCandidates))
				
				
				local newQuestStatus = cinematicMapHelper.ReplaceQuest(activeFire, questDefinition)
				fireNode.RevealNode()
				cinematicMapHelper.SpawnPrefab("PuffMapFX", fireNode)
			else
				local spreadChance = fireNode.isIntermediate and fireConfig.spread.spreadChanceIntermediate or fireConfig.spread.spreadChanceMain


				if(cinematicMapHelper.RandomChance(spreadChance)) then
					
					local neighbourCandidates = cinematicMapHelper.FilterNodes(fireNode.neighbourdata.neighbourNodes,function (neighbour)
						return (not neighbour.runtime.questDefinition.tags.Contains("FIREPROOF")) and (neighbour != node)
					end)

					if neighbourCandidates.Count > 0 then
						local newFireNode = cinematicMapHelper.RandomItem(neighbourCandidates)
						
						local fireCandidates = newFireNode.isIntermediate and fireConfig.spread.firesIntermediate or fireConfig.spread.firesMain
						local questDefinition = cinematicMapHelper.QuestDefinition(cinematicMapHelper.RandomItem(fireCandidates))
						
						
						local newQuestStatus = cinematicMapHelper.ReplaceQuest(newFireNode.runtime.questStatus, questDefinition)
						newFireNode.RevealNode()
						cinematicMapHelper.SpawnPrefab("PuffMapFX", newFireNode)
					end
				end
			end
		end
	end))

	helper.AddQuest(quest)
end
