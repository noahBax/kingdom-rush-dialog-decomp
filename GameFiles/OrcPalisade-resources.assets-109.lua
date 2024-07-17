do 
	local quest = helper.QuestDefinition();
	quest.id = 'OrcPalisade'
	quest.visual = "Orc"
	quest.kindFlag = "Combat"
	quest.encounters = {'combat_orcPalisade','combat_rescueGeneral'}
	quest.tags = {"COMBAT","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}
	quest.canAbandonCombat = || false

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
		cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.Guild().context.GetInt("linked.rescueGeneral") == 0, 
			cinematicMapHelper.Instant(function ()
				if(cinematicMapHelper.PartyStars() >= config.starLimit.hard())
                then
                    cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
                else 
                	cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "0")
                end
				cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
				cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "NoQuest")
				cinematicMapHelper.CurrentQuestStatus().context.SetObject("solved", 1)
				cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_orcPalisade'}
			end)
			),
		cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.Guild().context.GetInt("linked.rescueGeneral") == 1, 
			cinematicMapHelper.Instant(function ()
				if(cinematicMapHelper.PartyStars() >= config.starLimit.hard())
                then
                    cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "1")
                else 
                	cinematicMapHelper.CurrentQuestStatus().context.SetObject("diffVariant", "0")
                end
				cinematicMapHelper.CurrentQuestStatus().context.SetObject("variant", cinematicMapHelper.RandomItem({"1","2","3","4"}))
				cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "Quest")
				cinematicMapHelper.Guild().context.SetInt("linked.rescueGeneral", 0)
				cinematicMapHelper.CurrentQuestStatus().context.SetObject("solved", 1)
				cinematicMapHelper.CurrentQuestStatus().encounters =  {'combat_rescueGeneral'}
			end)
			)
	}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
		cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "NoQuest", 
			cinematicMapHelper.Sequence({
				cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.normal, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.hard()}),
				}
			)),
		cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "Quest", 
			cinematicMapHelper.Sequence({
					cinematicMapHelper.ConditionalIfElse(|| cinematicMapHelper.CurrentQuestStatus().context.GetInt("generalDied") == 0, 
					cinematicMapHelper.Sequence({
						cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.alive, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.hard()}),
						}
					),
					cinematicMapHelper.Sequence({
						cinematicMapHelper.ShowRewards("MAP_RESULT_TITLE_VICTORY", || quest.results.dead, || {complex= cinematicMapHelper.PartyStars() >= config.starLimit.hard()}),
						}
					)),
				}
			)),
			
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

		alive = cinematicMapHelper.Result(|params| {
			
			{type="guild.attribute", kind = "loot", amount = params.complex and (config.rewards.loot.high()*1.5) or config.rewards.loot.high()},
			{type="giveStar", amount = 1},
			{type="giveXP", amount = params.complex and config.rewards.starXp.mid() or config.rewards.starXp.low()},
			{type="checkInjuries"},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = params.complex and "highHealing" or "midHealing", quantity = || config.rewards.itemChance.mid() and 1 or 0, slot = 1},
			})}
			}),
		dead = cinematicMapHelper.Result(|params| {
			
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

	quest.shouldRun = || ((cinematicMapHelper.CurrentQuestStatus().context.GetObject("solved") == nil) or (cinematicMapHelper.Guild().context.GetInt("linked.rescueGeneral") == 1))
	helper.AddQuest(quest)
	quest.revealDistance = 2
end
