do 
	local quest = helper.QuestDefinition();
	quest.id = 'TeleporterTest'
	quest.visual = "ForestTree"
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(0, "TeleportTest"),
						            text = || __D(0, "We will teleport you"),
						    		icon = || "Asst_DeerHerd",
						    		who = || "mapCinematicId",
						    		exit = true
						            
						        }
						    })

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),		
								}))

	quest.AddCinematic("onCustomTravel", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Wrap(function ()
										local quests = cinematicMapHelper.FilterQuests(function (qs)
											local node = cinematicMapHelper.Node(qs.nodeId)
											return node != nil and node.isIntermediate and qs.questName == "rlDefault"
										end)

										local destinationNodeId = cinematicMapHelper.RandomItem(quests).nodeId
										local destinationNode = cinematicMapHelper.Node(destinationNodeId)
										local currentNode = cinematicMapHelper.CurrentNode()
										local hidingNode = cinematicMapHelper.Node("OutOfScreen")

										return cinematicMapHelper.Sequence({
											cinematicMapHelper.Sleep(1),

											cinematicMapHelper.SetCinematicMode(true),
											
											cinematicMapHelper.CameraZoomMap(|| "IN", || currentNode.nodeId, ||0.3),
											cinematicMapHelper.Instant(function ()
												cinematicMapHelper.ForcePartyToNode(hidingNode)
												cinematicMapHelper.SpawnPrefab("PuffMapFX", currentNode)
											end),
											cinematicMapHelper.ShakeCameraInstant(0.4),
											cinematicMapHelper.Sleep(1),
											cinematicMapHelper.CameraMoveToNode(|| destinationNodeId,|| 0.7),
											cinematicMapHelper.ShakeCameraInstant(1),
											cinematicMapHelper.Instant(function()
												cinematicMapHelper.SpawnPrefab("PuffMapFX", destinationNode)
												cinematicMapHelper.ForcePartyToNode(destinationNode)
											end),
											cinematicMapHelper.Sleep(1),
											cinematicMapHelper.CameraZoomMap(|| "OUT", || destinationNodeId, ||0.3),
											cinematicMapHelper.Instant(function ()
												cinematicMapHelper.CustomTravelNewNode(destinationNode)
											end),
											cinematicMapHelper.Sleep(0.5),
											cinematicMapHelper.SetCinematicMode(false)
										})


									end)
								}))

	quest.consumesDay = || false

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
