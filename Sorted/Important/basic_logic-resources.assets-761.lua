do 
	local quest = helper.QuestDefinition();
	quest.id = 'food_cost'

	quest.AddEvent("leavingNormalNode", logicHelper.Handler(1000,function (c)
		print("foodHandler")
		local food = cinematicMapHelper.Guild().GetFood();
		if food > 0 then
			cinematicMapHelper.Guild().AddFood(-1)
			cinematicMapHelper.ShowCommentI("-1 Food", Color.__new(0.6, 0.3, 0.1,1),  Color.black, 2)
		end
		
	end))
	
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'damage_when_walking_with_hunger'

	quest.AddEvent("leavingNormalNode", logicHelper.Handler(-1000,function (c)
		print("damageHandler")
		local food = cinematicMapHelper.Guild().GetFood();
		
		if food <= 0 then

			local heroes = cinematicMapHelper.Party()

			for i=0,heroes.Count - 1 do
				heroes[i].DoDamage(1)
			end
			cinematicMapHelper.ShowCommentI("Received Damage", Color.__new(1,0.25,0.25,1),  Color.black, 2)
		end
		
	end))
	
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'healing_when_walking_with_food'

	quest.AddEvent("leavingNormalNode", logicHelper.Handler(-1000,function (c)
		print("healingHandler")
		local food = cinematicMapHelper.Guild().GetFood();
		
		if food > 0 then

			local heroes = cinematicMapHelper.Party()

			local totalHealed = 0

			for i=0,heroes.Count - 1 do
				local currentHealth = heroes[i].heroDefinition.stats.GetStatValue("health")
				heroes[i].DoHeal(1)
				local afterHealth = heroes[i].heroDefinition.stats.GetStatValue("health")
				local healedBy = afterHealth - currentHealth
				print("Healing from " .. currentHealth .. " to " .. afterHealth .. " by " .. healedBy)
				totalHealed = totalHealed + healedBy
			end

			print("Total Healed: " .. totalHealed)


			if totalHealed >= 1 then

			end
		end
		
	end))
	
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'count_steps_taken_in_map'

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.stepCount, function (c)
		local node = c.GetObject("NODE")
		if(node.isIntermediate) then
			return
		end

		local steps = cinematicMapHelper.Guild().context.GetInt("stepCount")
        local curSteps = steps + 1
		cinematicMapHelper.Guild().context.SetInt("stepCount", curSteps)
		print("step taken: " .. steps)


		
		local heroes = cinematicMapHelper.Party()
		for i=0,heroes.Count - 1 do
			local currentSteps = heroes[i].stats.GetStatValue("stepsTaken")
			heroes[i].stats.SetStatValue("stepsTaken", currentSteps + 1)
		end

        if helper.IsLastDemoAdventure() and helper.GetDemoMaxStep() == curSteps then
            cinematicMapHelper.QueueCinematic(cinematicMapHelper.Cinematic({
                cinematicMapHelper.ShowDemoDialog()
            }))
        end
	end))

	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'healing_when_walking_with_food_item'

	quest.AddEvent("leavingNormalNode", logicHelper.Handler(-1000,function (c)
		print("healingHandler")
		
		
		if cinematicMapHelper.HasItemInInventory("food") then

			local heroes = cinematicMapHelper.Party()

			local totalHealed = 0

			for i=0,heroes.Count - 1 do
				local currentHealth = heroes[i].heroDefinition.stats.GetStatValue("health")
				heroes[i].DoHeal(1)
				local afterHealth = heroes[i].heroDefinition.stats.GetStatValue("health")
				local healedBy = afterHealth - currentHealth
				print("Healing from " .. currentHealth .. " to " .. afterHealth .. " by " .. healedBy)
				totalHealed = totalHealed + healedBy
			end

			print("Total Healed: " .. totalHealed)


			if totalHealed >= 1 then

				cinematicMapHelper.NotifyActiveItemUse("food")
				cinematicMapHelper.ConsumeInventoryItem("food")
			end
			

		end
		
	end))
	
	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'add_xp_when_exploring'

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.xpWhenExploring, function (c)
		local node = c.GetObject("NODE")

		if(node.isIntermediate) then
			return
		end

		if(cinematicMapHelper.Guild().context.GetInt("stepCount") == 0) then
			return
		end
		
		if(cinematicMapHelper.CurrentNode().tags.Contains("hard")) then
			cinematicMapHelper.ImmediateResults({
				{type="giveXP", amount = config.rewards.starXp.baseHard()},
				
			})
		elseif(cinematicMapHelper.CurrentNode().tags.Contains("normal")) then
			cinematicMapHelper.ImmediateResults({
				{type="giveXP", amount = config.rewards.starXp.baseMid()},
				
			})
		else
			cinematicMapHelper.ImmediateResults({
				{type="giveXP", amount = config.rewards.starXp.baseLow()},
				
			})
		end
		
	end))

	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'check_darkness_rising'

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.DAYFINISHED, function (c)
		local node = c.GetObject("NODE")
		local darkness = cinematicMapHelper.DarknessLevel()
		local prevDarkness = cinematicMapHelper.Guild().context.GetInt("prevDarkness")

		if darkness <= prevDarkness then
			return
		end

		if darkness > prevDarkness then
			cinematicMapHelper.Guild().context.SetInt("darknessRose", 1)
			cinematicMapHelper.Guild().context.SetInt("prevDarkness", cinematicMapHelper.DarknessLevel())
		end
		
	end))

	helper.AddQuest(quest)
end

do 
	local quest = helper.QuestDefinition();
	quest.id = 'basic_achievements'

	quest.AddEvent("usedItemInChallenge", logicHelper.Handler(0, function (c)
		cinematicMapHelper.AchievementIncrementI("bombardier_unlock",1)
		cinematicMapHelper.AchievementIncrementI("large_item_usage_run",1)
	end))

	quest.AddEvent("usedItemActive", logicHelper.Handler(0, function (c)
		cinematicMapHelper.AchievementIncrementI("large_item_usage_run",1)
	end))

	quest.AddEvent("afterProcessingNode", logicHelper.Handler(custom.eventPriorities.afterProcessingNode.stepCount, function (c)
		local node = c.GetObject("NODE")
		if(node.isIntermediate) then
			return
		end

		if(not cinematicMapHelper.IsNodeStartI()) then
			if not cinematicMapHelper.PlayingTutorialI() then
				cinematicMapHelper.AchievementIncrementI("knight_unlock",1)
			end
			cinematicMapHelper.AchievementIncrementI("nodes_exploration",1)
		end
	end))

	quest.AddEvent("heroLevelUp", logicHelper.Handler(0, function (c)
		local heroes = cinematicMapHelper.Party()
		if heroes.Count == 4 then
			local allHeroesMaxLevel = true
			for i=0, heroes.Count - 1 do
				local currentLevel = heroes[i].heroDefinition.stats.GetStatValue("level")
				if currentLevel < 3 then
					allHeroesMaxLevel = false
					break
				end
			end

			if allHeroesMaxLevel then
				cinematicMapHelper.AchievementIncrementI("max_level_party",1)
			end
		end
	end))

	quest.AddEvent("runWon", logicHelper.Handler(0, function (c)
		cinematicMapHelper.AchievementIncrementI("combat_victories_count",1)
		cinematicMapHelper.AdventureSummaryIncrementI("summary.encounters_survived",1)
		cinematicMapHelper.AdventureSummaryIncrementI("summary.beat_boss",1)

		if not cinematicMapHelper.PlayingTutorialI() then	
			
			local heroes = cinematicMapHelper.GetOldAndCurrentParty()
			local allHeroesTotalDeahtsAreZero = true
			for i=0, heroes.Count - 1 do
				local totalDeaths = heroes[i].heroDefinition.stats.GetStatValue("total_deaths")
				local deathsInFight = heroes[i].heroDefinition.stats.GetStatValue("deaths_in_fights")
				if totalDeaths > 0 or deathsInFight > 0 then
					allHeroesTotalDeahtsAreZero = false
					break
				end
			end
			if allHeroesTotalDeahtsAreZero then
				cinematicMapHelper.AchievementIncrementI("flawless_run",1)
			end

			
			for i=0, heroes.Count - 1 do
				local hero = heroes[i]
				local statOffset = cinematicMapHelper.GetHeroStatOffset(hero, "armor_max")
				if statOffset == 3 then
					cinematicMapHelper.AchievementIncrementI("max_stat_hero",1)
				end
				statOffset = cinematicMapHelper.GetHeroStatOffset(hero, "baseDamage")
				if statOffset == 3 then
					cinematicMapHelper.AchievementIncrementI("max_stat_hero",1)
				end
				statOffset = cinematicMapHelper.GetHeroStatOffset(hero, "health_max")
				if statOffset == 3 then
					cinematicMapHelper.AchievementIncrementI("max_stat_hero",1)
				end
				
				if statOffset == -3 then
					cinematicMapHelper.AchievementIncrementI("crippled_hero_win",1)
				end
			end

			
			local legend = cinematicMapHelper.GetLegend()
			if legend.UniqueId == "Gerald" then
				cinematicMapHelper.AchievementIncrementI("gerald_adventure_win",1)
			end
			if legend.UniqueId == "Asra" then
				cinematicMapHelper.AchievementIncrementI("asra_adventure_win",1)
			end
			if legend.UniqueId == "DemonOloch" then
				cinematicMapHelper.AchievementIncrementI("oloch_adventure_win",1)
			end
			if legend.UniqueId == "Bruxa" then
				cinematicMapHelper.AchievementIncrementI("bruxa_adventure_win",1)
			end
			if legend.UniqueId == "Regson" then
				cinematicMapHelper.AchievementIncrementI("regson_adventure_win",1)
			end
			if legend.UniqueId == "Bravebark" then
				cinematicMapHelper.AchievementIncrementI("silveroak_bravebark_adventure_win",1)
			end

			heroes = cinematicMapHelper.Party()
			if (heroes.Count == 3) then
				cinematicMapHelper.AchievementIncrementI("no_recruits_victory",1)
			end

		end

		
		heroes = cinematicMapHelper.Party()
		local hasTagMight = false
		local hasTagcAthletics = false
		local hasTagMagic = false
		local hasTagCraft = false
		for i=0, heroes.Count - 1 do
			local hero = heroes[i]
			if hero.MatchesTag("ct_might") then
				hasTagMight = true
			end
			if hero.MatchesTag("ct_athletics") then
				hasTagcAthletics = true
			end
			if hero.MatchesTag("ct_magic") then
				hasTagMagic = true
			end
			if hero.MatchesTag("ct_craft") then
				hasTagCraft = true
			end
		end
		if hasTagMight and hasTagcAthletics and hasTagMagic and hasTagCraft then
			cinematicMapHelper.AchievementIncrementI("one_of_each_party",1)
		end
	end))

	quest.AddEvent("combatWon", logicHelper.Handler(0, function (c)
		cinematicMapHelper.AchievementIncrementI("combat_victories_count",1)
		cinematicMapHelper.AdventureSummaryIncrementI("summary.encounters_survived",1)
	end))

	quest.AddEvent("diceChallengeCompleted", logicHelper.Handler(0, function (c)
		local challengeSuccess = c.GetObject("challengeSuccess")
		local numberOfSuccess = c.GetObject("numberOfSuccess")

		if challengeSuccess then
			cinematicMapHelper.AchievementIncrementI("challenge_success_spree",1)
			cinematicMapHelper.AdventureSummaryIncrementI("summary.successful_dice_rolls",1)

			if numberOfSuccess >= 4 then
				cinematicMapHelper.AchievementIncrementI("challenge_poker_success",1)
			end
		else
			cinematicMapHelper.AchievementClearI("challenge_success_spree")
		end
	end))

	quest.AddEvent("lootAdded", logicHelper.Handler(0, function (c)
		local loot = c.GetObject("loot")
		cinematicMapHelper.AchievementIncrementI("loot_collector",loot)
		cinematicMapHelper.AdventureSummaryIncrementI("summary.loot_collected",loot)
	end))

	quest.AddEvent("orbAdded", logicHelper.Handler(0, function (c)
		cinematicMapHelper.AdventureSummaryIncrementI("summary.orbs_amount",1)
	end))

	helper.AddQuest(quest)
end
