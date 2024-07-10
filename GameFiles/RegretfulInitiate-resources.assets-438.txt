


do 
	local quest = helper.QuestDefinition();
	quest.id = 'RegretfulInitiate'
	quest.visual = "Cultist"
	quest.encounters = {}
	quest.kindFlag = "Enigma"
	quest.tags = {"NARRATIVE","EASY","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Regretful Initiate"),
						            text = || __D(2, "A band of cultists scouts the area looking for someone.\n\nMeanwhile, a man in ceremonial purple robes calls us from behind a tree.\n\"I don't want to join their brainwashed lot.... Help me.\""),
						    		icon = || "Asst_Acolyte",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Help him\nrun away."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We hid the initiate among our group and tried to smuggle him past the band, but they immediately saw through our attempt and began casting spells at us.\n\nAlthough we took some damage, we managed to escape our pursuers."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.helpInitiate,
										    				onChoose = function()
												            	cinematicMapHelper.Guild().context.SetInt("linked.savedInitiate", 1)
												            end,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(5, "Sell him out."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(6, "We nodded at the initiate and told him to follow us, only to lead him straight toward the scouting party.\n\nThe robed men thanked us and handed us a pouch of gold for our trouble."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.sellInitiate,
										    				onChoose = function()
												            	cinematicMapHelper.Guild().context.SetInt("linked.savedInitiate", 0)
												            end,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		exit = true
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(7, "Move along."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(8, "We apologized to the initiate and continued our journey, choosing not to mess with Unblinded affairs."),
										    		who = || "mapCinematicId",
										    		exit = true
												}
									        }
		                                },
						        	}
						        }
						    })

	quest.results = {

		helpInitiate = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 2, targets = cinematicMapHelper.Party()},
			
			{type="applyModifier", category="luckMod", level =1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="giveXP", amount = params.hard and (config.rewards.starXp.eHigh() + config.rewards.starXp.eLow()) or (params.normal and config.rewards.starXp.eHigh() or config.rewards.starXp.eMid())},
			}),
		sellInitiate = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = params.hard and config.rewards.loot.high() or (params.normal and config.rewards.loot.mid() or config.rewards.loot.low())},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			{type="applyModifier", category="luckMod", level =-1, duration = config.rewards.buffDuration.luck(), targets = cinematicMapHelper.PartyRandom(2)},
			
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 1
end
