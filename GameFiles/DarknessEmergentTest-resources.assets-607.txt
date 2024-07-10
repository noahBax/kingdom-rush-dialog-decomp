do 
	local quest = helper.QuestDefinition();
	quest.id = 'DarknessEmergentTest'
	quest.encounters = {'combat_banditAmbush'}
	quest.tags = {"NARRATIVE"}

	local theDialog =  dialogs.CreateDialog("intro",  
							{
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(0, "Darkness Ambush"),
						            text = || __D(0, "The darkness surrounded us and we readied for a fight!"), 
						    		who = || "mapCinematicId",
						    		icon = || "OrcAmbush",
						    		children = {
	                                    {
						    				type = DialogType.Response,
								            text = || __R(0, "Fight On!"),
								            exit = true,
											onChoose = function ()
												cinematicMapHelper.CurrentQuestStatus().encounters = quest.encounters;
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
					            icon = || "OrcAmbush",
					            narrator = || __N(0, "Broken Caravan"),
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
					            narrator = || __N(0, "Broken Caravan"),
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

	quest.shouldRun = |status| cinematicMapHelper.DarknessLevel() > 2 and not (status.visited)

	quest.results = {
		success = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = config.rewards.loot.high()},
			{type="gainXP", amount = config.rewards.xp.high(), targets = cinematicMapHelper.Party(), textOverride = "The Party received {xp}XP" , textOverrideParams = {xp = config.rewards.xp.high()} },
			
		}),
		leaveCombat = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = config.rewards.hpDamage.mid(), targets = cinematicMapHelper.Party(), textOverride = "The Party received -{hp}HP each for fleeing.", textOverrideParams = {hp = config.rewards.hpDamage.mid()}}				
		}),
	}


	helper.AddQuest(quest)
end
