return {
    dialogs.CreateDialog("intro",  
    {
        {
            type = DialogType.Dialog,
            text = || "Pagras will never\nsurrender! We'll fight\nto the last man!",
            who = || "General",
            onChoose = || cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("General"),"Speak"),
            children = {
		 		{
		 			
		            type = DialogType.Dialog,
		            text = || "Zog will admire\nyour bravery! I promise\nyou a quick death!",
		            who = || "Chaman",
		            onChoose = || cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Chaman"),"Angry"),
		            exit = true
		        }
        	}
        }
    }),

    dialogs.CreateDialog("end",  
    {
        {
            type = DialogType.Dialog,
            text = || "Thank you lads!\nWe've been fighting these mongrels\nfor quite some time...",
            who = || "General",
            onChoose = || cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("General"),"Speak"),
            children = {
		 		{
		 			id = "questionsStart",
		            type = DialogType.Dialog,
		            text = || "...but the main attack\nis yet to come! Follow me!",
		            who = || "General",
		            onChoose = || cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("General"),"Speak"),
		            exit = true
		    
      
      
      
      
      
      
      
						
						
						
						
						
						
						            
						
						
						
      
      
      
      
						
						
						
						
						
			   
						
						
						
						
						
						
						
						
						
						
      
      
		        }
        	}
        }
    }),
}
