do 
	local quest = helper.QuestDefinition();
	quest.id = 'FungiCave'
	quest.visual = "Spiders"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_spiderCave'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_PLAINS", "TERRAIN_WOODS"}
	quest.canAbandonCombat = || false

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if(cinematicMapHelper.PartyStars() >= config.starLimit.hard())
	                                    then
			                                cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
			                            else 
			                            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "0")
			                            end
										cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "NoQuest")
										cinematicMapHelper.CurrentQuestStatus().context.SetObject("solved", 1)
										cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_spiderCave'}
									end)
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "Quest", 
																			cinematicMapHelper.Sequence({
																				cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.boneslayers, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.hard()}),
																				}
																			)),
								cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "NoQuest", 
																			cinematicMapHelper.Sequence({
																				cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.normal, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.hard()}),
																				}
																			)),
								
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_LEAVE", || quest.results.leaveCombat, || {}),
							}))

	quest.results = {
		normal = cinematicMapHelper.Result(|params| {
			
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

	quest.shouldRun = || ((cinematicMapHelper.CurrentQuestStatus().context.GetObject("solved") == nil) or (cinematicMapHelper.Guild().context.GetInt("linked.boneslayers") == 1))

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
