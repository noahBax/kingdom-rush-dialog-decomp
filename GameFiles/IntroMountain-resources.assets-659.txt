

do 
	local quest = helper.QuestDefinition();
	quest.id = 'IntroMountain'
	quest.visual = "ForestFire"
	
	quest.encounters = {}
	quest.tags = {"NOREPLACE"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Stormcloud's Winter"),
						            text = || __D(2, "We reach the Glacial Heights after following the trail of the Unblinded Cult, our newfound enemies.\n\nReceiving news of strange energies surrounding the Stormcloud Temple, we make haste to stop the cult's plans."),
						    		icon = || "Asst_Mountain",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Begin the adventure!"),
		                                    onChoose = function(d,n)
								            	cinematicMapHelper.Guild().context.SetFloat("lootBonus", 0)
								            	cinematicMapHelper.Guild().context.SetFloat("xpBonus", 0)
								            	cinematicMapHelper.Guild().context.SetFloat("darknessBonus", 0)
								            	cinematicMapHelper.Guild().context.SetFloat("darkAmbushCounter", 0)
								            	cinematicMapHelper.Guild().context.SetInt("hasEscort", 0)
								            	cinematicMapHelper.Guild().context.SetInt("stepCount", 0)
								            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", 1)
								            	cinematicMapHelper.Guild().context.SetInt("linked.forestMorality", 0)
								            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", 0)
								            	cinematicMapHelper.Guild().context.SetInt("darknessRose", 0)
								            	cinematicMapHelper.Guild().context.SetInt("prevDarkness", 0)
								            	print("ADVENTURE INDEX: " .. cinematicMapHelper.AdventureIndex())
								            end,
		                                    exit = true
		                                }
						        	}
						        }
						    })


	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										if cinematicMapHelper.IsDifficultyEasy() then
											cinematicMapHelper.OverrideInventory({"food","food","food","food","food","food","food","food","food","food","food","food","elixirOfLife","elixirOfLife","elixirOfLife","tent","tent","tent","coffee","coffee","coffee","torch","torch","torch","pick","pick","pick"})
											cinematicMapHelper.Guild().SetLoot(150)
										else 
											cinematicMapHelper.OverrideInventory({"food","food","food","tent","rope","pick","coffee","coffee"})
											cinematicMapHelper.Guild().SetLoot(50)
										end
									end),
									cinematicMapHelper.ShowComic("ComicMountainIntro"),
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
end
