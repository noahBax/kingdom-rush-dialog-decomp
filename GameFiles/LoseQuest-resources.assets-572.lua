do 
	local quest = helper.QuestDefinition();
	quest.id = 'devLoseQuest'
	
	quest.encounters = {}


	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(0, "DEFEAT"),
						            
						            text = || __D(0, "Greenskins have bested us.\nIt's a sad day for Linirea, but...\nThe sun will rise again!\n\nGreat heroes shall rise again,\nunited by a legendary banner.\nDefeat beats not those who..."),
						    		icon = || "Asst_Defeat",
						    		who = || "mapCinematicId",
						            children = {
						           		{
		                                    type = DialogType.Response,
		                                    text = || __R(0, "Try Again!"),
		                                    exit = true
		                                }
						        	}
						        }
						    })



	quest.AddCinematic("onLoseCombat", cinematicMapHelper.Cinematic({
							
							cinematicMapHelper.HideHeroBarAndInventory(),
							cinematicMapHelper.ShowDialogInstance(theDialog),
							cinematicMapHelper.TriggerDefeatHandler()
						}))

	helper.AddQuest(quest)
end
