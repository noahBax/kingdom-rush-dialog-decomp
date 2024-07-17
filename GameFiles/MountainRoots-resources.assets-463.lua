

do 
	local quest = helper.QuestDefinition();
	quest.id = 'MountainRoots'
	quest.visual = "MountainWanderer"
	quest.kindFlag = "Enigma"
	
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Mountain Roots"),
						            text = || __D(2, "A root gatherer standing by the roadside tries to grab our attention.\n\n\"You there, you look like discerning travelers.\n\nCare to try some of our wonderful magic roots?\nJust 20 crowns a pop.\""),
						    		who = || "mapCinematicId",
						    		icon = || "Asst_MountainWanderer",
							    		children = {
								        {
						    				type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 20,
						    				text = || __R(3, "Root us up!"),
						    				onEnter = function (d,n)
		                                    	local resultsAvailable = {}

		                                    	
		                                    	table.insert(resultsAvailable, "a")
	                                    		table.insert(resultsAvailable, "b")
	                                    		
	                                    		table.insert(resultsAvailable, "d")
	                                    		table.insert(resultsAvailable, "e")
	                                    		
	                                    		table.insert(resultsAvailable, "g")
	                                    		table.insert(resultsAvailable, "h")
	                                    		table.insert(resultsAvailable, "i")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                    children = { 
		                                    	{
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "a",
										            text = || __D(4, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.a,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "b",
										            text = || __D(5, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.b,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        
										        
										        
										        
										    	
										        
												
										    	
										    	
										    	
										    	
												
												
										        
										        
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "d",
										            text = || __D(6, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.d,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "e",
										            text = || __D(7, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.e,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        
										        
										        
										        
										    	
										        
												
										    	
										    	
										    	
										    	
												
												
										        
										        
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "g",
										            text = || __D(8, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.g,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "h",
										            text = || __D(9, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.h,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "i",
										            text = || __D(10, "\"Here you go! Best roots this side of the Icewind Pass.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.i,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										    }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(11, "Keep going."),
										    exit = true
		                                }
						        	}
						        }
						    })



	quest.results = {
		a= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		b= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		
		
		
		
		
		d= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		e= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		
		
		
		
		
		g= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="doHeal", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		h= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="doHeal", amount = 2, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		i= cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="doDamage", amount = 1, targets = cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	
	
	
	

	helper.AddQuest(quest)
	
end
