do 
	local quest = helper.QuestDefinition();
	quest.id = 'DevOrcAmbushWithVariant'
	quest.visual = "OrcAmbush01"
	
	quest.encounters = {'VariantsTest'}
	quest.tags = {"COMBAT","EASY","TERRAIN_PLAINS","TERRAIN_WOODS"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(0, "The Roaring Warhorn(DEV VARIANT)"),
						            text = || __D(0, "The tranquility was broken by the blast of an orc warhorn followed by a small raiding band of orcs!##\"It's an ambush!\" I shouted while everyone got ready for combat!"),
						    		who = || "mapCinematicId",
						    		icon = || "OrcAmbush",
						    		children = {
						    			{
						    				type = DialogType.Response,
								            text = || __R(0, "Aaambush!"),
								            exit = true,
											onChoose = function ()
											cinematicMapHelper.CurrentQuestStatus().context.SetObject("var", cinematicMapHelper.RandomItem({"A", "B", "C"}))
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters
											end	
		                                }
		                            }
						        }
						    })

	local resolveDialog =  dialogs.CreateDialog("resolve",  
					    {
					        {
					            type = DialogType.Dialog,
                            	onEnter = |d| d.SetData("results",cinematicMapHelper.InstantiateResults(quest.results.success,{})),
                            	narrator = || __N(0, "The Roaring Warhorn"),
                            	icon = || "OrcAmbush",
					    		who = || "mapCinematicId",
					    		onAfter = |d| cinematicMapHelper.ExecuteResult(d.data.results),
					    		exit = true
					        }
					    })
	local leaveCombatDialog =  dialogs.CreateDialog("leaveCombat",  
				    {
				        {
				            type = DialogType.Dialog,
                        	onEnter = |d| d.SetData("results",cinematicMapHelper.InstantiateResults(quest.results.leaveCombat,{})),
				            icon = || "OrcAmbush",
				            narrator = || __N(0, "The Roaring Warhorn"),
				    		who = || "mapCinematicId",
				    		onAfter = |d| cinematicMapHelper.ExecuteResult(d.data.results),
				    		exit = true
				        }
				    })

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
								}))

	quest.AddCinematic("onWinCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowDialogInstance(resolveDialog),	
							}))

	quest.AddCinematic("onLeaveCombat", cinematicMapHelper.Cinematic({
								cinematicMapHelper.ShowDialogInstance(leaveCombatDialog),	
							}))

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.lowR() },
			{type="gainXP", amount = config.rewards.xp.low(), targets = cinematicMapHelper.Party(), textOverride = "The Party received {xp}XP" , textOverrideParams = {xp = config.rewards.xp.low()} },
			}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = config.rewards.hpDamage.mid(), targets = cinematicMapHelper.Party(), textOverride = "The Party received -{hp}HP each for fleeing.", textOverrideParams = {hp = config.rewards.hpDamage.mid()}}				
		}),
	}

	quest.autoRevealWhenClose = |qs| false

	helper.AddQuest(quest)
end
