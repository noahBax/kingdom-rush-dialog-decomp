

do 
	local quest = helper.QuestDefinition();
	quest.id = 'PotionIdentifier'
	
	
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Potion Peddler"),
						            text = || __D(2, "A potion peddler meets us on the road.\n\n\"Hello, adventurers.\nMay I interest you in my potion identification services?\""),
						    		icon = || "Asst_PotionIdentifier",
						    		who = || "mapCinematicId",
						            children = {
								        {
								        	type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 20,
		                                    text = || __R(3, "Identify a potion."),
		                                    onChoose = function(d,n)
								            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
								            end,
		                                    onEnter = function (d,n)
		                                    	local resultsAvailable = {}
		                                    	
		                                    	table.insert(resultsAvailable, "healing")
	                                    		table.insert(resultsAvailable, "invigorating")
	                                    		table.insert(resultsAvailable, "elixir")
	                                    		table.insert(resultsAvailable, "poison")

		                                    	local randomOutcome = cinematicMapHelper.RandomItem(resultsAvailable)
		                                    	d.data.hero=cinematicMapHelper.PartyRandom(1)[0]

		                                    	d.data.outcome = randomOutcome
		                                    end,
		                                    children = { 
		                                    	{
										            id = "healing",
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "healing",
										            text = || __D(4, "The peddler handed the potion back to us with a smile.\n\n\"It's a healing potion.\nSafe travels, my friends.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.healing,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            id = "invigorating",
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "invigorating",
										            text = || __D(5, "The peddler handed the potion back to us with a grin.\n\n\"This is an invigorating potion. They're quite rare.\nTake care, travelers.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.invigorating,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            id = "elixir",
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "elixir",
										            text = || __D(6, "The peddler handed the potion back to us with widened eyes.\n\n\"Wow, an elixir of life!\nSeems like luck is on your side, adventurers.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.elixir,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        },
										        {
										            id = "poison",
										            type = DialogType.Dialog,
										            condition = |d| d.data.outcome == "poison",
										            text = || __D(7, "The peddler handed the potion back to us with a worried look.\n\n\"Well, this is definitely poison.\nGood thing you had me identify it.\nFarewell, heroes.\""),
										    		who = || "mapCinematicId",
										            children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.poison,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
										        }
										    }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(8, "Move on."),
		                                    onChoose = function(d,n)
								            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
								            end,
										    exit = true
		                                }
						        	}
						        }
						    })

	quest.results = {

		healing = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="item", itemId = "healthPotion", amount = 1},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		invigorating = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="item", itemId = "invigoratingPotion", amount = 1},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		elixir = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			{type="item", itemId = "elixirOfLife", amount = 1},
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
		poison = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20},
			
			{type="item", itemId = "unidentifiedPotion", amount = -1},
			}),
	}

	
	quest.interruptByChance = || helper.PriorityAndSlots(cinematicMapHelper.HasItemInInventory("unidentifiedPotion") and 3 or 0, 5)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	
	quest.maxInstancesInGame = 999;
	quest.maxInstancesInAdventure = 1;
end
