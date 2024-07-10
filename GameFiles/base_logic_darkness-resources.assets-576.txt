do 
	local quest = helper.QuestDefinition();
	quest.id = 'darkness_cost'

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.increaseDarkness,function (c)
		local node = c.GetObject("NODE")
		
		if(node.isIntermediate) then
			return
		end

		if(cinematicMapHelper.Guild().context.GetInt("stepCount") == 0) then
			return
		end

		cinematicMapHelper.QueueCinematic(cinematicMapHelper.Cinematic({
			 cinematicMapHelper.Sequence({
				cinematicMapHelper.Instant(|| cinematicMapHelper.DarknessBar().PunchEye()),
				cinematicMapHelper.Sleep(0.1),
				cinematicMapHelper.Instant(|| cinematicMapHelper.ChangeDarkness(config.rewards.darkness.daily())),
				cinematicMapHelper.Sleep(0.3)
			})
			})
		)

		
		
	end))
	
	helper.AddQuest(quest)
end


do 
	local quest = helper.QuestDefinition();
	quest.id = 'darkness_effects'

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.darknessEffects,function (c)
		
		
		local darkness = cinematicMapHelper.DarknessLevel()
		local prevDarkness = cinematicMapHelper.Guild().context.GetInt("prevDarkness")

		if darkness <= prevDarkness then
			return
		end

		local quests = cinematicMapHelper.FilterQuests(function (qs)
				local nodeId = qs.nodeId
				local node = cinematicMapHelper.Node(nodeId)
				return node != nil and (not node.isIntermediate) and qs.quest.tags.Contains("COMBAT") and (not qs.quest.tags.Contains("NOREPLACE")) and (qs.context.GetInt("visualRevealed", 0) == 0)
		end)

		if quests.Count > 0 then
			local questToReplace = cinematicMapHelper.RandomItem(quests)
			cinematicMapHelper.QueueCinematic(cinematicMapHelper.Cinematic({
			 cinematicMapHelper.Sequence({
				cinematicMapHelper.Sleep(0.4),

				cinematicMapHelper.SetCinematicMode(true),
				cinematicMapHelper.CameraMoveToNode(|| questToReplace.nodeId,|| 0.5),
				cinematicMapHelper.CameraZoomMap(|| "IN", || questToReplace.nodeId, ||0.3),
				
				cinematicMapHelper.ShakeCameraInstant(3),
				cinematicMapHelper.Instant(function()
					local questDefinition = cinematicMapHelper.QuestDefinition(cinematicMapHelper.RandomItem({"ObeliskMass","ObeliskInauguration","ObeliskRitual","ObeliskPlotting","ObeliskWorship","ObeliskOrcs","ObeliskSacrifice"}))
					local newQuestStatus = cinematicMapHelper.ReplaceQuest(questToReplace, questDefinition)
					local node = cinematicMapHelper.Node(newQuestStatus.nodeId)
					node.RevealNode()
					node.SetVisualState("state01")
					cinematicMapHelper.SpawnPrefab("PuffMapFX", node)
				end),
				cinematicMapHelper.Sleep(2.5),
				cinematicMapHelper.CameraZoomMap(|| "OUT", || questToReplace.nodeId, ||0.75),
				cinematicMapHelper.Sleep(1),
				cinematicMapHelper.CameraMoveToAndZoomNode(|| cinematicMapHelper.CurrentNode().nodeId, ||"", ||1.1),
				cinematicMapHelper.SetCinematicMode(false)
				})
			}))
		end

	end))
	
	helper.AddQuest(quest)
end
