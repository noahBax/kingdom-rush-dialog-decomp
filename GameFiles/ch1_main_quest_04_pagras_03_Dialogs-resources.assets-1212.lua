return {

    dialogs.CreateDialog("holdThemOff",  
    {
        {
            type = DialogType.Dialog,
            text = || "Ok! Listen up!\nWe face their main attack now!",
            who = || "General", anim = || "Speak",
            children = 
            {
		 		{
		            type = DialogType.Dialog,
		            text = || "Check your flanks!\nDon't let them swarm us!\nReady?",
		            who = || "General", anim = || "Speak",
		            children = 
		            {
						{
		                    type = DialogType.Response,
		                    text = || "Erm... No!\nExplain please!",
		                    children = 
		                     {
						 		{
						            type = DialogType.Dialog,
						            text = || "We are outnumbered!\nUse obstacles to your advantage!",
						            who = || "General", anim = || "Speak", 
						            children = 
						            {
								 		{
								            type = DialogType.Dialog,
								            text = || "Take your stand!\nShow no fear and\ngive your best!",
								            who = || "General", anim = || "Speak",
								            children = 
								            {
										 		{
										            type = DialogType.Dialog,
										            text = || "For this day!\nWill be yours for all time!",
										            who = || "General", anim = || "Speak",
										            exit = true
								        		}
								        	}
						        		}
						        	}
						        }
						    }
						    
	        			},	
	        			{
		                    type = DialogType.Response,
		                    text = || "Ready!",
		                    children = 
				            {
						 		{
						            type = DialogType.Dialog,
						            text = || "Remember this day, men!\nFor it will be yours for all time!",
						            who = || "General", anim = || "Speak",
						            children = 
						            {
								 		{
								            type = DialogType.Dialog,
								            text = || "PAGRANS!\nPREPARE FOR GLORY!",
								            who = || "General", anim = || "Speak",
								            exit = true
						        		}
						        	}
				        		}
				        	}
						}
	        		}
        		}
			}
			
        }
    }),




    dialogs.CreateDialog("combatEnd",  
    {
        {
            type = DialogType.Dialog,
            text = || "That was some\ngood fighting you did there!",
            who = || "General", anim = || "Speak",
            children = 
            {
		 		{

		            type = DialogType.Dialog,
		            text = || "Felt like the old days!\nSmashing greenskins left and right!",
		            who = || "General", anim = || "Speak",
		            children = 
		            {
				 		{
				 			id = "questionsStart",
				            type = DialogType.Dialog,
				            text = |d| not dialogs.HasFlag(d, "saveWorld") and "So what\nbrought you here?" or "Anything else?",
				            who = || "General", anim = || "Speak",
				            children = 
				            {
				            	{
				                    type = DialogType.Response,
				                    text = || "We are saving the world!",
				                    condition = |d| not dialogs.HasFlag(d, "saveWorld"),
                            		onChoose = |d| dialogs.SetFlag(d, "saveWorld"),
				                    children = 
						            {
								 		{
								            type = DialogType.Dialog,
								            text = || "Haha!\nNot the first I heard that one!",
								            who = || "General", anim = || "Speak",
											children = 
								            {
										 		{
										            type = DialogType.Dialog,
										            text = || "It's a fools errand!\nWorld doesn't want to be saved!",
										            who = || "General", anim = || "Speak",
													jumpTo="questionsStart"
								        		}
								        	}
						        		}
						        	}
								},
								{
				                    type = DialogType.Response,
				                    text = || "We want you to join us!",
				                    children = 
				                     {
								 		{
								            type = DialogType.Dialog,
								            text = || "Mmm... I don't like where this is going!",
								            who = || "General", anim = || "Speak",
											jumpTo="Recruit"
								        }
								    }
								    
			        			},	
			        			
			        		}
        				}
        			}
        		}
			}
			
        },





        {


            type = DialogType.Dialog,
            text = || "Look lads! I'm not in\nthe hero business anymore!",
            who = || "General", anim = || "Speak",
            id = "Recruit",
            children = 
            {
		 		{
		            type = DialogType.Dialog,
		            text = || "The world has changed...\nit's time we change too.",
		            who = || "General", anim = || "Speak",
		            children = 
		            { 
		                {  
		                    type = DialogType.Response, 
		                    text = || "You owe us your life!",
		                    who = || nil, 
		                    children =
		                    { 
		                        {
		                            type = DialogType.Dialog,
		                            text = || "Mmm...\nGuess you got a point there...",
		                            who = || "General", anim = || "Speak",
		                            jumpTo="RecruitGuilt"
		                        }
		                    }
		                }, 

		                {  
		                    type = DialogType.Response, 
		                    text = || "You used to be a great hero!",
		                    who = || nil, 
		                    children =
		                    { 
		                        { 
		                            type = DialogType.Dialog,
		                            text = || "That was a\nlong time ago!",
		                            who = || "General", anim = || "Speak",
		                            jumpTo="RecruitPeople"
		                        }
		                    }
		                }, 

		                {  
		                    type = DialogType.Response, 
		                    text = || "Gerard!\n(stare at him)",
		                    who = |d| d.GetData("heroSpeaker"),
                    
		                    condition = function(d) 
		                    			
			                    			local varHero = cinematicHelper.RandomCinematicId({"Alleria","Female"})
			                    			if varHero == nil then
			                    				return false
			                    			else
			                    				d.SetData("heroSpeaker",varHero)
			                    				return true
			                    			end
                  						end,  
		                   	
		                   	children =
		                    { 
		                        { 
		                            type = DialogType.Dialog,
		                            text = || "Alleria...",
		                            who = || "General", anim = || "Speak",
		                            children =
				                    { 
				                        { 
				                            type = DialogType.Dialog,
				                            text = || "Gerard?",
				                            who = |d| d.GetData("heroSpeaker"),  anim = || "Speak",
				                            children =
						                    { 
						                        { 
						                            type = DialogType.Dialog,
						                            text = || "...",
						                            who = || "General", anim = || "Speak",
						                            children =
								                    { 
								                        { 
								                            type = DialogType.Dialog,
								                            text = || "Fine! I'll help!\nFor old times sake!",
								                            who = || "General", anim = || "Speak",
								                            jumpTo="Zog"
								                        }
								                    }
						                        }
						                    }
				                        }
				                    }
		                        }
		                    }
		                }, 
		  
		            }
		        }
		    }
        },

	


	        {


	            type = DialogType.Dialog,
	            text = || "...",
	            who = || "General", anim = || "Speak",
	            id = "RecruitGuilt",
	            children = 
	            {
			 		{
			            type = DialogType.Dialog,
			            text = || "...well...",
			            who = || "General", anim = || "Speak",
			            children = 
			            {
					 		{
					            type = DialogType.Dialog,
					            text = || "FINE!\nI'll come along...",
					            who = || "General", anim = || "Speak",
					            jumpTo="Zog"
					        }
					    }        
			        }
			    }        
	            
	        },

	


	        {
	            type = DialogType.Dialog,
	            text = || "We lost the war!\nThey won! The time of heroes is over!",
	            who = || "General", anim = || "Speak",
	            id = "RecruitPeople",
	           	children = 
		            { 
		                {  
		                    type = DialogType.Response, 
		                    text = || "You have a\nduty Gerard!",
		                    who = |d| d.GetData("heroSpeaker1"),
                    
		                    condition = function(d) 
		                    			
			                    			local varHero = cinematicHelper.RandomCinematicId({"Rodrick","Warrior"})
			                    			if varHero == nil then
			                    				return false
			                    			else
			                    				d.SetData("heroSpeaker1",varHero)
			                    				return true
			                    			end
                  						end,  



		                    children =
		                    { 
		                        {
		                            type = DialogType.Dialog,
		                            text = || "You question me?\nI did my duty already!",
		                            who = || "General", anim = || "Speak",
		                            children =
				                    { 
				                        {
				                            type = DialogType.Dialog,
				                            text = || "Duty never ends\nIt belongs to the people!\nNot Kingdoms!",
				                            who = |d| d.GetData("heroSpeaker1"),  anim = || "Speak",
				                            children =
						                    { 
						                        {
						                            type = DialogType.Dialog,
						                            text = || "If we can\nmake a difference we must!\nThat's what honor demands!",
						                            who = |d| d.GetData("heroSpeaker1"),  anim = || "Speak",
						                            children =
								                    { 
								                        {
								                            type = DialogType.Dialog,
								                            text = || "...",
								                            who = || "General", anim = || "Speak",
								                            children =
										                    { 
										                        {
										                            type = DialogType.Dialog,
										                            text = || "Damn you!\nYou are right!",
										                            who = || "General", anim = || "Speak",
										                            children =
												                    {
												                        {
												                            type = DialogType.Dialog,
												                            text = || "I swore to protect this land...\nand will never stop!",
												                            who = || "General", anim = || "Speak",
												                            jumpTo="Zog"
												                        }
												                    }
										                        }
										                    }
								                        }
								                    }
						                        }
						                    }
				                        }
				                    }
		                        }
		                    }
		                }, 

		                {  
		                    type = DialogType.Response, 
		                    text = || "It's time for retribution!",
		                     who = |d| d.GetData("heroSpeaker2"),
                    
		                    condition = function(d) 
		                    			
			                    			local varHero = cinematicHelper.RandomCinematicId({"Lorenzo","Archer"})
			                    			if varHero == nil then
			                    				return false
			                    			else
			                    				d.SetData("heroSpeaker2",varHero)
			                    				return true
			                    			end
                  						end,  
		                    children =
		                    { 
		                        { 
		                            type = DialogType.Dialog,
		                            text = || "You mean revenge?",
		                            who = || "General", anim = || "Speak",
		                            children =
				                    { 
				                        { 
				                            type = DialogType.Dialog,
				                            text = || "Better to die standing\nthan live on your knees Gerard!",
				                            who = |d| d.GetData("heroSpeaker2"),  anim = || "Speak",
				                            children =
						                    { 
						                        { 
						                            type = DialogType.Dialog,
						                            text = || "This is not the world you wan't to live in!",
						                            who = |d| d.GetData("heroSpeaker2"),  anim = || "Speak",
						                            children =
								                    { 
								                        { 
								                            type = DialogType.Dialog,
								                            text = || "I like your words!\nLet's change this world or\ngo down trying to!",
								                            who = || "General", anim = || "Speak",
								                            jumpTo="Zog"
								                        }
								                    }
						                        }
						                    }
				                        }
				                    }
		                        }
		                    }
		                }, 
		            }   
	        },

	


	        {


	            type = DialogType.Dialog,
	            
	            text = |d| (not dialogs.HasFlag(d, "askedZog")and not dialogs.HasFlag(d,"askedWhere")) and "But first we have to stop Zog!\nI have unfinished business with him!" or "Anything else?",
	            id = "Zog",
	            who = || "General", anim = || "Speak",
	            children = 
			            { 
			                {  
			                    type = DialogType.Response, 
			                    text = || "Who is\nthis Zog?",
			                    condition = |d| not dialogs.HasFlag(d, "askedZog"),
                            	onChoose = |d| dialogs.SetFlag(d, "askedZog"),     
			                    children =
			                    { 
			                        {
			                            type = DialogType.Dialog,
			                            text = || "The greenskin's chief!\nBig mean dumb ogre!",
			                            who = || "General", anim = || "Speak",
			                            jumpTo="Zog"
			                        }
			                    }
			                }, 

			                {  
			                    type = DialogType.Response, 
			                    text = || "Where do\nwe find him?",
			                    condition = |d| not dialogs.HasFlag(d, "askedWhere"),
                            	onChoose = |d| dialogs.SetFlag(d, "askedWhere"),         
			                    children =
			                    { 
			                        { 
			                            type = DialogType.Dialog,
			                            text = || "Their main camp\nis by the twin rivers!",
			                            who = || "General", anim = || "Speak",
			                            children =
					                    { 
					                        { 
					                            type = DialogType.Dialog,
					                            text = || "It is well defended!\nBut I think we can manage!",
					                            who = || "General", anim = || "Speak",
					                            jumpTo="Zog"
					                        }
					                    }
			                        }
			                    }
			                }, 
			                {  
			                    type = DialogType.Response, 
			                    text = || "Good!\nLet's get him!",
			                    who = || "nil", 
			                    children =
			                    { 
			                        { 
			                            type = DialogType.Dialog,
			                            text = || "It will be legendary!",
			                           	who = || "General", anim = || "Speak",
			                            exit = true
			                        }
			                    }
			                }, 
						}
	        },


    }),
}




