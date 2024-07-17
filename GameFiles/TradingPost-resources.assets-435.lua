do 
	local quest = helper.QuestDefinition();
	quest.id = 'TradingPost'
	quest.visual = "Orc"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_tradingPost'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_WOODS","TERRAIN_PLAINS"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if(cinematicMapHelper.PartyStars() >= config.starLimit.hard())
	                                    then
			                                cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
			                            else 
			                            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "0")
			                            end
										cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters;
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
				{type = "itemList", id = params.complex and "highHealing" or "midHealing", quantity = || config.rewards.itemChance.mid() and 1 or 0, slot = 1},
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
