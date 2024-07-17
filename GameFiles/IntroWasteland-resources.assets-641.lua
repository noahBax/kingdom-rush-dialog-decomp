

do 
	local quest = helper.QuestDefinition();
	quest.id = 'IntroWasteland'
	quest.visual = "ForestFire"
	
	quest.encounters = {}
	quest.tags = {"NOREPLACE"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Heart of Corruption"),
						            text = || __D(2, "We reach the Rift of Cinders, where the Glare's influence feels stronger than anywhere before, raising the dead and enraging the local demons.\n\nTime is running out. We need to put an end to this madness!"),
						    		icon = || "Asst_WastelandIntro",
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
											cinematicMapHelper.OverrideInventory({"food","food","food","food","food","food","food","food","food","food","elixirOfLife","elixirOfLife","elixirOfLife","tent","tent","tent","invigoratingPotion","invigoratingPotion","ringOfVitality","sharpeningStone"})
											cinematicMapHelper.Guild().SetLoot(250)
										else 
											cinematicMapHelper.OverrideInventory({"food","food","food","food","food","tent","coffee","bandage"})
											cinematicMapHelper.Guild().SetLoot(100)
										end
									end),
									cinematicMapHelper.ShowComic("ComicWastelandIntro"),
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
end
