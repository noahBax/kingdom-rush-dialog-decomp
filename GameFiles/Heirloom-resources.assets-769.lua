

do 
	local quest = helper.QuestDefinition();
	quest.id = 'Heirloom'
	quest.visual = "WandererMage"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Heirloom"),
						            text = || __D(2, "Two brothers are arguing about who gets to keep their father's sword.\n\n\"I know you're the firstborn, but you are a merchant and I'm a warrior.\nI should keep it!\"\n\nThey eventually notice us and stare at us, waiting for an opinion."),
						    		icon = || "Asst_MorningQuarrel",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "The warrior!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "\"Huzzah! A fine sword like this should be put to use and not rust away in a display cabinet.\n\nHere, take this, I have no use for it anymore,\"\nsaid the warrior, handing us his old weapon."),
										    		who = || "mapCinematicId",
										    		children = {
										    			{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.soldier,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "The firstborn!"),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "The merchant smiles and grabs the sword before handing us a pouch of gold.\n\n\"'Tis a family relic, and therefore tradition should prevail. Good call, adventurers.\" "),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.oldest,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
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

		oldest = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 100},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
		soldier = cinematicMapHelper.Result(|params| {
			{type="unit.attribute", kind = "baseDamage", amount = 1, targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = config.rewards.starXp.eLow()},
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
