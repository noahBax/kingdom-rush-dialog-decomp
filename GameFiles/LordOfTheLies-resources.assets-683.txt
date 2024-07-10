do 
	local quest = helper.QuestDefinition();
	quest.id = 'LordOfTheLies'
	quest.visual = "DemonLord"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_lordOfTheLies'}
	quest.tags = {"COMBAT","ADVANCED","TERRAIN_WASTELAND"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if(cinematicMapHelper.PartyStars() >= config.starLimit.advanced())
	                                    then
			                                cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
			                            else 
			                            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "0")
			                            end
										cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
									end)
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.advanced()}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))


	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			
			{type="guild.attribute", kind = "loot", amount = params.complex and config.rewards.loot.high() or config.rewards.loot.mid()},
			{type="giveXP", amount = params.complex and config.rewards.starXp.advanced() or config.rewards.starXp.high()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = params.complex and "highHealing" or "midHealing", quantity = ||  config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			
		}),
	}
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
