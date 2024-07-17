

do 
	local quest = helper.QuestDefinition();
	quest.id = 'ItsAKindOfMagic'
	
	quest.encounters = {}
	quest.tags = {"ISOLATED","RECRUIT","NARRATIVE","TUTORIAL"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						        	type = DialogType.Dialog,
						            narrator = || __N(1, "It's a Kind of Magic"),
						            text = || __D(2, "A wizard in a purple tunic approaches us as soon as we lose the guards.\n\n\"Gerald! I knew my faith in the Linirean resistance would pay its dividends.\nLet me join you. Together we can make it out of the castle!\""),
						    		icon = || "Asst_TutMagician",
						    		who = || "mapCinematicId",
						            children = {
										{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Welcome the wizard."),
										   	exit = true
		                                }
									}
								}
							})

	quest.results = {


		recruit = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
	}

	quest.interruptFixed = || helper.PriorityAndSlots(cinematicMapHelper.NodeDistance(cinematicMapHelper.CurrentNode(),cinematicMapHelper.NodeSafe("start")) >= 3 and 10 or 0, 3)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Sequence({
											cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
										{"MinionArcaneMage"}
										)
										}
									)	
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 0

	quest.maxInstancesInGame = 1;
	quest.maxInstancesInAdventure = 1;
end
