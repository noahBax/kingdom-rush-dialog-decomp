do 
	local quest = helper.QuestDefinition();
	quest.id = 'RewardResultGUITest'
	quest.visual = "Cave"
	
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","FIXED","NORMAL","TERRAIN_PLAINS", "TERRAIN_WOODS"}

	quest.results = {

		wanderSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="giveStar", amount = 1},
			{type="text", text = "Party received 1HP damage each."},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			{type="guild.attribute", kind = "loot", amount = -config.rewards.loot.mid()},

			{type="unit.attribute", kind = "baseDamage", amount = -2, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "baseDamage", amount = 3, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "baseDamage", amount = -1, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "armor_max", amount = -2, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "armor_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "armor_max", amount = 3, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "armor_max", amount = -1, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "health_max", amount = -2, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "health_max", amount = 3, targets = cinematicMapHelper.Party()},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = cinematicMapHelper.Party()},

			{type="item", itemId = "torch", amount = -1 },
			{type="item", itemId = "torch", amount = 2 },

			{type="doDamage", amount = 3, targets = cinematicMapHelper.Party()},
			{type="doDamage", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},

			{type="doHeal", amount = 5, targets = cinematicMapHelper.Party()},
			{type="doHeal", amount = 2, targets = cinematicMapHelper.PartyRandom(2)},

			{type="darkness", amount = config.rewards.darkness.low()},
			{type="darkness", amount = -config.rewards.darkness.mid()},

			{type="applyModifier", archetype = "blessed_1", duration = config.rewards.buffDuration.low(), targets = cinematicMapHelper.Party()},
			{type="applyModifier", archetype = "blessed_2", duration = config.rewards.buffDuration.low(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="changeModifier", category="fortuneMod", delta =-2, duration = config.rewards.buffDuration.low(), targets =  cinematicMapHelper.PartyRandom(1)},
			{type="changeModifier", category="fortuneMod", delta =-2, duration = config.rewards.buffDuration.low(), targets =  cinematicMapHelper.PartyRandom(1)},
			}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({	
									cinematicMapHelper.DebugShowResults(|| quest.results.wanderSuccess)
								}))
	helper.AddQuest(quest)
end
