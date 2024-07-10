

do 
	local quest = helper.QuestDefinition();
	quest.id = 'CultRitual'
	quest.visual = "CultistPriest"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_cultRitual'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_PLAINS"}
	quest.canAbandonCombat = || false

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Cult's Ritual"),
						            text = || __D(2, "We find a cave filled with cultists about to perform a ritual."),
						    		who = || "mapCinematicId",
						    		icon = || "Cave",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(3, "Fight"),
								            exit = true,
											onChoose = function ()
												cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
											end	
		                                }
		                            }
						        }
						    })


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if(cinematicMapHelper.PartyStars() >= config.starLimit.hard())
	                                    then
			                                cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
			                            end
										cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
										cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
									end)
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.hard()}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			{type="guild.attribute", kind = "loot", amount = params.complex and config.rewards.loot.high() or config.rewards.loot.mid()},
			{type="giveXP", amount = params.complex and config.rewards.starXp.high() or config.rewards.starXp.mid()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = params.complex and "midHealing" or "lowHealing", quantity = || config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="darkness", amount = config.rewards.darkness.leave()},
			{type="checkInjuries"}
		}),
	}
	
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
