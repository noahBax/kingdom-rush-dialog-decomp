"mbf_ulgukhai_break_crystal"
{
    
    
    "AbilityBehavior"   "UNIT_TARGET | CINEMATIC"
    "AbilityTeamFilter" "TEAM_ALL"
    "AbilityCastRange" "1000"
    "AbilityCastMinRange" "0" 
    "AbilityCooldown"   "0"
    "AbilityAPCost"     "1"
    "AnimationID"   "Break"
    
    

   
    "AbilitySpecial"
    {
     
    }

    "OnAbilityAction"
    {
        "InvokeCallback"
        {
            "Callback" "wrapContext(abilityCinematicContext(%ABILITY), %onAction)"
        }
    }
}
