

do 
	local quest = helper.QuestDefinition();
	quest.id = 'BoulderOutOfSpace'
	
	quest.encounters = {}
	quest.tags = {"EMERGENT"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Boulder from Space"),
						            text = || __D(2, "We see a colorful shooting star land not so far from us, and we decide to give it a closer inspection.\n\nOnce there, we feel a captivating energy coming from the still-flaming rock."),
						    		icon = || "Asst_WeirdMeteorite",
						    		who = || "mapCinematicId",
						            children = {
							    		
						            	 {
						    				type = DialogType.Custom,
						    				subtype = "item",
						    				onEnter = function (d,n)
						    					d.data.hero=cinematicMapHelper.PartyRandom(1)[0]
						    				end,
						                    item = || "pick",
						                    text = || __R(3, "Break it open."),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(4, "When the meteorite cracked open, it blew a puff of acrid fumes into our faces before revealing some valuable minerals inside.\n\nWe felt a bit dizzy for a long while afterwards."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.usePick,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
										    				exit = true
														}
										        	}
											    }
										     },
						    			},

						    			{
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Touch it!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "The call of its colorful glow was too captivating to resist, so we put our hands on the blazing rock.\n\nWe instantly felt a rush of energy flowing through our bodies, but the heat was just too intense to keep hold of it."),
										    		who = || "mapCinematicId",
										    		children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.touch,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
												    }
												}
									        }
		                                },

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Ignore it."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "Although its flaming colors were fascinating to look at, we decided to stop wasting time and get back on our mission without messing with it."),
										    		who = || "mapCinematicId",
										    		onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
										    		exit = true
												}
											}
									    }
						        	}
						        }
						    })

	quest.results = {
		
		usePick = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="item", itemId = "pick", amount = -1},
		}),

		touch = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="doDamage", amount = 3, targets = {params.hero}},
		}),
	}

	quest.interruptByChance = || helper.PriorityAndSlots(3, 2)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
