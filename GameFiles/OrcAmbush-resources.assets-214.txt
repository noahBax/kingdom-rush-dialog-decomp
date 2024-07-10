do 
	local quest = helper.QuestDefinition();
	quest.id = 'OrcAmbush'
	quest.visual = "Orc"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_orcAmbush_1','combat_orcAmbush_2','combat_orcAmbush_3','combat_orcAmbush_4'}
	quest.tags = {"COMBAT","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}
	quest.canAbandonCombat = || false


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if(cinematicMapHelper.PartyStars() >= config.starLimit.normal())
	                                    then
			                                cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
			                            else 
			                            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "0")
			                            end
										cinematicMapHelper.CurrentQuestStatus().encounters = cinematicMapHelper.RandomItem({{'combat_orcAmbush_1'},{'combat_orcAmbush_2'},{'combat_orcAmbush_3'},{'combat_orcAmbush_4'}});
									end)
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.success, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.normal()}),
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			{type="guild.attribute", kind = "loot", amount = params.complex and config.rewards.loot.mid() or config.rewards.loot.low()},
			{type="giveXP", amount = params.complex and config.rewards.starXp.mid() or config.rewards.starXp.low()},
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
	
end
