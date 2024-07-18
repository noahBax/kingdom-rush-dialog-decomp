



do 
	local quest = helper.QuestDefinition();
	quest.id = 'Riddlemaster'
	quest.visual = "WandererMage"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Riddlemaster"),
						            text = || __D(2, "A wizard stands at the beginning of a bridge.\n\nHe looks at us and says.\n\"A riddle you shall receive, answer true and you may proceed.\""),
						    		icon = || "Asst_Riddlemaster",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Listen to his riddle."),
		                                    onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "a")
	                                    		table.insert(resultsAvailable, "b")
	                                    		table.insert(resultsAvailable, "c")
	                                    		table.insert(resultsAvailable, "d")
	                                    		table.insert(resultsAvailable, "e")
	                                    		table.insert(resultsAvailable, "f")
	                                    		table.insert(resultsAvailable, "g")
	                                    		table.insert(resultsAvailable, "h")
	                                    		table.insert(resultsAvailable, "j")
	                                    		table.insert(resultsAvailable, "k")
	                                    		table.insert(resultsAvailable, "l")
	                                    		table.insert(resultsAvailable, "m")
	                                    		table.insert(resultsAvailable, "n")
	                                    		table.insert(resultsAvailable, "o")
	                                    		table.insert(resultsAvailable, "p")
	                                    		table.insert(resultsAvailable, "q")
	                                    		table.insert(resultsAvailable, "r")
	                                    		table.insert(resultsAvailable, "s")
	                                    		table.insert(resultsAvailable, "t")
	                                    		table.insert(resultsAvailable, "u")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

		                                    	d.data.outcome = randomOutcome
		                                    end,
										   	children = {
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "a",
			                                    	text = || __D(4, "I am dark like the depths where I belong,\nIf pressed I am more valuable than gold,\nYet naughty kids hate to see me in a box."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(5, "A bat!"),
														   	children = {
																{
																	type = DialogType.Dialog,
																	id = "wrong",
							                                    	text = || __D(6, "\"I'm afraid that's incorrect and for that, you must be punished!\"\nhe said, before bursting into a dark cloud."),
														    		who = || "mapCinematicId",
														    		children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.wrong,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																		}
																    }
																}
													        }
														},
														{
															type = DialogType.Response,
						                                    text = || __R(7, "Coffee!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(8, "Oil!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(9, "Coal!"),
														   	children = {
																{
																	type = DialogType.Dialog,
																	id = "correct",
							                                    	text = || __D(10, "\"Superb! That's the answer I was expecting, you may proceed,\"\nsaid the wizard, handing us a prize before letting us through."),
														    		who = || "mapCinematicId",
														    		onChoose = function (d, n)
														    			cinematicMapHelper.AchievementIncrementI("correct_riddles",1)
														    		end,
														    		children = {
																        {
														    				type = DialogType.Custom,
														    				subtype = "rewards",
														    				rewards = || quest.results.correct,
														    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																    		exit = true
																    		
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																			
																		}
																    }
																}
													        }
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "b",
			                                    	text = || __D(11, "Don't leave me out too long or I may rot.\n\nDon't raise me in the cold or I won't grow.\n\nDon't step on my dress or you may fall."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(12, "An apple!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(13, "A bride!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(14, "A banana!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(15, "A wizard!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "c",
			                                    	text = || __D(16, "I used to crawl but nevermore.\n\nFrom grass toward the sky I soar.\n\nA monarch with a flowery throne."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(17, "A human prince!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(18, "A bee!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(19, "A Faerie Dragon!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(20, "A butterfly!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "d",
			                                    	text = || __D(21, "My hands are a different size\n\nyet they work every time.\n\nI only move them to one side,\n\nTwice a day; my entire life."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(22, "A mill!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(23, "A crab!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(24, "A clock!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(25, "Hand Solo!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "e",
			                                    	text = || __D(26, "The more I make less,\nThe more I become.\n\nOn the ground,\non your clothes.\n\nEven in space,\nI eat it all!"), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(27, "A moth!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(28, "King Denas!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(29, "An alien!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(30, "A hole!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "f",
			                                    	text = || __D(31, "I keep a golden treasure inside,\n\nBreak me and I may feed you once,\n\nGive me time; I'll feed you all my life."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(32, "A chest!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(33, "An egg!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(34, "A maple tree!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(35, "A bee!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "g",
			                                    	text = || __D(36, "If I'm given, you're my guardian.\n\nHaving me is such a burden.\n\nI'm so valuable to keep,\n\nBut I'm gone if I leave your lips."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(37, "A kiss!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(38, "A whisper!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(39, "A tongue!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(40, "A secret!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "h",
			                                    	text = || __D(41, "I'll follow you around everywhere you go,\nBe it sandy deserts or freezing snows.\n\nRight beside you and usually below,\nI'll stick around unless the sun is gone."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(42, "A spy!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(43, "Vultures!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(44, "A shadow!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(45, "The floor!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "j",
			                                    	text = || __D(46, "I am a giant to humans, a titan to behold!\n\nI give birth to rivers; I cradle precious ores.\n\nI live both on earth and sky, I see it all from above."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(47, "A troll!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(48, "A cloud!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(49, "A mountain!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(50, "The rain!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "k",
			                                    	text = || __D(51, "Turn me once or more,\n\nI'll keep safe what you store.\n\nDon't you lose me or you won't pass\n\nThat thing you turned me for in the past."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(52, "A door!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(53, "A chest!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(54, "A turnstile!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(55, "A key!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "l",
			                                    	text = || __D(56, "I'm a tiny portion of what I can be.\n\nDown in the ground\n\nor floating around.\n\nWhat do I hide? Just wait and see."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(57, "Time!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(58, "A seed!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(59, "An iceberg!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(60, "A mine!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "m",
			                                    	text = || __D(61, "To exist, one must consume.\n\nThe burning fire is my womb.\n\nI'm the brother of the clouds,\n\nIf I'm strong I disperse crowds."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(62, "Smoke!"),
														   	jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(63, "Wood!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(64, "Air!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(65, "Rain!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "n",
			                                    	text = || __D(66, "My body will warm you during winter\n\nand carry you across a creek.\n\nIf I'm hurt I may splinter\n\nand sap subtly weep."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(67, "A boat!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(68, "Fire!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(69, "Wood!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(70, "A tree!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "o",
			                                    	text = || __D(71, "Side by side with my kind\n\nI can be more than on my own.\n\nPair me with a working hand\n\nAnd beautiful structures behold!"), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(72, "A hammer!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(73, "A brick!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(74, "Paper!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(75, "A wolf!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "p",
			                                    	text = || __D(76, "If you have me, all goes well;\n\nif you don't, all will fail.\n\nI can be either good or bad.\n\nIf you lose me, you'll be mad."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(77, "Gold!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(78, "Luck!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(79, "Acne!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(80, "A horse!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "q",
			                                    	text = || __D(81, "For me to ever be\n\nsomething had to begin.\n\nShould I come to exist\n\nI'm the last that would be."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(82, "Tomorrow!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(83, "The universe!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(84, "A giraffe's necklace collection!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(85, "The end!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "r",
			                                    	text = || __D(86, "Everyday I bring the end.\n\nI send the shadows to whence they came.\n\nAll around the world, people love to stare\n\nat the night's best friend."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(87, "The moon!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(88, "The stars!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(89, "The sunset!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(90, "Light!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "s",
			                                    	text = || __D(91, "Those deceitful try to hide me.\n\nThose who know me\nmay share me or keep me to themselves.\n\nBut when I come out,\nnothing stays the same."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(92, "Love!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(93, "Gold!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(94, "Truth!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(95, "Fear!"),
														   	jumpTo = "wrong"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "t",
			                                    	text = || __D(96, "I can be written or told,\n\nnew or old,\n\nwith my friends make a song,\n\nand even powerful alone."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(97, "A spell!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(98, "A guitar!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(99, "A star!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(100, "A word!"),
														   	jumpTo = "correct"
														}
										        	}
												},
												{
													type = DialogType.Dialog,
													condition = |d| d.data.outcome == "u",
			                                    	text = || __D(101, "Weightless as one can be,\n\nyou can't hold me for too long.\n\nSomeone may steal me,\n\nyet I can't be sold."), 
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
						                                    text = || __R(102, "Memories!"),
														   	jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(103, "Breath!"),
						                                    jumpTo = "correct"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(104, "A feather!"),
						                                    jumpTo = "wrong"
														},
														{
															type = DialogType.Response,
						                                    text = || __R(105, "Counterfeit coins!"),
														   	jumpTo = "wrong"
														}
										        	}
												}
									        }
		                                }
						        	}
						        }
					    })

	quest.results = {

		correct = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.low() },
			}),
		wrong = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.PartyRandom(2)},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end),	
									cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.Guild().context.GetInt("linked.zombieTownQuest") == 1, 
										cinematicMapHelper.Sequence({cinematicMapHelper.Instant(function ()
												do
													cinematicMapHelper.Sleep(0.4)
													cinematicMapHelper.ShowCommentI("Quest Received", Color.white,  Color.black, 1.5)
													local quests = cinematicMapHelper.FilterQuests(function (qs)
														return qs.quest.id== 'GhostTown'
													end)
													local nodeId = quests[0].nodeId
													cinematicMapHelper.CurrentQuestStatus().context.SetObject("NODETOREVEAL", nodeId)
												end
											end),
											cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("NODETOREVEAL") != nil, 
												cinematicMapHelper.Sequence({
													cinematicMapHelper.Sleep(2),
													
													cinematicMapHelper.SetCinematicMode(true),
													cinematicMapHelper.CameraMoveToNode(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("NODETOREVEAL"),|| 0.5),
													cinematicMapHelper.CameraZoomMap(|| "IN", || cinematicMapHelper.CurrentQuestStatus().context.GetObject("NODETOREVEAL"), ||0.3),
													cinematicMapHelper.Instant(function()
														local nodeId = cinematicMapHelper.CurrentQuestStatus().context.GetObject("NODETOREVEAL")
														local node = cinematicMapHelper.Node(nodeId)
														
														node.RevealNode()
														cinematicMapHelper.Sleep(0.5)
														node.SetVisualState("burning")
													end),
													cinematicMapHelper.Sleep(2),
													cinematicMapHelper.CameraZoomMap(|| "OUT", || cinematicMapHelper.CurrentQuestStatus().context.GetObject("NODETOREVEAL"), ||0.75),
													cinematicMapHelper.Sleep(1),
													cinematicMapHelper.CameraMoveToAndZoomNode(|| cinematicMapHelper.CurrentQuestStatus().nodeId, ||"OUT", ||1.1),
													cinematicMapHelper.SetCinematicMode(false)
												}))
										})
									)	
								}))
	helper.AddQuest(quest)
	
end
