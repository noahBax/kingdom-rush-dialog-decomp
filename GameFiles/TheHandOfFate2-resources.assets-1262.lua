


do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheHandOfFate2'
	quest.visual = "WandererMage"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Hand of Fate"),
						            text = || __D(2, "A traveling fortune teller wrapped in mystery approaches us!\n\n\"Pick a card and learn thy fate!\" she offers, holding a deck of cards."),
						    		icon = || "Asst_HandOfFate",
						    		who = || "mapCinematicId",
						    		condition = function (d, n)
	                                    d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

	                                    local allOptions = {"a", "b", "c", "d", "e", "f", "g", "h", "i"}
	                                    d.data.options = cinematicMapHelper.RandomItemN(allOptions, 3)
	                               		return true
                                    end,
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Pick a card!"),
		                                    who = || "mapCinematicId",
		                                    children = { 
	                                    	{
		                                    	type = DialogType.Dialog,
		                                    	text = || __D(4, "The fortune teller offered us three cards to choose from."),
									    		who = || "mapCinematicId",
									    		children = {
				                                    	{
						                                    type = DialogType.Response,
						                                    text = || __R(5, "The Tower!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "a"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "The Tower!##\"What once was must give way to what must be...,\"\n\nthe woman muttered with a smirk ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.a,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(7, "The Star"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "b"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "The Star!##\"Blessed be thy fate for the star shall guide the way!\"\n\nthe woman chanted ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.b,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(9, "The Empress!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "c"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "The Empress!##\"Mother provides, for you shall suffer no hunger!\"\n\nthe woman said and looked at our provisions ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.c,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(11, "Death!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "d"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(12, "Death!##\"Death may come when least expected ... but we will all face it eventually,\"\n\nthe woman said softly as she grinned ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.d,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
												        {
						                                    type = DialogType.Response,
						                                    text = || __R(13, "The Fool!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "e"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(14, "The Fool!##\"Parading carelessly through life may seem foolish ... unless you have luck on your side,\"\n\nthe woman uttered with a smile ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.e,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
												        {
						                                    type = DialogType.Response,
						                                    text = || __R(15, "Blank Card!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "f"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(16, "Blank Card!##\"Use this card to replace any missing card from your deck ... um ... sorry ... this shouldn't be in here...||Here, take a coin for your troubles,\" the woman politely apologized ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.f,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
												        {
						                                    type = DialogType.Response,
						                                    text = || __R(17, "The Hermit!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "g"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(18, "The Hermit!##\"The Hermit is wise and full of knowledge ... he requires no company but himself,\"\n\nthe woman uttered in a low pondering voice ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.g,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(19, "The Chariot!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "h"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(20, "The Chariot!##\"The Chariot moves forward to victory, always steady and relentless!\"\n\nthe woman claimed in excitement ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.h,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },
						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(21, "The Hierophant!"),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "i"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(22, "The Hierophant!##\"Sometimes in life, one must slow down to avoid a chaotic path. Such is the advice of the Hierophant,\"\n\nthe woman told us with an assertive tone ... then continued her journey."),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.i,
														    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                }
												    }
			                           			}
								        	}
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(23, "Keep going!"),
										    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {
		a = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets =  {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		b = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		c = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.midR() },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		d = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		e = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets =  {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		f = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 1 },
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		g = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets =  {cinematicMapHelper.HeroByTag("Legend")}},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets =  {cinematicMapHelper.HeroByTag("Legend")}},
			{type="doDamage", amount = dice(2,2), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		h = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = 2, targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		i = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets =  {params.hero}},
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
