

do 
	local quest = helper.QuestDefinition();
	quest.id = 'SecondHandGoods'
	
	
	quest.encounters = {}
	quest.tags = {"EMERGENT", "TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Second-Hand Goods"),
						            text = || __D(2, "A shifty-looking acolyte calls us from behind a dead tree.\n\n\"Psst! Wanna buy some goods I got from the cult? Don't worry, I only joined them to steal and make some coin from them.\""),
						    		icon = || "Asst_SecondHand",
						    		who = || "mapCinematicId",
						    		condition = function (d, n)
	                                    d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

	                                    local allOptions = {"a", "b", "c", "d", "e", "f", "g"}
	                                    d.data.options = cinematicMapHelper.RandomItemN(allOptions, 3)
	                               		return true
                                    end,
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "\"What do you have?\""),
		                                    who = || "mapCinematicId",
		                                    children = { 
	                                    	{
		                                    	type = DialogType.Dialog,
		                                    	text = || __D(4, "The \"acolyte\" opened his coat to show us his merch."),
									    		who = || "mapCinematicId",
									    		children = {
				                                    	{
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 60,
						                                    text = || __R(5, "Healing Potion."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "a"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 80,
						                                    text = || __R(7, "Tent."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "b"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 85,
						                                    text = || __R(9, "Invigorating Potion."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "c"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 60,
						                                    text = || __R(11, "Armorer's Kit."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "d"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(12, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 120,
						                                    text = || __R(13, "Sharpening Stone."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "e"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(14, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 85,
						                                    text = || __R(15, "Horn of Heroes."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "f"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(16, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                          					        amount = || 100,
						                                    text = || __R(17, "Mask of Sorrow."),
						                                    who = || "mapCinematicId",
						                                    condition = |d| cinematicMapHelper.InList(d.data.options, "g"),
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(18, "\"He-he ... there you go. Gotta run now!\" he said, handing us the item before vanishing in a cloud of smoke."),
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
															text = || __R(20, "Never mind...."),
												    		who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(21, "\"He-he ... your loss, then. Gotta run now!\" he said before vanishing in a cloud of smoke."),
														    		who = || "mapCinematicId",
														    		exit = true
																}
															},
														}
												    }
			                           			}
								        	}
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(19, "Keep going."),
										    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(22, "\"He-he ... your loss, then. Gotta run now!\" he said before vanishing in a cloud of smoke."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
											},
		                                }
						        	}
						        }
						    })

	quest.results = {
		a = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -60},
			{type="item", itemId = "healthPotion", amount = 1},
			}),
		b = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -80},
			{type="item", itemId = "tent", amount = 1},
			}),
		c = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -85},
			{type="item", itemId = "invigoratingPotion", amount = 1},
			}),
		d = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -60},
			{type="item", itemId = "armorersKit", amount = 1},
			}),
		e = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -120},
			{type="item", itemId = "sharpeningStone", amount = 1},
			}),
		f = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -85},
			{type="item", itemId = "horn", amount = 1},
			}),
		g = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -100},
			{type="item", itemId = "armorersKit", amount = 1},
			})
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end)		
								}))
	helper.AddQuest(quest)

	
end
