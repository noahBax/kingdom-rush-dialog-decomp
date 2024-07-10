


do 
	local quest = helper.QuestDefinition();
	quest.id = 'ShroudedGift'
	quest.visual = "Altar"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Unblinded Gift"),
						            text = || __D(2, "We encounter a robed man standing atop a cult's altar.\n\n\"Well met, pilgrims.\nHast ye come to have the unblind'd gift bestow'd upon you?\n\nThe land is teeming with our sacred glare, and the observant highness forsakes not those who accept the unblind'd gift.\""),
						    		icon = || "Asst_Cultist",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Accept the gift."),
		                                    condition = function (d, n)
			                                    d.data.hero=cinematicMapHelper.PartyRandom(1)[0]
			                               		return true
		                                    end,
		                                    children = {
										        {
										        	
				                                    type = DialogType.Dialog,
				                                    text = || __D(4, "The cultist raised his hands and a swarm of spectral flies flew from under his hood into our mouths.\n\nWe waited to see what gift would be bestowed upon us."), 
				                                    who = || "mapCinematicId",
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    
				                                    onEnter = function (d,n)
				                                    	local resultsAvailable = {}

				                                    	
				                                    	table.insert(resultsAvailable, "a")
			                                    		table.insert(resultsAvailable, "b")
			                                    		table.insert(resultsAvailable, "c")
			                                    		table.insert(resultsAvailable, "d")
			                                    		table.insert(resultsAvailable, "f")

				                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
				                                    	

				                                    	d.data.outcome = randomOutcome
				                                    end,
				                                    children = { 
				                                    	{
												            type = DialogType.Dialog,
												            condition = |d| d.data.outcome == "a",
												            
												            text = || __D(5, "\"The unblind'd highness hath bestow'd upon you the gift of steel.\n\nMay ye carry the burdens of the shady blade with the same strength as ye strike your foes.\""),
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
												        },
												        {
												            type = DialogType.Dialog,
												            condition = |d| d.data.outcome == "b",
												            
												            text = || __D(6, "\"The unblind'd highness hath bestow'd upon you the gift of life.\n\nMay your extend'd existence aid ye in serving our unblind'd magnificence.\""),
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
												        },
												        {
												            type = DialogType.Dialog,
												            condition = |d| d.data.outcome == "c",
												            
												            text = || __D(7, "\"The unblind'd highness hath bestow'd upon you the gift of rejuvenation.\n\nShe giveth you life. Use this endowment well by taking the life of our foes.\""),
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
												        },
												        {
												            type = DialogType.Dialog,
												            condition = |d| d.data.outcome == "d",
												            
												            text = || __D(8, "\"The unblind'd highness hath bestow'd upon you the gift of sturdiness.\n\nYe shall carry upon your shoulders the weight of serving our unblind'd ways, but none shall hurt those shoulders.\""),
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
												        },
												       
												       
												       
												       
												    	
												        
														
												    	
												    	
												    	
												    	
														
														
												        
												        
												        {
												            type = DialogType.Dialog,
												            condition = |d| d.data.outcome == "f",
												           
												            text = || __D(9, "\"The unblind'd highness hath bestow'd upon you the gift of wisdom.\n\nMay your wiser selves become better servants to our revered unblind'd ways.\""),
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
												    },
				                                }
								        	}
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(10, "Refuse and move on."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(11, "The cultist shakes his head in disapproval.\n\n\"If only ye knew the power it giveth to the unblind'd ones.\n\nMove along, then. The unblind'd hath no use for unfaithful ones.\n\nYe will regret your decision, for this here land will be ours!\""),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(12, "Attack him."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(13, "We charged up the altar's stairs only to find both the cultist and the altar vanish in front of us.\n\nWe don't know if the altar disappeared before us or if it was an illusion all along."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                }
						        	}
						        }
						    })

	quest.results = {


		a = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			
			}),
		b = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "health_max", amount = 1, targets = {params.hero}},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			
			}),
		c = cinematicMapHelper.Result(|params| {
			{type="doHeal", amount = 99, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			
			}),
		d = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "armor_max", amount = 1, targets = cinematicMapHelper.PartyRandom(2)},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			
			}),
		
		
		
		
		
		
		f = cinematicMapHelper.Result(|params| {
			{type="giveStar", amount = 1},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			
			
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	
end
