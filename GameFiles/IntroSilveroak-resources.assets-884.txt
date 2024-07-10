


do 
	local quest = helper.QuestDefinition();
	quest.id = 'IntroSilveroak'
	quest.visual = "ForestFire"
	quest.encounters = {}
	quest.tags = {"NOREPLACE"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Evil Heart"),
						            text = || __D(2, "The heart of the Silveroak Forest has been possessed by an evil spirit that is corrupting all natural life.\n\nWith the corrupted forest growing larger and ever more dangerous, it has come down to a fight or flight choice....\nAnd we're not the running type."),
						    		icon = || "Asst_SilveroakIntro",
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
								            	cinematicMapHelper.Guild().context.SetInt("arenaLevel", 1)
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
											cinematicMapHelper.OverrideInventory({"food","food","food","food","food","food","food","food","food","elixirOfLife","elixirOfLife","elixirOfLife","tent","tent","tent","coffee","coffee","coffee","rope","rope","rope","torch","torch","torch"})
											cinematicMapHelper.Guild().SetLoot(200)
										else 
											cinematicMapHelper.OverrideInventory({"food","food","food","food","food","tent","bandage","rope","coffee","coffee"})
											cinematicMapHelper.Guild().SetLoot(100)
										end
									end),
									cinematicMapHelper.ShowComic("ComicSilveroakIntro"),
									cinematicMapHelper.ShowDialogInstance(theDialog),	
								}))
	helper.AddQuest(quest)
end
