

do 
	local quest = helper.QuestDefinition();
	quest.id = 'TheAshenLass'
	quest.visual = "Wanderer"
	quest.kindFlag = "Enigma"
	quest.encounters = {}
	quest.tags = {"NARRATIVE","NORMAL","TERRAIN_SILVEROAK"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            narrator = || __N(1, "The Ashen Lass"),
						            text = || __D(2, "At nightfall, we cross paths with a young red-haired woman.\n\n\"Oi! You're adventurers, ain't you?\" she says carelessly as she approaches. She proceeds to show us a large pouch, covered in as much ash dust as herself. Inside it, there are the most diverse pieces of junk. ||\"I am a novice adventurer! Tell you what. Teach me something about adventuring, and I will give you some of my own loot!\" \n\nWe are pretty much speechless; she doesn't look like an adventurer at all. She doesn't mind our silence and eagerly asks: \"What is the most important trait of a hero?\""),
						    		icon = || "Asst_AshenLass",
						    		who = || "mapCinematicId",
						            children = {
		                                {
		                                type = DialogType.Response,
		                                text = || __R(3, "Strength"),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(4, "The young woman let the answer sink in. Seconds later, she rummaged through the pouch and handed a crowbar over to us.\n\n\"This might come in handy to you!\" she said with a really big smile, and then she left, leaving us all puzzled. Even though she was strange, her enthusiasm lifted our spirits."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.strength,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                },
						                {
		                                type = DialogType.Response,
		                                text = || __R(5, "Wisdom"),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(6, "The young woman let the answer sink in. Seconds later, she rummaged through the pouch and handed a torch over to us.\n\n\"This might come in handy to you!\" she said with a really big smile, and then she left, leaving us all puzzled. Even though she was strange, her enthusiasm lifted our spirits."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.wisdom,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                },
						                {
		                                type = DialogType.Response,
		                                text = || __R(7, "Compassion"),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(8, "The young woman let the answer sink in. Seconds later, she rummaged through the pouch and handed a rope over to us.\n\n\"This might come in handy to you!\" she said with a really big smile, and then she left, leaving us all puzzled. Even though she was strange, her enthusiasm lifted our spirits."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.compassion,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                },
						                {
		                                type = DialogType.Response,
		                                text = || __R(9, "Ambition"),
		                                who = || "mapCinematicId",
									   	children = {
											{
												type = DialogType.Dialog,
							                   	text = || __D(10, "The young woman let the answer sink in. Seconds later, she rummaged through the pouch and handed a pickaxe over to us.\n\n\"This might come in handy to you!\" she said with a really big smile, and then she left, leaving us all puzzled. Even though she was strange, her enthusiasm lifted our spirits."),
									    		who = || "mapCinematicId",
									    		children = {
													{
									    				type = DialogType.Custom,
									    				subtype = "rewards",
									    				rewards = || quest.results.ambition,
									    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
											    		exit = true
														}
													}
												}
											}
						                },
						        	}
						        },
						    })

	quest.results = {
		strength = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "crowbar", amount = 1 },
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		wisdom = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "torch", amount = 1 },
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		compassion = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "rope", amount = 1 },
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
		ambition = cinematicMapHelper.Result(|params| {
			{type="item", itemId = "pick", amount = 1 },
			{type="applyModifier", category="luckMod", level = 1, duration = config.rewards.buffDuration.luck(), targets =  cinematicMapHelper.Party()},
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or config.rewards.starXp.eLow())},
			}),
	}

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end)		
								}))
	helper.AddQuest(quest)

	
end
