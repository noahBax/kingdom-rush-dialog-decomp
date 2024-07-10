

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BooksOfTheGlare'
	quest.visual = "GlareCamp"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE", "TREASURE", "NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Books of the Glare"),
						            text = || __D(2, "A big tent stands out in a seemingly abandoned camp, so we decide to inspect it further.\n\nInside, we find various goods, books, and even a small statue with a green crystal on it."),
						    		icon = || "Asst_Library",
						    		who = || "mapCinematicId",
						            children = {

							    		{
		                                    type = DialogType.Response,
		                                    condition = || cinematicMapHelper.HeroByTag("ct_knowledge") != nil,
                           					who = || cinematicMapHelper.HeroByTag("ct_knowledge").GUID,
		                                    text = || __R(3, "Use the scrolls."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "After searching through the scrolls for a while, we decided to cast an empowering spell on ourselves.\n\nShortly after, we heard the sound of a group of cultists approaching, and we immediately fled from the place."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useScrolls,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },

								        {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Read the books."),
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(6, "We decided to skim through various books and journals, but we soon found ourselves absorbed by the sheer number of horrors and calamities they were planning to bring to our plane of existence.||Hearing the sound of a group of cultists approaching, we stopped our reading and fled from the place with newfound horrors plaguing our minds."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.readBooks,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
								        	}
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    onEnter = function (d,n)
						    					d.data.hero=cinematicMapHelper.PartyRandom(1)[0]
						    				end,
		                                    text = || __R(7, "Touch the statue."),
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(8, "The energy radiated by the glowing green crystal caught our attention, so we tried touching it, and immediately felt a burning pain followed by a rush of energy through our bodies.\n\nShortly after, the sound of a group of cultists approaching the camp made us flee from the place."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.touchStatue,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
										        	}
												}
								        	}
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Loot and leave."),
										    children = {
												{
													type = DialogType.Dialog, 
			                                    	text = || __D(10, "Unwilling to get distracted by weird cultist stuff, we decided to loot whatever we could and get away before someone (or something) returned to the camp."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.lootTent,
										    				rewardsParams = || {},
												    		exit = true
														}
										        	}
												}
								        	}
		                                },
						        	}
						        }
						    })

	quest.results = {
		
		useScrolls = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.Party()},
		}),

		readBooks = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

		touchStatue = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		lootTent = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.low()},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.mid()},
			{type="item", loot = cinematicMapHelper.StoreContentFromLootTable({
				{type = "itemList", id = "maskTable", quantity = || 1, slot = 1},
			})},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
