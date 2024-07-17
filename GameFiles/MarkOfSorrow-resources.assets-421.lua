

do 
	local quest = helper.QuestDefinition();
	quest.id = 'MarkOfSorrow'
	quest.visual = "GlareAltar"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WASTELAND"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Mark of Sorrow"),
						            text = || __D(2, "We come across some kind of monolith that looks like it belongs to the Cult, but is very different from the other artifacts we've seen until now.\n\nIt has a glowing, color-shifting symbol and some sort of head-sized hole in the middle."),
						    		icon = || "Asst_MarkOfSorrow",
						    		who = || "mapCinematicId",
						            children = {

							    		{
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Touch it!"),
		                                    onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "a")
	                                    		table.insert(resultsAvailable, "b")
	                                    		table.insert(resultsAvailable, "c")
	                                    		table.insert(resultsAvailable, "d")
	                                    		table.insert(resultsAvailable, "e")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                    children = { 
		                                    	{
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "a",
										            text = || __D(4, "One of us dared to touch the monolith, which made its symbol glow in a green color and completely shut off afterwards.\n\nAfter passing out for a while, our partner felt healthier than before."),
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
										            text = || __D(5, "One of us dared to touch the monolith, which made its symbol glow in a blue color and completely shut off afterwards.\n\nDespite being damaged by the energy, our partner felt stronger than before."),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.b,
										    				rewardsParams = |d| {hero = d.data.hero,hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										    
										    
										    
										    
										    
										    
														
										    
										    
										    
										    
												  
														
										    
										    
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "d",
										            text = || __D(7, "One of us dared to touch the monolith, which made its symbol glow in a red color and release a blast of energy that hit us all, before completely shutting off."),
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
										    
										    
										    
										    
										    
										    
														
										    
										    
										    
										    
												  
														
										    
										    
										    }
		                                },
								        {
						    				type = DialogType.Custom,
						    				subtype = "item",
						                    item = || "glareMask",
						                    text = || __R(11, "Insert the mask."),
						    				children = {
												{ 
													type = DialogType.Dialog,
			                                    	text = || __D(12, "Noticing that our mask could fit in the hole, we decided to give it a try.\n\nWe heard a dry click behind the mask, and then the monolith's symbol started to frantically change colors and irradiate an empowering energy."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.useMask,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				exit = true
														}
										        	}
											    }
										     }
						    			},

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(9, "Move on."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(10, "Not knowing the outcomes of interacting with the monolith, we decided not to risk it, and we resumed our journey."),
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
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
		}),

		b = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = {params.hero}},
			{type="doDamage", amount = 2, targets =  {params.hero}},
		}),

		
		
		
		
		

		d = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
		}),

		
		
		
		

		useMask = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eHigh()},
			{type="item", itemId = "glareMask", amount = -1},
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="unit.attribute", kind = "health_max", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.Party()},
		}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))


	helper.AddQuest(quest)
end
