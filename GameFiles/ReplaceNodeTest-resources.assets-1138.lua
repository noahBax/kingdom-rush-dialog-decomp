do 
	local quest = helper.QuestDefinition();
	quest.id = 'ReplaceNodeTest'
	quest.visual = "WildBerries"
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(0, "ReplacingNode"),
						            
									text = || __D(0, "Replacing Node"),
						    		who = || "mapCinematicId",
						    		icon = || "WildBerries",
						    		exit = true
						         }
						    })

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
									cinematicMapHelper.Wrap(function ()
										local quests = cinematicMapHelper.FilterQuests(function (qs)
												return qs.quest.tags.Contains("COMBAT") and qs.context.GetInt("visualRevealed", 0) == 0
										end)

										local questToReplace = cinematicMapHelper.RandomItem(quests)

										return cinematicMapHelper.Sequence({
											cinematicMapHelper.Sleep(0.4),

											cinematicMapHelper.SetCinematicMode(true),
											cinematicMapHelper.CameraMoveToNode(|| questToReplace.nodeId,|| 0.5),
											cinematicMapHelper.CameraZoomMap(|| "IN", || questToReplace.nodeId, ||0.3),
											
											
											cinematicMapHelper.Instant(function()
												local questDefinition = cinematicMapHelper.QuestDefinition("TavernNew")
												local newQuestStatus = cinematicMapHelper.ReplaceQuest(questToReplace, questDefinition)
												local node = cinematicMapHelper.Node(newQuestStatus.nodeId)
												node.RevealNode()
												cinematicMapHelper.SpawnPrefab("PuffMapFX", node)
											end),
											cinematicMapHelper.Sleep(1),
											cinematicMapHelper.CameraZoomMap(|| "OUT", || questToReplace.nodeId, ||0.75),
											cinematicMapHelper.Sleep(1),
											cinematicMapHelper.CameraMoveToAndZoomNode(|| cinematicMapHelper.CurrentQuestStatus().nodeId, ||"OUT", ||1.1),
											cinematicMapHelper.SetCinematicMode(false)

										})


									end)
								}))
	helper.AddQuest(quest)
end
