


do 
	local quest = helper.QuestDefinition();
	quest.id = 'AstralCultist'
	quest.encounters = {}
	quest.tags = {"ISOLATED"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "Astral Cultist"),
						            text = || __D(2, "All of a sudden, a mysterious robed figure projects itself in front of us.\n\n\"Your efforts to hinder the Unblinded's advances end here!\" the cultist says as he evokes a ball of dark energy and hurls it toward us before vanishing."),
						    		icon = || "Asst_Cultist",
						    		who = || "mapCinematicId",
						            children = {
								        {
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(3, "Shield your companions."),
						    				challenge = {
						    					requirements =  |t| t("ct_legend")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(4, "I jumped in front of the party, putting myself in harm's way in order to protect them.\n\nThe energy dissipated as soon as it touched my body.\n\nEither it was a mere illusion or it couldn't surpass the strength of my sacrifice."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.legendSuccess,
												    		rewardsParams = || {},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(5, "I jumped in front of the party, putting myself in harm's way in order to protect them.\n\nThe energy's blast sent me flying backwards for a great deal of damage."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.legendFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(6, "Counter the blast."),
						    				challenge = {
						    					requirements =  |t| t("ct_holy") or t("ct_unholy")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(7, "We evoked a divine energy ball of our own and sent it flying against the attack.\n\nThe evocations clashed against each other in a spectacular display of lights.\n\nWe survived the cultist's assassination attempt."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.divineSuccess,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(8, "We attempted to evoke a divine energy ball of our own, but the attack struck us as we were chanting the words of power.\n\nWe flew backwards, receiving a tremendous amount of damage."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.divineFailure,
												    		rewardsParams = |d| {hero = d.data.hero},
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
							    		{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(9, "Raise a magic shield."),
						    				challenge = {
						    					requirements =  |t| t("ct_magic")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(10, "We cried out the magic words and stomped our feet on the ground as we raised a magic shield in front of us.\n\nThe energy ball clashed against the shield, losing its strength.\n\nWe survived the cultist's assassination attempt."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicSuccess,
										    				rewardsParams = |d| {hero = d.data.hero},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
												    		exit = true
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(11, "We uttered the magic words and raised a magic shield in front of us.\n\nHowever, it was no match for the attack's might and was easily pierced.\n\nThe blast sent us flying backwards for a great deal of damage."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.magicFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("lastEmergent", (cinematicMapHelper.Guild().context.GetInt("stepCount")))
												            end,
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

		magicSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			
			}),
		magicFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doDamage", amount = 3, targets = cinematicMapHelper.PartyRandom(1)},
			}),
		legendSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {cinematicMapHelper.HeroByTag("ct_legend")}},

			
			}),
		legendFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = {cinematicMapHelper.HeroByTag("ct_legend")}},
			{type="doDamage", amount = 3, targets =  {cinematicMapHelper.HeroByTag("ct_legend")}},
			}),
		divineSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="applyModifier", category="energyMod", level =1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			
			}),
		divineFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level =-1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			{type="unit.attribute", kind = "health_max", amount = -1, targets = {params.hero}},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("shown")
									end)		
								}))
	helper.AddQuest(quest)

	
	quest.interruptByChance = || helper.PriorityAndSlots(3, 5)
	

	quest.maxInstancesInGame = 10;
	quest.maxInstancesInAdventure = 1;
end
