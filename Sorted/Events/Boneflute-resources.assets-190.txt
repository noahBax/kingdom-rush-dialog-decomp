

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Boneflute'
	quest.visual = "DarkRuins"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Boneflute"),
						            text = || __D(2, "A serene, whistling melody catches our attention, and we decide to follow it, only to find a one-legged skeleton playing a flute behind some rocks.\n\n\"Hey, travelers! Want a little inspiration for your journey? I could use the company ... or the coin!\""),
						    		icon = || "Asst_Boneflute",
						    		who = || "mapCinematicId",
						            children = {
							    		
							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Ask for a song."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "\"Great! What tune of mine would you like to hear, my friends?\""),
										    		who = || "mapCinematicId",
										    		children = {
												        {
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                                				    amount = || 20,
						                                    text = || __R(5, "Never Give Up."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "We tossed some coins to the bard, and it started playing a mellow tune that lifted our spirits and even healed some of our wounds!"),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.songA,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                                				    amount = || 30,
						                                    text = || __R(7, "Bless the Rains."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "We tossed some coins to the bard, and it started playing a beautiful and energizing melody that filled us with hope and determination!"),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.songB,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Custom,
						                                    subtype = "loot",
		                                				    amount = || 50,
						                                    text = || __R(9, "Eye of the Lion."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "We tossed some coins to the bard, and it started playing such a vigorous and motivating tune that we couldn't help but to start doing some exercises, improving our strength!"),
														    		who = || "mapCinematicId",
														    		children = {
																		{
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.songC,
														    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
														        	}
																}
													        }
						                                },

						                                {
						                                    type = DialogType.Response,
						                                    text = || __R(11, "Never mind...."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
																	id = "moveOn",
							                                    	text = || __D(12, "We thanked the bard for the offer, but we decided not to waste any time, and we continued our journey."),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
						                                }
												    }
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    condition = || cinematicMapHelper.HeroByTag("ct_knowledge") != nil,
                           					who = || cinematicMapHelper.HeroByTag("ct_knowledge").GUID,
		                                    text = || __R(13, "Sing a ballad!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(14, "We offered to accompany its music with songs we knew, and we spent some relaxing time in the midst of all the chaos.\n\nEven the skeleton bard seemed refreshed afterwards!"),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.singBallad,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(15, "Move on."),
		                                    jumpTo = "moveOn"
		                                }
						        	}
						        }
						    })

	quest.results = {
		
		songA = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20 },
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
		}),

		songB = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -30 },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
		}),

		songC = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -50},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
		}),
		
		singBallad = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
		}),

	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
