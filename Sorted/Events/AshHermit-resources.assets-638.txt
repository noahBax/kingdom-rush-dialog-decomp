



do 
	local quest = helper.QuestDefinition();
	quest.id = 'AshHermit'
	quest.visual = "Wanderer"
	quest.encounters = {}
	quest.kindFlag = "Enigma"
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Ash Hermit"),
						            text = || __D(2, "We stumble upon the Ash Hermit's hut.\n\n\"In my solitude, I seek the answers of the untold.\n\nTell me, adventurers, which beast is the best of them all?\""),
						    		icon = || "Asst_AshHermit",
						    		who = || "mapCinematicId",
						    		condition = function (d, n)
	                                    d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

	                                    local allOptions = {"lion", "turtle", "owl", "elephant", "butterfly", "dragon", "unicorn", "ant"}
	                                    d.data.options = cinematicMapHelper.RandomItemN(allOptions, 3)
	                               		return true
                                    end,
						            children = {
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "The Lion"), 
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "lion"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "\"A proud mane worn as a crown and fierce claws only topped by its roar ... good choice,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.lion,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "The Turtle"),
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "turtle"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "\"Slow but steady and armor as thick as a brick.\n\nOdd choice I would say, but a good one indeed,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.turtle,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "The Elephant"),
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "elephant"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "\"Big as a house with stampeding might.\n\nI would hate to face this colossus in a fight,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.elephant,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "The Butterfly"),
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "butterfly"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "\"By its graceful wings, the air is caressed. \n\nThose who understand its beauty are indeed truly blessed,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.butterfly,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "The Ant"),
		                                    condition =  |d| cinematicMapHelper.InList(d.data.options, "ant"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(12, "\"United as one, the colony is industrious and bold.\n\nOh! How rich ants would be if they cared about gold,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.ant,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(13, "The Dragon"),
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "dragon"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(14, "\"Powerful and wise, of the mountains he's the lord. Yet he's forever accursed to increase his treasure hoard,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.dragon,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(15, "The Unicorn"),
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "unicorn"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(16, "\"Fantastic and untamed, what a wonderful being.\n\nDefender of the forests; Master of healing,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.unicorn,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(17, "The Owl"),
		                                    condition = |d| cinematicMapHelper.InList(d.data.options, "owl"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(18, "\"Wise eyes that see all, atop the treetops, this silent hunter the world beholds,\"\n\nthe hermit said before vanishing into thin air."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.owl,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {

		lion = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets =  {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		turtle = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = 1, targets =  {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		owl = cinematicMapHelper.Result(|params| {
			{type="giveStar", amount = 1},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		elephant = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = 1, targets =  {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		butterfly = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		dragon = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets =  {params.hero}},
			{type="unit.attribute", kind = "armor_max", amount = 1, targets =  {params.hero}},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		unicorn = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 100, targets =  cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
		ant = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 100},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eMid() or (params.normal and config.rewards.starXp.eLow() or (config.rewards.starXp.eLow()/2))},
			}),
	}


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end)		
								}))

	helper.AddQuest(quest)
	
end
