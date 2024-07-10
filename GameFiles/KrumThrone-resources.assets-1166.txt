

do 
	local quest = helper.QuestDefinition();
	quest.id = 'KrumThrone'
	quest.startRevealed = true
	quest.tags = {"COMBAT","FIXED","HARD","TERRAIN_ZOG","NOREPLACE","FIREPROOF"}
	quest.encounters = {'combat_krumColiseum'}
	quest.canAbandonCombat = || false
	quest.kindFlag = "Combat"

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Krum'thak's Throne"),
						            text = || __D(2, "Deep inside Krum's lands, we reach his dreaded throne!##We rush forward, entering his bloodied arena at last.##The time for battle dawns upon us!"),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_KrumThakBoss",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(3, "To battle!"),
								            exit = true,
								            onChoose = function ()
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
											end	
		                                },
		                                {
						    				type = DialogType.Response,
								            text = || __R(4, "Not yet."),
								            exit = true
		                                }
		                            }
						        }
						    })
	
	
	
	
	
	
	
	
	
	
	
	
    
	
	
	
	
	
	
	
	

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
								}))

	
	
	

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({

							
							
							cinematicMapHelper.GoToNextAdventure()
						}))

	
	
	

	quest.results = {
		HiddenSuccess = cinematicMapHelper.Result(|params| {
			
			{type="doHeal", amount = 100, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level = 1,  duration = 3, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="luckMod", level = 1, duration = 3, targets =  cinematicMapHelper.Party()},
			}),
		success = cinematicMapHelper.Result(|params| {
			
			{type="giveStar", amount = 1},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "highHealing" , quantity = || 1, slot = 1},
			})}
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = config.rewards.darkness.leave()},
			{type="checkInjuries"}				
		}),
	}	
	helper.AddQuest(quest)

	quest.shouldRun = || true
	quest.canReenter = || true

	
	quest.consumesDay = || false
end
